// src/exzerpt.typ  –  Exzerpt-Vorlage
// SPDX-License-Identifier: MIT-0

#import "base.typ": body-font, body-size, margin-unbound, lit

#let exzerpt(
  autor:           "Nachname, Vorname",
  titel:           "Titel des Werkes",
  in-quelle:       "",
  ort-jahr:        "Ort Jahr",
  seiten:          "S. 1–250",
  exzerpiert-von:  "Vorname Nachname",
  datum:           "TT.MM.JJJJ",
  zweck:           "Grundlagenteil Modulabschlussarbeit",
  body,
) = {
  set page(paper: "a4", margin: margin-unbound,
    numbering: "1", number-align: center)
  set text(font: body-font, size: body-size, lang: "de", hyphenate: true)
  set par(justify: true, leading: 0.9em,
    first-line-indent: (amount: 0pt, all: false))

  strong[Exzerpt] + h(1em)
  text(style: "italic")[exzerpiert von #exzerpiert-von, #datum]
  v(0.2em)
  strong[Zweck:] + [ #zweck]
  line(length: 100%, stroke: 0.5pt)
  v(0.3em)
  strong[Quelle:] + [ #autor: #titel#if in-quelle != "" [. #in-quelle]. #ort-jahr, #seiten.]
  v(0.6em)
  body
}
