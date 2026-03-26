// Custom Appendix Outline
#outline(
  title: none,
  target: heading.where(level: 2).after(<bilag-start>),
)

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
#include "../bilag/sms.typ"

#pagebreak()
== Use Case Model <bilag:useCaseModel>
#include "../bilag/useCaseModel.typ"

#pagebreak()
== Ordanalyse <bilag:ordanalyse>
#include "../bilag/ordanalyse.typ"

#pagebreak()
== Domænemodel <bilag:domænemodel>
#include "../bilag/domænemodel.typ"

#pagebreak()
== Spørgsmål til PO
<bilag:spørgsmålTilPO>
#include "../bilag/spørgsmålTilPO.typ"

#pagebreak()
== LLM forslag til Use Cases <bilag:useCasesLLM>
#include "../bilag/llm_uc_forslag.typ"

#pagebreak()
== Gantt diagram (faktisk) <bilag:Ganttdiagram>
#include "../bilag/Ganttdiagram.typ"

#pagebreak()
== Burndown Chart <bilag:BurndownChart>
#include "../bilag/BurndownChart.typ"
