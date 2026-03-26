// ==========================================
// Bilag: Dokumentation af LLM Svar
// Emne: AI forslag til Use Cases
// Dato: 12. marts 2026 (baseret på kontekst)
// Kilde: Gemini (Google)
// ==========================================

Dette bilag dokumenterer forslag til Use Cases genereret af AI (Gemini) under Inception-fasen. Forslagene blev brugt som inspiration til udarbejdelse af den endelige bruttoliste.

*Link:* #link("https://gemini.google.com/share/b5175280a06e")

==== 🚲 Håndtering af Transport & Booking

Dette virker som et af kerneområderne (pain points), da de i dag bruger Outlook og skal overholde specifikke retningslinjer.

- *UC1: Se ledige transportmidler* \
  (Medarbejderen skal kunne se, hvad der er tilgængeligt hvornår).

- *UC2: Book transportmiddel* \
  (Dækker over både bil og cykel. Systemet skal her understøtte de "retningslinjer", PO nævner).

- *UC3: Ændre/Annuller booking* \
  (Nødvendigt i ethvert bookingsystem).

- *UC4: Registrer brug af privatbil* \
  (Da PO nævner, at nogle bruger egen bil, kan det være relevant at registrere, så kollegaer kan se, at personen ikke optager en firmabil).

==== 👥 Håndtering af Borgerbesøg & Koordinering

Dette dækker over den del, hvor de selv planlægger deres arbejdsdag og deler borgere.

- *UC5: Se borgerliste / dagens besøg* \
  (Medarbejderen trækker sin liste over borgere).

- *UC6: Planlæg rækkefølge af besøg* \
  (PO nævner: "Vi skal selv beslutte rækkefølgen").

- *UC7: Registrer borger-deling* \
  (PO nævner: "en har en borger i ulige uger og den anden i lige uger". Dette skal systemet nok understøtte for at undgå dobbeltbesøg).

- *UC8: Overdrag borger til kollega* \
  (Når der koordineres "på kryds og tværs", for eksempel ved sygdom).

==== ⚙️ Administration (Systemopsætning)

Selvom PO (Laura) ikke eksplicit nævner en administrator-rolle, kræver ethvert system nogle basale opsætnings-Use Cases. I kan overveje at have "Leder" eller "Systemadministrator" som aktør her.

- *UC9: Opsæt booking-retningslinjer* \
  (Hvor lang tid frem må man booke?).

- *UC10: Administrer transportmidler* \
  (Tilføj/fjern biler og cykler fra systemet).
