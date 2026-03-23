---
created: 2026-03-23
section: AI-komposition
exclude: false
sortKey: 11.57774
---
# Procesdokumentation

## Opstart og projektstrategi

Projektet tog sin begyndelse med to dages inception (12-13. marts). I stedet for at springe direkte til implementering valgte vi at bruge denne tid på at etablere et fælles domæneforståelse, udarbejde en domænemodel og afholde en use case-workshop. 

Det er tydeligt i commit-historikken: de tidligste commits er udelukkende dokumentation — Domænemodel, Ordanalyse og spørgsmål til PO, Use case briefs, Tanker om risk og value matrix — ingen kildekode overhovedet. Det var en bevidst prioritering, der fulgte UP's tankegang om at identificere og reducere risici tidligt frem for at begynde med det teknisk sikre.

Vores overordnede projektstrategi var at arbejde **value-driven og risikodrevet**: vi ville ikke bygge det nemmeste, men det der gav mest mening at bygge først — defineret ud fra en kombination af kundeværdi og teknisk risiko.

---

## Det kunstige problemdomæne og manglen på PO

En central udfordring i projektet var, at vi kun havde adgang til ét enkelt svar fra klienten (Laura, specialpædagog i en bostøtteenhed). Ud fra dette svar vidste vi:
*   14 medarbejdere
*   4 cykler delt med botilbuddet
*   4 biler kun til bostøtten
*   Booking sker i Outlook
*   Der er retningslinjer for, hvor langt frem man må booke

Det var mere end ingenting — men det var langt fra nok til at afklare *business rules* på et konkret niveau. Commit-historikken afspejler dette direkte: vi oprettede gentagne gange noter med spørgsmål til PO (*"Spørgsmål til PO"*, *"Flere spørgsmål til PO"*, *"tilføjelse til usecases og nyt spørgsmål til PO"*) — spørgsmål vi aldrig fik svar på. Vi stod i en situation, hvor vi arbejdede med et reelt domæne, men uden en reel PO at validere vores forståelse med.

### Refleksion over agil metode i et læringsscenarie
Dette tvang os til en refleksion over, hvordan man arbejder agilt i et kunstigt opstillet læringsscenarie. Vi diskuterede, om vi skulle lade projektets begrænsede scope (to uger, skoleprojekt) præge vores analyse, eller om vi skulle analysere åbent og naivt — som om vi lavede et virkeligt system. 

Vi valgte det sidste: **at analysere med åbent sind og lade scope-begrænsninger komme til udtryk i vores prioritering, ikke i vores analyse**. Konkret betød det, at use cases vi vidste lå langt uden for scope, fik høje cost-værdier i vores prioriteringsmatrix og dermed automatisk rykkede ned i prioriteringslisten.

### Konsekvenser for taskformulering
Manglen på en PO medførte imidlertid direkte konsekvenser for vores taskformulering. Fordi vi ikke kunne validere business rules på et detaljeret niveau, formulerede vi i første omgang tasks på et for abstrakt og konceptuelt plan. En task som "Brugerdata" dækkede i virkeligheden over tre fundamentalt forskellige designbeslutninger: 
1.  Skulle det være en fil, der læses og skrives til?
2.  En property på Booking?
3.  Eller en database?

Denne uklarhed smittede direkte af på vores estimering.

---

## Planlægning og Wideband Delphi-estimering

Til estimering af tasks valgte vi en modificeret version af **Wideband Delphi** kombineret med **Fibonacci-pointskalaen**. Metoden fungerede således:

1.  Vi nedskrev konkrete tekniske tasks afledt af vores prioriterede use cases.
2.  Vi rangerede tasks relativt til hinanden efter arbejdsbyrde — fra den tungeste i den ene ende til den letteste i den anden.
3.  Vi tildelte Fibonacci-point (1, 2, 3, 5, 8, 13, 21, 34) — men med en justeret vægtning tilpasset vores korte tidsramme: 21-34 point svarede til ét dags arbejde, frem for den standard-fortolkning, hvor det svarer til flere uger.

