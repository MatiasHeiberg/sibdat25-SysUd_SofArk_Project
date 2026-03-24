#import "template.typ": project

// Anvender templaten på hele dokumentet
#show: project.with(
  title: "Vores Semesterprojekt",
  authors: ("Fornavn Efternavn", "Fornavn Efternavn", "Fornavn Efternavn"),
  date: "Marts 2026",
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

