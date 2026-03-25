#import "template.typ": project

// --- KONFIGURATION AF FORMALIA ---
#let anslag = 21823 // Ændres manuelt når rapporten er færdig

// Anvender templaten på hele dokumentet
#show: project.with(
  title: "Systemudvikling og
softwarearkitektur",
  authors: ("Fornavn Efternavn", "Fornavn Efternavn", "Fornavn Efternavn"),
  date: "Marts 2026",
  toc-target: heading.where(level: 1).or(heading.where(level: 2).before(<bilag-start>)),
  anslag: anslag,
)

= Opstart og Projektstrategi
#include "sections/Opstart og projektstrategi.typ"
= Planlægning og tidsestimering
#include "sections/Planlægning og tidsestimering.typ"
= Forløbet
#include "sections/Forløbet.typ"
= Arkitektur og design
#include "sections/Arkitektur og design.typ"
= Diskussion
#include "sections/Diskussion.typ"
= Refleksion
#include "sections/Refleksion.typ"
= Litteraturliste
#bibliography("references.bib", title: none)

// --- BILAG SEKTION ---

= Bilag <bilag-start> // Label used for splitting ToC
/*
// Custom Appendix Outline
#outline(
  title: "Bilagsliste",
  target: heading.where(level: 2).after(<bilag-start>),
)
*/
// Opsætning: Gør level 2 overskrifter til "Bilag X" format
#set heading(numbering: (..nums) => {
  let vals = nums.pos()
  if vals.len() == 2 {
    // Level 2 (e.g., 8.1) vises som "Bilag A"
    return "Bilag " + numbering("A", vals.at(1)) + " -"
  }
})

// === C. INDSÆT DINE BILAG HERUNDER ===
// Husk: Brug '==' for titel, og '#pagebreak()' før hver ny.

#pagebreak()
== SMS <bilag:sms>
#include "bilag/sms.typ"

#pagebreak()
== Use Case Model <bilag:useCaseModel>
#include "bilag/useCaseModel.typ"
