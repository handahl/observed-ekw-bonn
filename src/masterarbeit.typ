// src/masterarbeit.typ  –  Masterarbeit (M.A.)
// SPDX-License-Identifier: MIT-0

#import "base.typ": *

#let masterarbeit-deckblatt(
  titel:             "Titel der Masterarbeit",
  vorname:           "Vorname",
  nachname:          "Nachname",
  strasse:           "Straße Hausnummer",
  plz-ort:           "12345 Stadt",
  matrikelnummer:    "xxxxxxxx",
  studiengang:       "Transkulturelle Studien/Kulturanthropologie",
  erstgutachter-in:  "Prof. Dr. Name",
  zweitgutachter-in: "Prof. Dr. Name",
  body,
) = {
  page(margin: margin-bound, numbering: none)[
    #set text(font: body-font, size: body-size, lang: "de")
    #align(center)[
      Philosophische Fakultät \
      der \
      Rheinischen Friedrich-Wilhelms-Universität Bonn
      #v(2em)
      Masterarbeit zur Erlangung des akademischen Grades \
      „Master of Arts (M.A.)"
      #v(2em)
      #text(size: 14pt, weight: "bold", style: "italic")[#titel]
      #v(2em)
      vorgelegt von \
      #vorname #nachname \
      #strasse \
      #plz-ort \
      Matrikelnummer: #matrikelnummer \
      Studiengang: #studiengang
    ]
    #v(2em)
    #align(left)[
      Erstgutachter:in: #erstgutachter-in \
      Zweitgutachter:in: #zweitgutachter-in
    ]
  ]
  pagebreak()
  body
}
