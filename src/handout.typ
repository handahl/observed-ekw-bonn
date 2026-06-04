// src/handout.typ  –  Thesenpapier / Handout zum Referat
// SPDX-License-Identifier: MIT-0

#import "base.typ": body-font, lit

#let handout(
  vorname-nachname: "Vorname Nachname",
  veranstaltung:    "Vollständiger Titel der Veranstaltung",
  semester:         "Sommersemester 2026",
  dozent-in:        "Prof. Dr. Lehrperson",
  datum:            "TT.MM.JJJJ",
  thema:            "Thema des Vortrags",
  body,
) = {
  set page(paper: "a4",
    margin: (top: 2cm, bottom: 2cm, left: 2.5cm, right: 2.5cm),
    numbering: none)
  set text(font: body-font, size: 11pt, lang: "de", hyphenate: true)
  set par(justify: true, leading: 0.7em,
    first-line-indent: (amount: 0pt, all: false))

  grid(
    columns: (1fr, 1fr), gutter: 1em,
    align(left)[
      #text(weight: "bold")[#vorname-nachname] \
      #veranstaltung \
      #semester
    ],
    align(right)[
      #dozent-in \
      #datum \
      #text(style: "italic")[#thema]
    ],
  )
  line(length: 100%, stroke: 0.5pt)
  v(0.5em)
  align(center)[#text(size: 13pt, weight: "bold")[#thema]]
  v(0.5em)
  body
}