At selve estimeringsøvelsen var genstand for diskussion og uenighed ses direkte i historikken: `afbf0ca merged-conflict af estimering` — vi nåede endda til et merge-konflikt på dokumentet, fordi vi arbejdede med det simultant. Det afspejler en reel, levende debat om prioritering.

### Resultat af estimering vs. virkelighed
Konsekvensen var, at vi i Iteration 1 kun nåede ca. 12 ud af de forventede 24 point. De to første tasks viste sig at fylde en hel dag, fordi vi undervejs måtte tage en lang række grundlæggende arkitekturbeslutninger, vi ikke havde regnet med i estimeringsøvelsen. Dette ses tydeligt i commit-sekvensen fra Iteration 1: den første substantielle kildekode-commit (`0bcaac7 file IO, interfaces og base repository klasse`) kom relativt sent — forudgået af en lang række midlertidige tilstande (`cec7687 Midlertidig tilstand`, `ef25649 Midlertidig tilstand`), der vidner om en iterativ og udforskende implementeringsproces frem for en lineær udførelse af foruddefinerede tasks.

> I retrospekt var dette ikke kun et estimeringsproblem — det var et **taskformuleringsroblem**. Vi formulerede vores tasks ud fra en feature-tankegang (*hvad skal systemet kunne?*), men Larman foreskriver, at man i elaboration-fasen bør formulere tasks arkitekturorienteret (*hvad skal vi beslutte?*). Vores tasks burde have isoleret arkitektoniske beslutninger frem for at pakke dem ind i feature-implementeringer.

---

## Value- og Riskmatrix: Forsvarlig kravprioritering

Til prioritering af use cases anvendte vi to separate vurderingsredskaber:

*   **Risk Matrix (1-5):** Vurderede den tekniske og forretningsmæssige risiko ved ikke at implementere en given use case. Høj risiko = høj prioritet.
*   **Value/Cost Matrix (1-5):** Vurderede forholdet mellem den værdi en use case leverer til brugeren og den estimerede implementeringsomkostning.

Vi kombinerede de to scores ved at gange dem, hvilket gav et tal mellem 1 og 25 at rangere ud fra. Vi stødte dog på en interessant diskussion undervejs: giver $4 \times 1$ altid mening at prioritere over $3 \times 2$? En use case med høj kundeværdi og lav risiko ($4 \times 1 = 4$) scorer lavere end én med moderat score på begge akser ($3 \times 2 = 6$) — men kan den førstnævnte ikke af den grund have højere prioritet? Vi konkluderede, at matematikken alene ikke løser prioriteringsspørgsmålet, men at den giver et forsvarligt og reproducerbart udgangspunkt for diskussionen.

**En vigtig præcision:** Vi var klar over, at vores begrænsede scope (skoleprojekt) betød, at mange high-value use cases rent faktisk var out-of-scope. For disse satte vi Cost til høj, uanset deres reelle tekniske kompleksitet. Det betød at prioriteringen afspejlede projektets faktiske kontekst og ikke kun det abstrakte værdibillede.

---

## Iterationsstruktur og Slices (Tracer Bullets)

Vi planlagde projektet med udgangspunkt i UP's iterative struktur:

*   **Inception (12-13/3):** Domænemodel, use case-workshop, kravprioritering.
*   **Iteration 1 (16-18/3):** UC2 (Se ledige transportmidler) og UC3 (Book transportmiddel) — fokus på arkitektur og FileIO-lag.
*   **Iteration 2 (18-21/3):** Overflow fra Iteration 1 — færdiggørelse af slicen.
*   **Rapport og aflevering (21-27/3).**

Vores arbejde med slices fulgte princippet om **tracer bullets**: vi forsøgte at skære et vertikalt snit gennem hele arkitekturen — fra UI til domæne til persistens — frem for at bygge et lag ad gangen. Det betød, at vi tidligt måtte tage stilling til alle lag simultant, herunder DI-opsætning, repository-mønsteret og FileIO-håndtering.

