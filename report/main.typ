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

// --- BILAG SEKTION ---
#pagebreak()
= Bilag

// Opsætning af nummerering for bilag
// Level 1 (= Titel) bliver "Bilag A"
// Level 2 (== Underoverskrift) bliver "A.1"
#set heading(numbering: (..nums) => {
  let vals = nums.pos()
  if vals.len() == 1 {
    return "Bilag " + numbering("A", vals.at(0))
  } else {
    return numbering("A.1", ..nums)
  }
}, supplement: "Bilag")

#counter(heading).update(0)

// === C. INDSÆT DINE BILAG HERUNDER ===
// Hver fil bør starte med en = Overskrift (Level 1)
#include "bilag/eksempel.typ"



