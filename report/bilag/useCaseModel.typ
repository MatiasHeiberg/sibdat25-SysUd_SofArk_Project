#table(
  columns: (auto, 2fr, 3fr),
  inset: 10pt,
  align: horizon,
  table.header([*ID*], [*Navn*], [*Beskrivelse*]),
  [UC1], [Se oversigt over bookinger], [En medarbejder tilgår systemet og kan se oversigt over transport-bookinger.],
  [#link(<UC2>)[#underline[UC2]]],
  [Se ledige transportmidler for et bestemt tidspunkt],
  [En medarbejder tilgår systemet, vælger et ønsket tidspunkt, og systemet viser ledige transportmidler.],

  [#link(<UC3>)[#underline[UC3]]],
  [Book transportmiddel],
  [En medarbejder tilgår systemet og booker et ledigt transportmiddel i et givent tidspunkt.],

  [UC4], [Ændre booking], [En medarbejder tilgår egen booking og redigerer bookingdetaljer.],
  [UC5], [Annullere booking], [En medarbejder annullerer egen booking.],
  [UC6], [Registrer brug af privatbil], [En medarbejder registrerer egen bil i systemet i et givent tidsrum.],
  [UC7], [Se hvilke medarbejdere der er på arbejde], [En medarbejder kan se status på dagens booking-ejere.],
  [UC8], [Ajourfør medarbejder], [Systemet modtager opdateret medarbejderliste fra Nexus.],
  [UC9], [Se borgerliste el. dagens besøg], [En medarbejder kan se egen borgerliste og dagens besøg.],
  [UC10],
  [Planlæg rækkefølge af besøg],
  [Systemet sammenligner besøgslister ud fra dato, borgerens adresse og koordinerer en optimal besøgsrækkefølge.],

  [UC11],
  [Overdrag borger til kollega],
  [Systemet modtager en ajourført medarbejderliste, som indeholder en syg medarbejder. Systemet fordeler den syges borger til kollegaernes besøgslister.],

  [UC12], [Administrer transportmidler], [Administrativ medarbejder åbner systemet og administrerer transportmidlerne.],
)
#pagebreak()
=== UC2: Se ledige transportmidler for et bestemt tidspunkt <UC2>
#table(
  columns: (1fr, 2fr),
  inset: 10pt,
  [*Use Case Section*], [*Comment*],
  [Use Case Name], [Se ledige transportmidler for et bestemt tidspunkt],
  [Primary Actor], [Specialpædagogerne],
  [Stakeholders and Interests],
  [*Pædagogerne:* vil gerne have en smertefri oplevelse med at koordinere brugen af transportmidler.\
    *Bostedet:* interesse i at have et godt arbejdsmiljø, hvilket kan påvirkes af hvor nem arbejdsgangen er for deres medarbejdere.\
    *Borgere:* interesseret i at deres støtte kommer til den aftalte tid, og at pædagogerne er fleksible i deres besøgstider.],

  [Preconditions], [Pædagogen har succesfuldt valgt et tidsrum.],
  [Main Success Scenario], [Pædagogen ser præcis hvilke biler og cykler der ikke er booket.],
  [Extensions], [*A:* tidsrum er ikke gyldigt, pædagogen ser en informativ fejlmeddelelse.],
  [Special Requirements], [Cross platform support],
)
#pagebreak()
=== UC3: Book transportmiddel <UC3>
#table(
  columns: (1fr, 2fr),
  inset: 10pt,
  [*Use Case Section*], [*Comment*],
  [Use Case Name], [Book transportmiddel],
  [Primary Actor], [Specialpædagog],
  [Stakeholders and Interests],
  [*Pædagogerne:* vil gerne have en smertefri oplevelse med at koordinere brugen af transportmidler.\
    *Bostedet:* interesse i at have et godt arbejdsmiljø, hvilket kan påvirkes af hvor nem arbejdsgangen er for deres medarbejdere.\
    *Borgere:* interesseret i at deres støtte kommer til den aftalte tid, og at pædagogerne er fleksible i deres besøgstider.],

  [Preconditions], [Valgt gyldig tidsrum. (Se UC2)],
  [Success Guarantee],
  [Transportmidlet er ikke længere tilgængelig i det valgte tidsrum og det står som booket i medarbejderens navn.],

  [Main Success Scenario],
  [*1:* Ser ledige transportmidler\
    *2:* Vælger ledig transportmiddel\
    *3:* Booker valgte transportmiddel\
    *4:* Modtager bekræftigelse],

  [Extensions],
  [*A:* Vælger transportmiddel der allerede er booket.\
    *1:* Ser ledige transportmidler\
    *2:* Vælger ledig transportmiddel\
    *3:* Prøver at booker valgte transportmiddel\
    *4:* Modtager en fejlmeddelelse \
    *5:* Sender fejlen til admin],

  [Special Requirements],
  [*1:* Cross platform support\
    *2:* Håndterer edge cases hvor dobbelt booking kan forekomme],
)