Commit-historikken bekræfter dette mønster: `2f35eae Begyndt implementering af UC2` efterfølges ikke af et færdigt UI, men af arkitektoniske beslutninger spredt over mange commits — *DI - domain changes, Refaktor domæne klasser, File IO, interfaces og base repository klasse, Refaktor ene controller klasse til den første af mange service klasser*. UC2 var trækpinen, der åbnede hele arkitekturen.

**Iteration 2** var ikke en planlagt selvstændig iteration, men et overflow. Vi nåede ikke at fuldende vores slice i Iteration 1 — og vi besluttede os for, at det ikke gav mening at begynde på en ny use case uden at have afsluttet den igangværende. Det er ikke rent iterativt i UP-forstand, men det var den rette pragmatiske beslutning givet vores tidsramme. Commit `62cda96 Planlægning af iteration 2` og den tilhørende note dokumenterer denne beslutning eksplicit: *"Overflow iteration 1 til iteration 2. Ikke rent iterativt, men da vi aldrig nåede at færdiggøre vores 'slice' i iteration 1 giver det ikke mening at gå videre med andre use cases."*

---

## Arkitekturevolution: Repository → Composite → Generisk Covariance

Arkitekturen for vores persistenslag gennemgik en tydelig evolution, som commit-historikken dokumenterer trin for trin.

1.  **Udgangspunktet** (`0bcaac7`): Etablerede separate, specialiserede repositories (`CarRepository`, `BikeRepository`), der begge arvede fra en abstrakt `FileHandler<T>`. `VehicleService` fik adgang til transportmidler via et `IVehicleProvider`-interface.

2.  **Controller → Service refactor** (`de9a0a8`): Det første tydelige arkitekturmæssige greb. Vi anerkendte, at en Controller-klasse ikke var det rigtige abstraktionsniveau, og introducerede i stedet en serviceorienteret struktur med tydelig ansvarsfordeling.

3.  **IEnumerable-beslutningen** (`4b4aaa5`): En bevidst arkitektonisk beslutning. Ved at bruge `IEnumerable<T>` frem for `List<T>` i `VehicleService` signaleres det eksplicit, at samlingen er read-only fra servicens perspektiv. En `List<T>` ville give servicen mulighed for at tilføje eller fjerne repositories under kørsel — et ansvar der tilhører DI-containeren ved opstart, ikke servicen. Commit-beskeden forbinder dette direkte til **Information Expert**-princippet fra GRASP.

4.  **Composite Pattern** (`6992d54`): Det centrale arkitektoniske spring. Vi indså, at `VehicleService` burde kunne samle biler og cykler uden at kende til de konkrete implementeringer. Løsningen var en `CompositeRepository<T>`, der implementerer `IRepository<T>` og internt aggregerer en `IEnumerable<IRepository<T>>`.

5.  **Generic Covariance** (`fc4c9ef`): Løste den udfordring, som generaliseringen af kompositten skabte. Et generisk `CompositeRepository<T>` kan i princippet samle instanser af alle typer. Ved at erklære `T` covariant (`IRepository<out T>`) kan compileren behandle `IRepository<Car>` og `IRepository<Bike>` som `IRepository<IVehicle>`, fordi `Car` og `Bike` begge implementerer `IVehicle`. Derimod vil en `IRepository<Employee>` ikke accepteres. Det er en **compile-time-håndhævelse af en business rule**.

---

## Facade Pattern: DX og skjul af implementering

Vi overvejede **Facade-mønsteret** allerede tidligt — `49e351d Design patterns overvejelser` — men fravalgte det til I/O-laget. Facade reducerer coupling, men løser ikke vores faktiske problem i persistenslaget (aggregering af repositories). Vi overvejede også **Factory** (irrelevant uden multiple formater) og **Adapter** (ingen legacy-systemer).

Facade-mønsterets rette plads viste sig i stedet at være ved applikationslaget. Commit `f5b2227 Appfacade mm` introducerede en `AppFacade`-klasse, der samler og skjuler de underliggende service-klasser bag ét fælles indgangspunkt. 

