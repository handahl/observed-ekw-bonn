// ============================================================
// src/base.typ  –  Gemeinsame Formatierungsregeln
// Abteilung EKW/KA, IAK, Uni Bonn
// Quellen: Leitfaden Modulabschlussarbeiten & Masterarbeit 08/2022
//          Leitfaden Hausarbeit Prüfungsamt PhilFak 07/2025
//
// SPDX-License-Identifier: MIT-0
// ============================================================

// ── Schrift ──────────────────────────────────────────────────
// Leitfaden: "Times New Roman 12 pt ODER Arial 11 pt"
// TeX Gyre Termes ist eine freie, metrisch äquivalente Kopie von
// Times New Roman (Lizenz OFL-1.1). Gleiche Zeichenbreiten →
// identische Zeilen- und Seitenumbrüche. Vorinstalliert in der
// Typst Web App. Lokal:
//   https://www.gust.org.pl/projects/e-foundry/tex-gyre/termes
#let body-font   = "TeX Gyre Termes"
#let body-size   = 12pt
#let foot-size   = 10pt

// ── Ränder (Leitfaden C.II) ──────────────────────────────────
// ungebunden: links 2 cm, rechts 3 cm, oben/unten je 2 cm
// gebunden (Masterarbeit): links mind. 3 cm
#let margin-unbound = (top: 2cm, bottom: 2cm, left: 2cm,  right: 3cm)
#let margin-bound   = (top: 2cm, bottom: 2cm, left: 3cm,  right: 3cm)

// ── Basis-Textformatierung ────────────────────────────────────
// 1,5-zeilig, Blocksatz, Silbentrennung, Einzug erste Zeile 0,3 cm
// leading 0.9em ≈ 18 pt bei 12 pt Schriftgröße
#let set-body-text(doc) = {
  set text(font: body-font, size: body-size, lang: "de", hyphenate: true)
  set par(
    justify: true,
    leading: 0.9em,
    first-line-indent: (amount: 0.3cm, all: false),
  )
  doc
}

// ── Hängender Einzug für Literaturverzeichnis-Einträge ────────
// Negatives first-line-indent existiert in Typst nicht;
// Workaround: block mit linkem inset + h(-inset) als Outdent.
#let lit(body) = block(
  inset: (left: 1.4em),
  spacing: 0.4em,
)[#h(-1.4em)#body]

// ── Blockzitat (> 3 Zeilen: eingerückt, einzeilig) ────────────
#let blockquote(body) = pad(left: 0.3cm, right: 0.3cm)[
  #set par(leading: 0.5em)
  #body
]

// ── Zitationshelfer (amerikanische Zitierweise) ───────────────
// #acit("Meier", 1997, "45")   →  (Meier 1997: 45)
#let acit(author, year, page) = [(#author #year: #page)]
// #vcit("Meier", 1997, "45")   →  (vgl. Meier 1997: 45)
#let vcit(author, year, page) = [(vgl. #author #year: #page)]

// ── Überschriften-Show-Rules ──────────────────────────────────
#let apply-headings(doc) = {
  set heading(numbering: "1.")
  show heading.where(level: 1): it => {
    v(1.2em, weak: true)
    set text(size: 13pt, weight: "bold")
    it
    v(0.5em, weak: true)
  }
  show heading.where(level: 2): it => {
    v(0.9em, weak: true)
    set text(size: 12pt, weight: "bold")
    it
    v(0.3em, weak: true)
  }
  show heading.where(level: 3): it => {
    v(0.7em, weak: true)
    set text(size: 12pt, weight: "bold", style: "italic")
    it
    v(0.2em, weak: true)
  }
  doc
}
