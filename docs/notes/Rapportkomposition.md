---
created: 2026-03-23
section: AI-komposition
exclude: true
sortKey: 11.57774
---
# Rapportkomposition: Fra Domæneanalyse til Arkitektonisk Erkendelse

## Den Røde Tråd
"Fra Domæneanalyse til Arkitektonisk Erkendelse" - Jeres projektfortælling bør centreres omkring overgangen fra en struktureret Unified Process/Scrum-hybrid (Inception) til en mere realistisk og adaptiv tilgang, da I ramte virkelighedens udfordringer (Elaboration/Construction).

I startede med ambitiøse planer om 3 iterationer og formelle processer, men opdagede hurtigt:
1.  **Upræcis estimering:** Tasks var for dårligt definerede ("For dårlig formulerede tasks", "Erfaring mht. tidsestimering").
2.  **Teknisk usikkerhed:** Uventet kompleksitet i WPF og I/O betød, at Iteration 1 "løb over" og slugte Iteration 2.
3.  **Arkitektonisk pragmatisme:** I fravalgte komplekse patterns (Factory/Facade) til fordel for simplere løsninger, der passede til projektets faktiske størrelse.

Rapporten bør ikke skjule disse "fejl", men fremhæve dem som **læringspointer**, der viser en moden systemudviklingsproces.

## 1. Indledning & Projektramme
*   **Case:** Kort om KoordineringsAppen (KoordineringsApp til Borger/Medarbejder).
*   **Metode:** Jeres hybride tilgang (Inception/Elaboration) med Agil/UP hybrid.
*   **Hypotesen:** I troede, I kunne planlægge jer ud af problemerne (jf. jeres tidlige commits om "Gantt/burndown" og "Risk matrix").
*   **Projektstyring:** Introduktion til værktøjer brugt (Trello/Kanban, Burndown charts, "Mandagsmøder").

## 2. Fase 1: Inception & Analyse (Fundamentet)
*   *Git-bevis: Commits for 11 dage siden ("Ordanalyse", "Domænemodel før Use Cases").*
*   **Domænemodellering:** Hvordan I gik fra klientens tekst beskrivelse til jeres første klasser og domænemodel.
*   **Kravspecifikation:** Udvælgelse og prioritering af Use Cases (Risk vs. Value).
*   **Oprindelig Plan:** Jeres estimat på 3 iterationer og forventningen om en lineær progression.
*   **Refleksion:** Var I for optimistiske her? Diskuter her jeres note om "For dårlig formulerede tasks" – hvordan abstrakte opgaver gjorde det umuligt at estimere korrekt.

## 3. Fase 2: Iteration 1 (Kollisionen med Virkeligheden)
*   *Git-bevis: Commits for 6-7 dage siden ("File IO, interfaces...", "Refaktor ene controller...").*
*   **DK & Implementering:** De første skridt i koden (`src/`, C#, WPF). Etablering af lagdeling (UI, Domain, Data).
*   **Udfordringen:** Analysen af hvorfor tidsplanen skred. I opdagede, at FileIO og JSON ikke er trivielt uden en database.
*   **Vendepunktet:** "Overflow iteration 1 til 2". Beskriv beslutningen om at lade Iteration 1 "overflowe" ind i Iteration 2 i stedet for at starte nye features forhastet for at få teknikken på plads.

## 4. Fase 3: Iteration 2 (Arkitektonisk Redning)
*   *Git-bevis: Commits for 3-5 dage siden ("Refactored composite pattern...", "Generic covariance").*
*   **Problemet:** I havde brug for at håndtere mange forskellige repositories ensartet, men typesikkert. Datahåndtering (JSON/FileIO) uden en database.
*   **Løsningen (Composite):** Forklar jeres skift til **Generic Composite med Covariance**. Brug jeres commit-besked om "business rules" (Car/Bike vs. Employee) som et konkret eksempel på en arkitektonisk constraint, I har kodet ind.
*   **Feature (Facade):** Forklar indførslen af `AppFacade` (commit: "Appfacade mm") for at skjule kompleksiteten for UI-laget.
*   **Dependency Injection:** Hvorfor I valgte DI (ServiceCollection) frem for Composition Root eller hard-coded afhængigheder.
*   **Design Patterns:** Gennemgå jeres overvejelser (Factory vs. Facade vs. Repository) og argumentér for jeres valg (simpelt Repository til fil-I/O). Det viser arkitektonisk modenhed at *fravælge* unødig kompleksitet.

## 5. Kvalitetssikring & DevOps
*   *Git-bevis: "Første rapport eksport", "Build script".*
*   **Teststrategi:** Hvordan unit tests (`ProgramTests.cs`) blev brugt til at verificere logikken.
*   **Burndown Analyse:** Brug jeres Burndown chart til at visualisere, hvordan fremdriften (Actual) afveg fra planen (Ideal), og hvad I lærte af det.
*   **Automatisering:** Beskriv jeres setup med automatisering (Build-Report.bat) og hvordan I har sikret konsistens i dokumentationen.

## 6. Konklusion & Perspektivering
*   **Status:** Hvad virker (MVP)?
*   **Proceslæring:** Fra "Rigid planlægning" til "Adaptiv refaktorering". I startede med Gannt-kort, men endte med at navigere efter kodens kvalitet. Hvad ville I gøre anderledes næste gang? (F.eks. mindre, mere konkrete tasks).
*   **Fremtid:** Hvad ville næste skridt være? (Måske en rigtig database i stedet for FileIO, nu hvor I har Repository-pattern).
