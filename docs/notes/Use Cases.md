---
created: 2026-03-12
section: Inception
exclude: false
sortKey: 0.50019
---
En aktør, mål og systemets ansvar

| **ID**   | **Navn**                                           | **Brief**                                                                                             |
| -------- | -------------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| **UC1**  | Se oversigt over bookinger                         | En medarbejder tilgår systemet og kan se oversigt over transport-bookinger.                           |
| **UC2**  | Se ledige transportmidler for et bestemt tidspunkt | En medarbejder tilgår systemet, vælger et ønsket tidspunkt, og systemet viser ledige transportmidler. |
| **UC3**  | Book transportmiddel                               | En medarbejder tilgår systemet og booker et ledigt transportmiddel i et givent tidspunkt.             |
| **UC4**  | Ændre booking                                      | En medarbejder tilgår egen booking og redigerer bookingdetaljer.                                      |
| **UC5**  | Annullere booking                                  | En medarbejder annullerer egen booking                                                                |
| **UC6**  | Registrer brug af privatbil                        | En medarbejder registrerer egen bil i systemet i et givent tidsrum                                    |
| **UC7**  | Se hvilke medarbejdere der er på arbejde           | En medarbejder kan se status på dagens booking-ejere                                                  |
| **UC8**  | Ajourfør medarbejder                               | Systemet modtager opdateret medarbejderliste fra Nexus                                                |
| **UC9**  | Se borgerliste / dagens besøg                      |                                                                                                       |
| **UC10** | Planlæg rækkefølge af besøg                        |                                                                                                       |
| **UC11** | Registrer borger-deling                            |                                                                                                       |
| **UC12** | Overdrag borger til kollega                        |                                                                                                       |
| **UC13** | Opsæt booking-retningslinjer                       |                                                                                                       |
| **UC14** | Administrer transportmidler                        |                                                                                                       |
> [!NOTE]-
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