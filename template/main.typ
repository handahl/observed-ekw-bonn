// ============================================================
// Modulabschlussarbeit / Hausarbeit
// Abteilung Empirische Kulturwissenschaft und Kulturanthropologie
// IAK, Rheinische Friedrich-Wilhelms-Universität Bonn
//
// Vorlage: @preview/observed-ekw-bonn:0.1.0
// Leitfäden: MAA 08/2022 · Hausarbeit PhilFak 07/2025
// Umfang:   30.000–50.000 Zeichen (15–25 S.) exkl. IHV/LV/Anhang
//
// SPDX-License-Identifier: MIT-0
// ============================================================

#import "@preview/observed-ekw-bonn:0.1.0": *

// ────────────────────────────────────────────────────────────
// METADATEN  ← hier ausfüllen
// ────────────────────────────────────────────────────────────
#let meta = (
  titel:          "Titel der Modulabschlussarbeit",
  vorname:        "Vorname",
  nachname:       "Nachname",
  strasse:        "Straße Hausnummer",
  plz-ort:        "12345 Stadt",
  telefon:        "0228 xxxxxx",
  email:          "s6mimust@uni-bonn.de",
  matrikelnummer: "xxxxxxxx",
  fachsemester:   3,
  semester:       "Wintersemester 2025/26",
  modul:          "Modulname",
  veranstaltung:  "Seminar: Vollständiger Titel der Veranstaltung",
  lehrperson:     "Prof. Dr. Lehrperson",
  abgabedatum:    "31.03.2026",
)

// ════════════════════════════════════════════════════════════
// DECKBLATT  (Seite 1 – mitgezählt, keine Zahl gedruckt)
// ════════════════════════════════════════════════════════════
#set page(paper: "a4", margin: margin-unbound, numbering: none)
#set text(font: body-font, size: body-size, lang: "de", hyphenate: true)

#align(center)[
  Institut für Archäologie und Kulturanthropologie \
  Abteilung Empirische Kulturwissenschaft und Kulturanthropologie \
  Rheinische Friedrich-Wilhelms-Universität Bonn

  #v(2.5em)
  #text(size: 14pt, weight: "bold")[#meta.titel]
  #v(2.5em)

  Vorgelegt von \
  #meta.vorname #meta.nachname \
  #meta.strasse \
  #meta.plz-ort \
  Telefon: #meta.telefon \
  E-Mail: #meta.email \
  Matrikelnummer: #meta.matrikelnummer \
  Fach: Empirische Kulturwissenschaft und Kulturanthropologie \
  #meta.fachsemester. Fachsemester
]

#v(2em)
#align(left)[
  als Seminarprüfung im #meta.semester \
  #meta.modul \
  #meta.veranstaltung \
  geleitet von #meta.lehrperson \
  Abgabetermin: #meta.abgabedatum
]

// ════════════════════════════════════════════════════════════
// INHALTSVERZEICHNIS  (Seite 2 – mitgezählt, keine Zahl)
// ════════════════════════════════════════════════════════════
#pagebreak()
#counter(page).update(2)
#set par(first-line-indent: (amount: 0pt, all: false))
#outline(title: "Inhaltsverzeichnis", indent: 1.5em)

// ════════════════════════════════════════════════════════════
// TEXTTEIL  (arabische Ziffern ab Seite 1 = Einleitung)
// ════════════════════════════════════════════════════════════
#pagebreak()
#counter(page).update(1)
#set page(numbering: "1", number-align: center)
#show: set-body-text
#show: apply-headings

// ── 1. EINLEITUNG  (~10 %, ca. 1–2 Seiten) ──────────────────
= Einleitung

// Hinführung zum Thema · fachwissenschaftliche Relevanz ·
// Verortung im Fach · konkrete Forschungsfragen ·
// kurze Methoden- und Quellenübersicht · Aufbauübersicht

Lorem ipsum – Hinführung und Relevanz …

Die leitende Forschungsfrage lautet: …

// ── 2. GRUNDLAGENTEIL  (~20 %, ca. 4–7 Seiten) ──────────────
= Grundlagenteil

// Empirische Methoden ausführlich präzisieren (bei empirischen
// Arbeiten Pflicht). Begriffsdefinitionen. Theorierahmen.
// Forschungsstand: mind. 10–15 Titel.

== Methoden

== Theoretischer Rahmen

== Forschungsstand

// ── 3. HAUPTTEIL  (~60 %, ca. 8–13 Seiten) ──────────────────
= [Thematischer Kapitelname]

// Forschungsfrage in logisch aufbauenden Schritten beantworten.
// Quellen in Verbindung mit Theorie analysieren.
// Eigenständige, konsistente Argumentation.

== [Unterkapitel 1]

== [Unterkapitel 2]

// ── 4. FAZIT UND AUSBLICK  (~10 %, ca. 2–3 Seiten) ──────────
= Fazit und Ausblick

// Ergebnisse zusammenfassen · Forschungsfrage beantworten ·
// Ausblick auf Anschlussforschungen

// ════════════════════════════════════════════════════════════
// LITERATURVERZEICHNIS  (zählt nicht zum Zeichenumfang)
// ════════════════════════════════════════════════════════════
#pagebreak()
#heading(numbering: none)[Literaturverzeichnis]

#set par(first-line-indent: (amount: 0pt, all: false))

// Monografie:
//   Nachname, Vorname: Titel. Untertitel (Reihe Bd.). Ort Jahr.
// Aufsatz in Sammelband:
//   Nachname, Vorname: Titel. In: Vorname Nachname (Hg.):
//     Bandtitel. Ort Jahr, S. von-bis.
// Zeitschriftenaufsatz:
//   Nachname, Vorname: Titel. In: Zeitschrift Jg./H. (Jahr), S. von-bis.

#lit[Autor, Vorname: Titel der Monografie. Ort Jahr.]

#lit[Autor, Vorname/Zweitautor, Vorname: Titel des Aufsatzes.
In: Zeitschrift für Volkskunde 97 (2001), S. 1–20.]

// ── Quellenverzeichnis (Empirie) ─────────────────────────────
#heading(level: 2, numbering: none)[Quellenverzeichnis (Empirie)]

// Interview mit [Name/Pseudonym], [Datum], [Dauer in Min.].
// Teilnehmende Beobachtung [Ort], [Datum], [Dauer].

// ════════════════════════════════════════════════════════════
// ANHANG  (eigenes Inhaltsverzeichnis; zählt nicht zum Zeichenumfang)
// ════════════════════════════════════════════════════════════
#pagebreak()
#heading(numbering: none)[Anhang]

// A. Interviewtranskripte (anonymisiert, paginiert, Zeilennummern)
// B. Beobachtungsprotokolle / Feldnotizen
// C. Abbildungen, Screenshots, Mental Maps etc.

// ════════════════════════════════════════════════════════════
// SELBSTSTÄNDIGKEITSERKLÄRUNG
// ════════════════════════════════════════════════════════════
#pagebreak()
#heading(numbering: none)[Selbstständigkeitserklärung]

Ich versichere, dass ich die vorliegende Arbeit selbstständig und
ohne unerlaubte fremde Hilfe angefertigt habe und keine anderen als
die angegebenen Quellen und Hilfsmittel benutzt habe. Die Stellen
der Arbeit, die anderen Werken dem Wortlaut oder dem Sinn nach
entnommen sind, habe ich in jedem einzelnen Fall unter Angabe der
Quelle als Entlehnung kenntlich gemacht.

#v(2em)
Bonn, den #meta.abgabedatum #h(3cm) Unterschrift: #h(5cm)
