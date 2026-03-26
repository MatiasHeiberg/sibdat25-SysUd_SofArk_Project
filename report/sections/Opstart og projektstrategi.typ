
== Det kunstige problemdomæne <sektion:detKunstigeProblemdomæne>
Vores projekt har fokuseret på en case bestående af _Bostedet Tulipanvej_, der huser mentalt udfordrede borgere. Derudover tilbyder stedet bostøtte, hvilket er en støtteordning, som borgerne modtager i hjemmet som en overgang til at kunne bo selvstændigt i egen bolig. Vores domænekendskab bygger på en privat samtale, vi havde med en specialpædagog, Laura, der arbejder i bostøtten. Ud fra den lærte vi, at pædagogerne har ansvaret for at koordinere og planlægge borgerbesøgene, og hvem der bruger deres begrænsede antal biler hvornår. Denne ad hoc-koordinering er kritisk for arbejdsgangen, da de supporterer borgere i hele Silkeborg Kommune. Senere  modtog vi en SMS fra Laura (@bilag:sms), hvorfra vi kunne udlede:
- 14 pædagoger
- 4 cykler delt med botilbuddet
- 4 biler kun til bostøtten
- Booking (af biler) sker i Outlook
- Der er retningslinjer for, hvor langt frem, man må booke
På trods af denne information måtte vi erkende at vores kendskab til domænet var for begrænset til, at vi kunne gå i gang med en Use Case Workshop, som Inception-fasen oftest startes med i Unified Process  @larmanApplyingUMLPatterns. Vores ønske var at arbejde med et ægte domæne for at kunne arbejde agilt, men vi blev nødt til at tilgå det som et kunstigt domæne. Derfor valgte vi at ændre på processen og starte med at modellere problemdomænet med en konceptmodel. Det gjorde vi for at få et fælles grundlag for det (delvist) fiktive domæne. Normalt ville modelleringen komme, efter at domænet er blevet afdækket med en PO i en use case-workshop. I vores projekt brugte vi det som et værktøj til at blive enige om, hvilke antagelser vi ville lave om den manglende domæneinformation.
== Opgaveformulering vs. agil metode

Det kunstige scenarie tvang os til at reflektere over, hvordan man arbejder agilt i en kontekst med stærkt begrænsede ressourcer og tid. Dilemmaet bestod i, om vi skulle lade projektets rammer — et to-ugers skoleprojekt — begrænse vores analyse fra start, eller om vi skulle tilgå processen med et åbent sind og analysere domænet naivt, som om det var et fuldskala-projekt.

Vi valgte at forblive tro mod den agile tankegang og gennemføre analysen uden forudindtagede begrænsninger. For at håndtere det begrænsede scope i praksis inddrog vi det som en faktor i vores prioritering frem for i analysen. Konkret betød det, at use cases, der lå uden for realistisk rækkevidde, blev tildelt en høj værdi på _Cost_-aksen i vores _value-driven_ prioritering. Derved sikrede vi, at prioriteringsscoren naturligt sorterede urealistiske krav fra, samtidig med at vi opretholdt retten til pragmatisk at ekskludere use cases, der trods en favorabel score ikke kunne rummes inden for tidsrammen.

== Projekt- og iterationsstruktur
Vi tilrettelagde en intensiv Inception-fase over to dage for at etablere domæneforståelse og prioritere krav. Grundet gruppens begrænsede erfaring med WPF planlagde vi tre korte iterationer á to dage for hurtigt at kunne evaluere tekniske valg. Den endelige struktur for projektet, som vi planlagde, kan ses i @table:projektoversigt. Vi besluttede også, at hver iteration skulle implementere use cases i vertikale slices frem for at fokusere på at fuldende et lag ad gangen. Den tilgang kaldes også for _tracer bullets_ @thomasPragmaticProgrammerYour2020 af den årsag, at feedbackcyklussen bliver forkortet, hvilket skulle hjælpe os med hurtigt at kunne vurdere vores design og implementering, særligt i forhold til WPF, som var ny teknologi for os.

Vi besluttede, at processtyringen skulle forankres i opsamlingsmøder i slutningen af hver iteration, der naturligt skulle føre videre til planlægningen af den næste iteration. I den forbindelse diskuterede vi også, om vi skulle kontrollere vores produktivitet med et Gantt- eller Burndown-diagram.

#figure(
  table(
    columns: (auto, 1fr),
    inset: 10pt,
    align: horizon,
    table.header([*Fase*], [*Fokus og Aktiviteter*]),
    [Inception 1\ (12/3 - 13/3)],
    [OOA, domænemodellering og krav-workshop. Prioritering af Use Cases baseret på risici og kundeværdi. Planlæg iteration E1.],

    [Elaboration 1\ (16/3 - 17/3)], [],
    [Elaboration 2\ (18/3)], [],
    [IT-Days\ (19/3)], [Karrieremesse.],
    [Elaboration 2\ (20/3)], [],
    [Elaboration 3\ (23/3 - 24/3)], [],
    [Afslutning\ (25/3 - 27/3)], [Renskrivning af rapport, udarbejdelse af diagrammer og aflevering.],
  ),
  caption: [Projektoversigt],
) <table:projektoversigt>


I vores tidligere projekter har vi erfaret Gantt's begrænsninger som primær styringsværktøj i korte iterative projekter. Da Gantt forudsætter et klart overblik over forløbet, strider dette imod UP's agile og iterative natur, hvor krav og design ændres mellem iterationerne. Som Larman påpeger, arbejdes der i iterative processer, ikke med en fuldt detaljeret plan for hele projektet fra start: “There isn't a detailed plan for the entire project. There is a high-level plan” @larmanApplyingUMLPatterns.

Derfor brugte vi Gantt til at visualisere vores overordnede projektramme, der indeholdt de tre iterationer, samt de opgaver der var kommet forud for oprettelsen af selve diagrammet:
#figure(
  image(
    "../assets/Originalt gantt.png",
  ),
  caption: [Oprindeligt Gantt diagram],
)

I tidligere projekter har Gantt dog bidraget konstruktivt til vores læring ved retrospektivt at vise det faktiske forløb. Af den grund besluttede vi at udfylde endnu et Gantt-diagram, der skulle visualisere vores faktiske proces, så vi hermed tydeligt kunne se, hvor vi ville afvige fra den planlagte (@bilag:Ganttdiagram).

Til at styre hver iteration besluttede vi at benytte Burndown-diagrammer. Men da iterationerne kun bestod af to dage, og diagrammet derved ville have for få datapunkter, besluttede vi at modificere det og lade x-aksen vise tasks fremfor tidsrammen(@bilag:BurndownChart).
