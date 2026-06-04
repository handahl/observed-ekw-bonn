## observed-ekw-bonn

Typst templates for academic writing at the Department of Empirical Cultural Science and Cultural Anthropology (EKW/KA), Institute for Archaeology and Cultural Anthropology, University of Bonn.

Includes: Modulabschlussarbeit · Masterarbeit · Exposé · Referat-Handout · Exzerpt · Themenfindungsraster.

Formats comply with the department's *Leitfaden für Modulabschlussarbeiten und Masterarbeit* (08/2022) and the *Leitfaden Hausarbeit* of the Philosophische Fakultät (07/2025).

---

### Schnellstart / Quick start

**Option 1 – Typst Web App (empfohlen / recommended)**

1. [typst.app](https://typst.app/) öffnen und einloggen
2. *Start from template* → `observed-ekw-bonn` suchen
3. Projekt erstellen, `main.typ` öffnen, Metadaten ausfüllen

**Option 2 – Kommandozeile**

```sh
typst init @preview/observed-ekw-bonn:0.1.0 meine-hausarbeit
cd meine-hausarbeit
typst watch main.typ
```

**Option 3 – VS Code**

1. [VS Code](https://code.visualstudio.com/) installieren
2. Extension [Tinymist Typst](https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist) installieren
3. `typst init` wie Option 2, dann Ordner in VS Code öffnen

---

### Verfügbare Vorlagen / Available templates

| Modul | Import |
|---|---|
| Modulabschlussarbeit (Hauptvorlage) | `template/main.typ` – automatisch beim `init` |
| Exposé | `#import "@preview/observed-ekw-bonn:0.1.0/src/expose.typ": expose` |
| Masterarbeit-Deckblatt | `#import "@preview/observed-ekw-bonn:0.1.0/src/masterarbeit.typ": masterarbeit-deckblatt` |
| Referat-Handout | `#import "@preview/observed-ekw-bonn:0.1.0/src/handout.typ": handout` |
| Exzerpt | `#import "@preview/observed-ekw-bonn:0.1.0/src/exzerpt.typ": exzerpt` |
| Themenfindungsraster | `#import "@preview/observed-ekw-bonn:0.1.0/src/themenfindung.typ": themenfindung` |

---

### Schrift / Font

Uses **TeX Gyre Termes** — a metrically identical free replacement for Times New Roman (license: OFL-1.1). Pre-installed in the Typst Web App. For local use, download from [gust.org.pl](https://www.gust.org.pl/projects/e-foundry/tex-gyre/termes) and install system-wide or pass `--font-path ./fonts/` to the compiler.

The department's *Leitfaden* requires Times New Roman 12 pt or Arial 11 pt. TeX Gyre Termes is metrically equivalent and produces identical line and page breaks.

---

### Formatierung / Formatting

```
Schrift:       TeX Gyre Termes 12 pt  (≡ Times New Roman 12 pt)
Zeilenabstand: 1,5-zeilig  (leading 0.9em)
Textformat:    Blocksatz, Silbentrennung
Absatzeinzug:  erste Zeile 0,3 cm
Ränder:        oben/unten 2 cm · links 2 cm (gebunden: 3 cm) · rechts 3 cm
Seitenzählung: Deckblatt + IHV mitgezählt, keine Zahl gedruckt
               arabische Ziffern ab Einleitung = Seite 1
```

### Gliederungsverhältnisse

| Teil | Anteil |
|---|---|
| Einleitung | ~10 % |
| Grundlagenteil | ~20 % |
| Hauptteil | ~60 % |
| Fazit/Ausblick | ~10 % |

### Umfänge

| Format | Zeichen (inkl. Leerzeichen) | Seiten |
|---|---|---|
| Exposé | ~10.000 | ~5 |
| Modulabschlussarbeit | 30.000–50.000 | 15–25 |
| Masterarbeit | 120.000–240.000 | 60–120 |

Zeichenzahl exklusive IHV, Literaturverzeichnis, Anhang.

---

### Zitierweise / Citation helpers

Bevorzugt: amerikanische Zitierweise `(Nachname Jahr: Seite)`

```typst
#acit("Meier", 1997, "45")   // → (Meier 1997: 45)
#vcit("Meier", 1997, "45")   // → (vgl. Meier 1997: 45)
```

---

### Lizenz / License

[MIT-0](https://choosealicense.com/licenses/mit-0/) — vollständig frei, keine Namensnennung erforderlich. Arbeiten, die mit dieser Vorlage erstellt werden, unterliegen keinerlei Lizenzpflichten.

MIT-0 — completely free, no attribution required. Documents produced with this template carry no license obligations.
