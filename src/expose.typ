// src/expose.typ  –  Exposé (MA-Niveau)
// Import: #import "@preview/observed-ekw-bonn:0.1.0": *
//         #import "@preview/observed-ekw-bonn:0.1.0/src/expose.typ": expose
// SPDX-License-Identifier: MIT-0

#import "base.typ": *

#let expose(
  titel:          "Arbeitstitel des Forschungsvorhabens",
  vorname:        "Vorname",
  nachname:       "Nachname",
  email:          "s6mimust@uni-bonn.de",
  matrikelnummer: "xxxxxxxx",
  studiengang:    "M.A. Transkulturelle Studien/Kulturanthropologie",
  datum:          "01.06.2026",
  betreuer-in:    "Prof. Dr. Betreuer:in",
  art:            "Exposé zur Masterarbeit",
  body,
) = {
  // ── Titelblatt ──────────────────────────────────────────
  page(margin: margin-unbound, numbering: none)[
    #set text(font: body-font, size: body-size, lang: "de")
    #align(center)[
      Institut für Archäologie und Kulturanthropologie \
      Abteilung Empirische Kulturwissenschaft und Kulturanthropologie \
      Rheinische Friedrich-Wilhelms-Universität Bonn
      #v(2em)
      #text(size: 11pt)[#art]
      #v(0.8em)
      #text(size: 14pt, weight: "bold")[#titel]
      #v(2em)
      #vorname #nachname \
      #email \
      Matrikelnummer: #matrikelnummer \
      #studiengang \
      #v(0.5em)
      Eingereicht bei: #betreuer-in \
      #datum
    ]
  ]
  // ── Textteil ─────────────────────────────────────────────
  pagebreak()
  counter(page).update(1)
  set page(numbering: "1", number-align: center,
    margin: margin-unbound)
  show: set-body-text
  show: apply-headings
  body
}
