// src/themenfindung.typ  –  Planungsraster Themenfindung → Forschungsfrage
// Quelle: Leitfaden_Themenfindung_EKW_2026.docx (Stand 04/2026)
// SPDX-License-Identifier: MIT-0

#import "base.typ": body-font, body-size

#let themenfindung(body) = {
  set page(paper: "a4",
    margin: (top: 2cm, bottom: 2cm, left: 2cm, right: 3cm),
    numbering: "1", number-align: center)
  set text(font: body-font, size: body-size, lang: "de", hyphenate: false)
  set par(justify: false, leading: 0.8em,
    first-line-indent: (amount: 0pt, all: false))

  align(center)[
    #text(size: 11pt)[
      Abteilung Empirische Kulturwissenschaft und Kulturanthropologie, \
      Institut für Archäologie und Kulturanthropologie, Universität Bonn
    ]
    #v(0.5em)
    #text(size: 13pt, weight: "bold")[
      Leitfaden – von der Themenfindung zur Konzeption \
      des Forschungsfeldes und der Forschungsfrage(n)
    ]
    #v(0.2em)
    #text(size: 10pt, style: "italic")[Stand 04/2026]
  ]
  v(0.5em)
  [Die folgende Tabelle soll helfen, grundlegende Ideen in Einzelschritten zu formulieren und mit Kommiliton:innen, Dozent:innen oder im Mentorat zu besprechen. So ausführlich wie möglich ausfüllen – Lücken und offene Fragen sollen sichtbar werden.]
  v(0.5em)

  table(
    columns: (0.47fr, 0.53fr),
    stroke: 0.5pt, inset: 7pt,
    fill: (_, row) => if calc.even(row) { luma(245) } else { white },
    table.header(
      text(weight: "bold")[Schritt / Frage],
      text(weight: "bold")[Antwort / Notizen],
    ),
    [*Forschungsinteresse* \ (persönlich und fachlich)], [],
    [*Relevanz des Themas* \ (fachlich, gesellschaftlich, feldbezogen)], [],
    [*Forschungsgegenstand* \
     (Handlungen, Akteur:innen, Orte/Räume, Objekte,
      Bedeutungszuschreibungen, Diskurse …)], [],
    [*Vorannahmen, Meinungen und Stereotype vom Feld* \
     (Was erwarte ich, vorzufinden?)], [],
    [*Forschungspraktische Eingrenzungen* \
     (Machbarkeit: Akteur:innen, Ressourcen, Zugänge)], [],
    [*Forschungsethische Fragen / Eingrenzungen / Bedingungen*], [],
    [*Analytische Forschungsfrage und Teilfragen* \ (erste Versuche)], [],
  )
  v(1em)
  body
}
