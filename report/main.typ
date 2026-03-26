#import "template.typ": project

// --- KONFIGURATION AF FORMALIA ---
#let anslag = 33488 // Ændres manuelt når rapporten er færdig

// Anvender templaten på hele dokumentet
#show: project.with(
  title: "Systemudvikling og
softwarearkitektur",
  authors: ("Lasse Agerskov", "Anna Vognstoft", "Matias Heiberg Nielsen"),
  date: "Marts 2026",
  toc-target: heading.where(level: 1).or(heading.where(level: 2).before(<body-end>)),
  anslag: anslag,
)

= Opstart og Projektstrategi
#include "sections/Opstart og projektstrategi.typ"

= Planlægning og tidsestimering
#include "sections/Planlægning og tidsestimering.typ"

= Elaboration
#include "sections/Forløbet.typ"

= Arkitektur og design
#include "sections/Arkitektur og design.typ"

= Diskussion
#include "sections/Diskussion.typ"

= Refleksion
#include "sections/Refleksion.typ"

= Litteraturliste
#bibliography("references.bib", title: none)

= Bilag <body-end>
#include "sections/bilag.typ"
