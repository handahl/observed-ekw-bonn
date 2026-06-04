#!/usr/bin/env bash
# =============================================================
# setup.sh  –  observed-ekw-bonn development environment setup
# Installs: Typst CLI, Podman (if absent), oxipng (optional)
# Validates: package-check, test compile, thumbnail generation
#
# Supported: Debian/Ubuntu · Fedora/RHEL · Arch · macOS (Homebrew)
# Usage:     bash setup.sh [--check-only] [--no-thumbnail]
# =============================================================
set -euo pipefail

PKG_DIR="$(cd "$(dirname "$0")/.." && pwd)/0.1.0"
CHECK_ONLY=0
NO_THUMBNAIL=0

for arg in "$@"; do
  case $arg in
    --check-only)   CHECK_ONLY=1 ;;
    --no-thumbnail) NO_THUMBNAIL=1 ;;
  esac
done

# ── colour helpers ────────────────────────────────────────────
red()   { printf '\033[0;31m%s\033[0m\n' "$*"; }
green() { printf '\033[0;32m%s\033[0m\n' "$*"; }
blue()  { printf '\033[0;34m%s\033[0m\n' "$*"; }
die()   { red "ERROR: $*"; exit 1; }

blue "=== observed-ekw-bonn setup ==="
echo "Package directory: $PKG_DIR"

# ── detect OS / package manager ───────────────────────────────
if [[ "$OSTYPE" == "darwin"* ]]; then
  OS=mac
elif command -v apt-get &>/dev/null; then
  OS=debian
elif command -v dnf &>/dev/null; then
  OS=fedora
elif command -v pacman &>/dev/null; then
  OS=arch
else
  die "Unsupported OS. Install Typst manually: https://github.com/typst/typst/releases"
fi

# ── install Typst ─────────────────────────────────────────────
install_typst() {
  blue "Installing Typst..."
  case $OS in
    mac)    brew install typst ;;
    debian) 
      # typst not in apt; use official installer or cargo
      if command -v cargo &>/dev/null; then
        cargo install typst-cli
      else
        LATEST=$(curl -sI https://github.com/typst/typst/releases/latest \
          | grep -i location | sed 's|.*/v||;s/[[:space:]]*//')
        ARCH=$(uname -m)
        URL="https://github.com/typst/typst/releases/latest/download/typst-${ARCH}-unknown-linux-musl.tar.xz"
        curl -L "$URL" | tar -xJ --strip-components=1 -C /usr/local/bin typst-*/typst
      fi
      ;;
    fedora) 
      if ! dnf install -y typst 2>/dev/null; then
        # fallback to binary
        ARCH=$(uname -m)
        URL="https://github.com/typst/typst/releases/latest/download/typst-${ARCH}-unknown-linux-musl.tar.xz"
        curl -L "$URL" | tar -xJ --strip-components=1 -C /usr/local/bin typst-*/typst
      fi
      ;;
    arch)   pacman -S --noconfirm typst ;;
  esac
}

if ! command -v typst &>/dev/null; then
  [[ $CHECK_ONLY -eq 1 ]] && die "typst not found. Run without --check-only to install."
  install_typst
fi
green "✓ typst $(typst --version)"

# ── install Podman (for package-check container) ──────────────
install_podman() {
  blue "Installing Podman..."
  case $OS in
    mac)    brew install podman; podman machine init; podman machine start ;;
    debian) apt-get install -y podman ;;
    fedora) dnf install -y podman ;;
    arch)   pacman -S --noconfirm podman ;;
  esac
}

if ! command -v podman &>/dev/null && ! command -v docker &>/dev/null; then
  [[ $CHECK_ONLY -eq 1 ]] && die "Neither podman nor docker found."
  install_podman
fi

CONTAINER_CMD=$(command -v podman || command -v docker)
green "✓ container runtime: $CONTAINER_CMD"

# ── optional: oxipng for thumbnail compression ────────────────
if ! command -v oxipng &>/dev/null && [[ $NO_THUMBNAIL -eq 0 ]]; then
  blue "oxipng not found – thumbnail will not be compressed (optional)."
fi

# ── run package-check ─────────────────────────────────────────
blue "\n=== Running typst-package-check ==="
$CONTAINER_CMD run --rm \
  -v "$PKG_DIR":/data:ro,Z \
  ghcr.io/typst/package-check check \
  && green "✓ package-check passed" \
  || die "package-check failed. Fix errors above before submitting."

# ── test compile ─────────────────────────────────────────────
blue "\n=== Test compile: template/main.typ ==="

# Register package locally so @preview/ import resolves
DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
LOCAL_PKG="$DATA_HOME/typst/packages/preview/observed-ekw-bonn/0.1.0"
if [[ ! -d "$LOCAL_PKG" ]]; then
  blue "Registering package locally at $LOCAL_PKG..."
  mkdir -p "$(dirname "$LOCAL_PKG")"
  ln -sfn "$PKG_DIR" "$LOCAL_PKG"
  green "✓ symlink created"
fi

TMPDIR=$(mktemp -d)
trap 'rm -rf "$TMPDIR"' EXIT

typst init "@preview/observed-ekw-bonn:0.1.0" "$TMPDIR/test-project" \
  2>/dev/null || {
  # typst init requires the package to be in the index; use direct copy instead
  cp -r "$PKG_DIR/template/." "$TMPDIR/test-project/"
  # Rewrite @preview import to local path for compile test
  sed 's|@preview/observed-ekw-bonn:0.1.0|'"$PKG_DIR/src/lib.typ"'|' \
    "$TMPDIR/test-project/main.typ" > "$TMPDIR/test-project/main_local.typ"
}

COMPILE_TARGET="${TMPDIR}/test-project/main_local.typ"
[[ -f "$COMPILE_TARGET" ]] || COMPILE_TARGET="${TMPDIR}/test-project/main.typ"

typst compile "$COMPILE_TARGET" "$TMPDIR/output.pdf" \
  && green "✓ template compiles successfully" \
  || die "Compilation failed. Fix errors in template/main.typ."

# ── generate thumbnail ────────────────────────────────────────
if [[ $NO_THUMBNAIL -eq 0 ]]; then
  blue "\n=== Generating thumbnail ==="
  typst compile \
    -f png --pages 1 --ppi 250 \
    "$COMPILE_TARGET" \
    "$PKG_DIR/thumbnail.png" \
    && green "✓ thumbnail.png generated" \
    || { red "Thumbnail generation failed (non-fatal, continuing)"; }

  if command -v oxipng &>/dev/null && [[ -f "$PKG_DIR/thumbnail.png" ]]; then
    oxipng -o 4 "$PKG_DIR/thumbnail.png"
    green "✓ thumbnail compressed with oxipng"
  fi

  if [[ -f "$PKG_DIR/thumbnail.png" ]]; then
    SIZE=$(du -k "$PKG_DIR/thumbnail.png" | cut -f1)
    [[ $SIZE -gt 3072 ]] && \
      red "WARNING: thumbnail.png is ${SIZE}KB (limit: 3072KB). Run oxipng." || \
      green "✓ thumbnail size OK (${SIZE}KB)"
  fi
fi

blue "\n=== All checks passed ==="
green "Package is ready for submission."
echo ""
echo "Next steps:"
echo "  1. Review thumbnail.png visually"
echo "  2. Fork https://github.com/typst/packages (sparse checkout recommended)"
echo "  3. Copy $PKG_DIR → packages/preview/observed-ekw-bonn/0.1.0/"
echo "  4. git add . && git commit -m 'Add observed-ekw-bonn:0.1.0'"
echo "  5. Open pull request"
echo "  OR: typship submit (if installed)"
