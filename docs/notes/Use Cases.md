---
created: 2026-03-12
section: Inception
exclude: false
sortKey: 0.50019
---
> [!Fully dressed template]-
> ```markdown
> | Use Case Section | Comment |
> | :--- | :--- |
> | Use Case Name | Start with a verb. |
> | Primary Actor | Calls on the system to deliver its services. |
> | Stakeholders and Interests | Who cares about this use case, and what do they want? |
> | Preconditions | What must be true on start, and worth telling the reader? |
> | Success Guarantee | What must be true on successful completion, and worth telling the reader. |
> | Main Success Scenario | A typical, unconditional happy path scenario of success. |
> | Extensions | Alternate scenarios of success or failure. |
> | Special Requirements | Related non-functional requirements. |
> | Technology and Data Variations List | Varying I/O methods and data formats. |
> | Miscellaneous | Such as open issues. |
> ```

En aktør, mål og systemets ansvar

| **ID**   | **Navn**                                               | **Brief**                                                                                                                                             |
| -------- | ------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------- |
| **UC1**  | [[Se oversigt over bookinger]]                         | En medarbejder tilgår systemet og kan se oversigt over transport-bookinger.                                                                           |
| **UC2**  | [[Se ledige transportmidler for et bestemt tidspunkt]] | En medarbejder tilgår systemet, vælger et ønsket tidspunkt, og systemet viser ledige transportmidler.                                                 |
| **UC3**  | [[Book transportmiddel]]                               | En medarbejder tilgår systemet og booker et ledigt transportmiddel i et givent tidspunkt.                                                             |
| **UC4**  | [[Ændre booking]]                                      | En medarbejder tilgår egen booking og redigerer bookingdetaljer.                                                                                      |
| **UC5**  | [[Annullere booking]]                                  | En medarbejder annullerer egen booking.                                                                                                               |
| **UC6**  | [[Registrer brug af privatbil]]                        | En medarbejder registrerer egen bil i systemet i et givent tidsrum.                                                                                   |
| **UC7**  | [[Se hvilke medarbejdere der er på arbejde]]           | En medarbejder kan se status på dagens booking-ejere.                                                                                                 |
| **UC8**  | [[Ajourfør medarbejder]]                               | Systemet modtager opdateret medarbejderliste fra Nexus.                                                                                               |
| **UC9**  | [[Se borgerliste el. dagens besøg]]                    | En medarbejder kan se egen borgerliste og dagens besøg.                                                                                               |
| **UC10** | [[Planlæg rækkefølge af besøg]]                        | Systemet sammenligner besøgslister ud fra dato, borgerens adresse og koordinerer en optimal besøgsrækkefølge.                                         |
| **UC11** | [[Overdrag borger til kollega]]                        | Systemet modtager en ajourført medarbejderliste, som indeholder en syg medarbejder. Systemet fordeler den syges borger til kollegaernes besøgslister. |
| **UC12** | [[Administrer transportmidler]]                        | Administrativ medarbejder åbner systemet og administrerer transportmidlerne.                                                                          |
> [!AI forslag til UC]-
> [https://gemini.google.com/share/b5175280a06e](https://gemini.google.com/share/b5175280a06e "https://gemini.google.com/share/b5175280a06e")
> ### 🚲 Håndtering af Transport & Booking
> 
> Dette virker som et af kerneområderne (pain points), da de i dag bruger Outlook og skal overholde specifikke retningslinjer.
> 
> - **UC1: Se ledige transportmidler** (Medarbejderen skal kunne se, hvad der er tilgængeligt hvornår).
>     
> - **UC2: Book transportmiddel** (Dækker over både bil og cykel. Systemet skal her understøtte de "retningslinjer", PO nævner).
>     
> - **UC3: Ændre/Annuller booking** (Nødvendigt i ethvert bookingsystem).
>     
> - **UC4: Registrer brug af privatbil** (Da PO nævner, at nogle bruger egen bil, kan det være relevant at registrere, så kollegaer kan se, at personen ikke optager en firmabil).
>     
> 
> ### 👥 Håndtering af Borgerbesøg & Koordinering
> 
> Dette dækker over den del, hvor de selv planlægger deres arbejdsdag og deler borgere.
> 
> - **UC5: Se borgerliste / dagens besøg** (Medarbejderen trækker sin liste over borgere).
>     
> - **UC6: Planlæg rækkefølge af besøg** (PO nævner: "Vi skal selv beslutte rækkefølgen").
>     
> - **UC7: Registrer borger-deling** (PO nævner: "en har en borger i ulige uger og den anden i lige uger". Dette skal systemet nok understøtte for at undgå dobbeltbesøg).
>     
> - **UC8: Overdrag borger til kollega** (Når der koordineres "på kryds og tværs", for eksempel ved sygdom).
>     
> 
> ### ⚙️ Administration (Systemopsætning)
> 
> Selvom PO (Laura) ikke eksplicit nævner en administrator-rolle, kræver ethvert system nogle basale opsætnings-Use Cases. I kan overveje at have "Leder" eller "Systemadministrator" som aktør her.
> 
> - **UC9: Opsæt booking-retningslinjer** (Hvor lang tid frem må man booke?).
>     
> - **UC10: Administrer transportmidler** (Tilføj/fjern biler og cykler fra systemet).


> [!AI forslag til formulering af backlog items]-
> ### Hvad fungerer godt?
> 
> - **De handlingsorienterede opgaver:** Punkter som _"Gør booket transportmiddel optaget efter booking"_ og _"Ved booking, tjek at transportmidlet ikke er optaget"_ er rigtig gode. De beskriver en specifik logik, der skal implementeres, og de er nemme at teste.
>     
> - **Fejlhåndtering er tænkt ind:** _"Håndter valg af ugyldigt tidsrum med en fejlmeddelelse"_ er en fremragende opgave. Den dækker præcis jeres "Extension A" fra Use Casen.
>     
> 
> ### Hvad kan forbedres?
> 
> I øjeblikket er jeres liste en blanding af meget brede koncepter (Epics), data-krav og specifikke funktioner. For at en backlog er "brugbar" for en programmør, skal opgaverne være konkrete, afgrænsede og testbare.
> 
> Her er 3 principper, I kan bruge til at omformulere dem:
> 
> #### 1. Brug handlingsudsagnsord (Gør det aktivt)
> 
> Undgå navneord (substantiver) som overskrifter. En opgave bør fortælle en udvikler, hvad der skal _laves_.
> 
> - _Før:_ "Bekræftigelse af booking"
>     
> - _Efter:_ "Vis en bekræftelsesside/popup, når en booking er gennemført."
>     
> - _Før:_ "Bruger data" (Denne er for bred – hvad skal der ske med dataen?)
>     
> - _Efter:_ "Opret database-tabel til opbevaring af brugerinformation (pædagog-ID, navn)."
>     
> 
> #### 2. Del de store "klumper" op (Granularitet)
> 
> En opgave som _"Booking funktion"_ er alt for stor (det kaldes ofte et "Epic" i agil udvikling). En bookingfunktion består af mange små dele. For at gøre den brugbar, skal den brydes ned i tekniske tasks:
> 
> - "Implementer frontend-knap til at indsende booking."
>     
> - "Lav backend-endpoint der modtager og validerer booking-anmodningen."
>     
> - "Opdater databasen så transportmidlet tilknyttes pædagogens ID."
>     
> 
> #### 3. Overvej at bruge "User Story"-formatet
> 
> Selvom I spørger efter _tekniske_ opgaver, starter en backlog ofte med User Stories, som derefter brydes ned i tekniske tasks. Dette format sikrer, at I husker _hvorfor_ funktionen laves:
> 
> > **Format:** Som `[aktør]` ønsker jeg `[en funktion]`, for at `[skabe en bestemt værdi]`.
> 
> - _Før:_ "Oversigt over transportmidler"
>     
> - _Efter (User Story):_ "Som specialpædagog ønsker jeg at se en liste over transportmidler, så jeg hurtigt kan få et overblik."
>     
> - _Tilføj Acceptkriterier (Definition of Done):_ * Listen skal vise både biler og cykler.
>     
>     - Listen skal kun vise transportmidler, der er ledige i det valgte tidsrum.
>         
> 
> ---
> 
> ### Et eksempel på en refaktoreret Use Case til Backlog
> 
> Hvis vi tager udgangspunkt i jeres **Use Case: Book transportmiddel**, kunne de tilhørende backlog-opgaver se sådan her ud, hvis de skal være direkte klar til et udviklerteam:
> 
> **User Story:** Som specialpædagog vil jeg kunne booke et ledigt transportmiddel, så jeg kan transportere borgeren til tiden.
> 
> **Tekniske tasks under denne story:**
> 
> 1. **Frontend:** Udvikl en "Book"-knap ud for hvert ledigt transportmiddel.
>     
> 2. **Backend:** Valider modtaget booking-anmodning (Tjek i databasen at køretøjet _stadig_ er ledigt, for at forhindre dobbeltbooking).
>     
> 3. **Database:** Opdater transportmidlets status fra 'Ledig' til 'Booket' i det specifikke tidsrum.
>     
> 4. **Frontend/System:** Vis succes-meddelelse til pædagogen ved vellykket booking.
>     
> 5. **System:** Send notifikation/log til admin, hvis systemet fanger et forsøg på dobbeltbooking (Fejlhåndtering).
>     
> 
> Ved at strukturere det sådan, ved den person der skal programmere det, præcis hvilken lille brik de skal løse først.
> 
> Vil du have hjælp til at bryde jeres anden Use Case ("Se ledige transportmidler for et bestemt tidspunkt") ned i helt konkrete frontend-, backend- og database-opgaver, så I kan se endnu et eksempel?