**Motivationen var todelt:**
1.  **Forbedret Developer Experience (DX):** UI-laget behøver kun kende til én klasse.
2.  **Indkapsling:** UI er løskoblet fra de konkrete serviceklasser.

---

## SOLID og GRASP i praksis

Vores arkitektoniske beslutninger kan systematisk forankres i SOLID:

*   **SRP (Single Responsibility):** `FileHandler` har ét ansvar (læse/skrive JSON), `VehicleService` orkestrerer, `CompositeRepository` aggregerer.
*   **OCP (Open/Closed):** Tilføjelse af et nyt transportmiddeltype kræver blot et nyt leaf-repository — ingen ændring i eksisterende klasser. (Argumentet for generic composite).
*   **LSP (Liskov Substitution):** `Car` og `Bike` er substituerbare overalt, hvor `IVehicle` forventes.
*   **ISP (Interface Segregation):** `IRepository<T>` er minimalt — kun `Load()`. Ingen forceret implementering af irrelevante metoder.
*   **DIP (Dependency Inversion):** `VehicleService` afhænger af abstraktionen `IRepository<IVehicle>`, ikke af konkrete repositories.

**GRASP-princippet Information Expert** afspejles konkret i commit `4b4aaa5`: commit-beskeden nævner eksplicit *"for at overholde Information Expert — kun domæneklasserne kan ændre i domænedata"*. Det viser, at GRASP ikke blot var teoretisk baggrundsviden, men aktivt guidede konkrete kodeændringer.

---

## Taskformulering: Læring til næste gang

En central læring fra projektet handler om taskformulering. Vi oplevede to symptomer på fejlformulering:

1.  **For abstrakt:** Tasks som "Brugerdata" gemte vigtige uafklarede designbeslutninger, fordi vi manglede domæneviden. Det gjorde pointvurdering urealistisk.
2.  **Feature-orienteret frem for arkitekturorienteret:** Vi formulerede tasks ud fra *"hvad skal systemet kunne?"* frem for *"hvilken arkitektonisk beslutning skal træffes?"* — på trods af at vi var i en elaboration-fase.

> En mulig løsning er et **"trin 0"** i iterationsplanlægningen: en bevidst session, der definerer et sæt business rules og domæneantagelser, som tasks kan skaleres ned fra. Disse besluttes kunstigt, men dokumenteres som antagelser og genbesøges iterativt.

---

## Refleksion

**Hvad fungerede godt:**
*   **Wideband Delphi** gav et konkret grundlag for estimering og prioriteringsdiskussion (dokumenteret via merge-konflikt).
*   **Risk × Value-matrixen** gav en forsvarsbar og reproducerbar kravprioritering.
*   **Arkitekturevolutionen** (Repository → Composite → Covariance) er et håndgribeligt eksempel på iterativ designforbedring.
*   **Generic covariance** løste et reelt domæneintegritetsproblem på compile-time-niveau.
*   **Dokumentere fravalg** (Factory, Adapter, Facade til I/O) viser reflekteret designtænkning.
*   **Refaktoren fra Controller til Service** (`de9a0a8`) viser evnen til at genkende og rette en forkert abstraktion tidligt.

**Hvad gik skævt:**
*   **Manglen på PO-kontakt** gjorde domæneantagelser nødvendige men ufunderede.
*   **Feature-formulerede tasks** forlængede Iteration 1 og gjorde Iteration 2 til et overflow.
*   **"Midlertidig tilstand"-commits** i Iteration 1 vidner om en periode med arkitekturmæssig uvished.
*   **Iteration 2** var ikke planlagt, men en forlængelse — et brud med UP's iterationsprincip.

**Hvad vi tager med:**
*   Arkitektoniske beslutninger bør isoleres som selvstændige **arkitektur-tasks** i planlægningen.
*   Uden PO bør man eksplicit definere antagelser som **forretningsregler** i et "trin 0".
*   Estimering i opstartsfasen er notorisk unøjagtig; **buffer** i første iteration er nødvendigt.
*   **Composite Pattern og generic covariance** er en stærk kombination, men potentielt overengineering. Vi valgte det for at demonstrere forståelse.
