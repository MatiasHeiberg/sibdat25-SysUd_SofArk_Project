// ======================================================================
// ⚠️ ADVARSEL: DENNE FIL ER AUTO-GENERERET AF SCRIPTET.
//
// Dette afsnit er genereret ud fra jeres rå noter i Obsidian.
// Alt manuelt arbejde i denne fil vil blive overskrevet næste gang
// bygge-scriptet køres.
//
// 🔒 LÅSE-FUNKTION:
// Når I er færdige med "note-fasen" og vil begynde at renskrive dette
// afsnit manuelt her i VS Code, skal I ændre 'UNLOCKED' til 'LOCKED'.
// Så vil scriptet springe denne fil over fremover, og jeres manuelle 
// Typst-kode er fredet.
// 
// UNLOCKED
// ======================================================================


Vi tÃƒÂ¦nker, at inception-fasen skal lÃƒÂ¸be over to dage (torsdag 12/3 +
fredag 13/3)

Vi arbejder ud fra klients fÃƒÂ¸rste domÃƒÂ¦nebeskrivelse.

Vi diskuterer, om 1-3 iterationer er realistisk i projektet.

=== Inception oversigt
<inception-oversigt>
^1c3ba6

- OOA
- DomÃƒÂ¦nemodel
- Krav-workshop - Use Case Model
- prioriter krav - ud fra risici og kundevÃƒÂ¦rdi
- planlÃƒÂ¦g iterationer (Vi lÃƒÂ¦gger en overordnet plan - men holder
  'mandagsmÃƒÂ¸der' og 'opsamlingsmÃƒÂ¸der' i starten og slutningen af hver
  iteration med kommunikations-UML'er)

Vi diskuterer den agile proces i sÃƒÂ¥ kort et projekt. Vi tÃƒÂ¦nker, at der
skal vÃƒÂ¦re et par hele dagen til at lave fÃƒÂ¦rdige diagrammer og
renskrive opgaven.

WPF er forholdsvist nyt for gruppen - det taget i betragtning tÃƒÂ¦nker vi
3 iterationer pÃƒÂ¥ to dage hver er udgangspunktet

Dag 1 Elaboration starter mandag (16/3)

Vi diskuterer burnout-chart vs Gantt kort

+ Inception
  + #box(image("/docs/attachments/Inception#Inception oversigt"))
+ Inception - fortsÃƒÂ¦ttelse
+ Elaboration 1 - start
+ â€¦
+ â€¦
+ Konference
+ â€¦
+ â€¦
+ Elaboration 3 - slut
+ Rapport - start
+ Rapport - fortsÃƒÂ¦ttelse
+ Aflevering
+
+ #box(image("/docs/attachments/12318.jpg"))

Med udgangspunkt i \[\[Svar fra Klient\]\]

== Entiteter/navneord
<entiteternavneord>
- Medarbejder
- Cykel
- Bil (firma og privat)
- Borgerliste
- Borger
- BorgerbesÃƒÂ¸g
- Booking
- Transportmidler
- Outlook
- BesÃƒÂ¸gstid
- Botilbud
- BostÃƒÂ¸tte
- Retningslinjer (booking regler)
- Borger-deling

== Handlinger/udsagsord
<handlingerudsagsord>
- Koordinere
- BesÃƒÂ¸ger
- Cykler
- KÃƒÂ¸rer
- Booker
-

```mermaid
classDiagram

class Medarbejder
class Transport
class Borger
class Booking
class BostÃƒÂ¸tte
class Botilbud
class Retningslinjer
class Borgerliste
class Bil
class Cykel
class Outlook
class Privatbil

Bil -- Transport
Cykel -- Transport

Transport -- Booking : har
Medarbejder -- Transport : bruger
Medarbejder -- Borger : besÃƒÂ¸ger
Medarbejder -- Booking : laver
Booking -- Retningslinjer : har
Booking -- Outlook : bruger

Medarbejder "14" -- "1" BostÃƒÂ¸tte : er
Medarbejder -- Botilbud : ansat
BostÃƒÂ¸tte -- Botilbud : tilbyder
BostÃƒÂ¸tte -- Privatbil : bruger

Medarbejder -- Borgerliste : har
Borgerliste "1..*" -- "1..*" Borger : pÃƒÂ¥
```

#box(image("/docs/attachments/12321.jpg"))

#quote(block: true)[
\[!Fully dressed template\]-

```markdown
| Use Case Section | Comment |
| :--- | :--- |
| Use Case Name | Start with a verb. |
| Primary Actor | Calls on the system to deliver its services. |
| Stakeholders and Interests | Who cares about this use case, and what do they want? |
| Preconditions | What must be true on start, and worth telling the reader? |
| Success Guarantee | What must be true on successful completion, and worth telling the reader. |
| Main Success Scenario | A typical, unconditional happy path scenario of success. |
| Extensions | Alternate scenarios of success or failure. |
| Special Requirements | Related non-functional requirements. |
| Technology and Data Variations List | Varying I/O methods and data formats. |
| Miscellaneous | Such as open issues. |
```
]

En aktÃƒÂ¸r, mÃƒÂ¥l og systemets ansvar

#figure(
  align(center)[#table(
    columns: (3.79%, 25.59%, 70.62%),
    align: (auto,auto,auto,),
    table.header([#strong[ID]], [#strong[Navn]], [#strong[Brief]],),
    table.hline(),
    [#strong[UC1]], [\[\[Se oversigt over bookinger\]\]], [En
    medarbejder tilgÃƒÂ¥r systemet og kan se oversigt over
    transport-bookinger.],
    [#strong[UC2]], [\[\[Se ledige transportmidler for et bestemt
    tidspunkt\]\]], [En medarbejder tilgÃƒÂ¥r systemet, vÃƒÂ¦lger et ÃƒÂ¸nsket
    tidspunkt, og systemet viser ledige transportmidler.],
    [#strong[UC3]], [\[\[Book transportmiddel\]\]], [En medarbejder
    tilgÃƒÂ¥r systemet og booker et ledigt transportmiddel i et givent
    tidspunkt.],
    [#strong[UC4]], [\[\[Ãƒâ€ ndre booking\]\]], [En medarbejder tilgÃƒÂ¥r
    egen booking og redigerer bookingdetaljer.],
    [#strong[UC5]], [\[\[Annullere booking\]\]], [En medarbejder
    annullerer egen booking.],
    [#strong[UC6]], [\[\[Registrer brug af privatbil\]\]], [En
    medarbejder registrerer egen bil i systemet i et givent tidsrum.],
    [#strong[UC7]], [\[\[Se hvilke medarbejdere der er pÃƒÂ¥
    arbejde\]\]], [En medarbejder kan se status pÃƒÂ¥ dagens
    booking-ejere.],
    [#strong[UC8]], [\[\[AjourfÃƒÂ¸r medarbejder\]\]], [Systemet modtager
    opdateret medarbejderliste fra Nexus.],
    [#strong[UC9]], [\[\[Se borgerliste el. dagens besÃƒÂ¸g\]\]], [En
    medarbejder kan se egen borgerliste og dagens besÃƒÂ¸g.],
    [#strong[UC10]], [\[\[PlanlÃƒÂ¦g rÃƒÂ¦kkefÃƒÂ¸lge af
    besÃƒÂ¸g\]\]], [Systemet sammenligner besÃƒÂ¸gslister ud fra dato,
    borgerens adresse og koordinerer en optimal besÃƒÂ¸gsrÃƒÂ¦kkefÃƒÂ¸lge.],
    [#strong[UC11]], [\[\[Overdrag borger til kollega\]\]], [Systemet
    modtager en ajourfÃƒÂ¸rt medarbejderliste, som indeholder en syg
    medarbejder. Systemet fordeler den syges borger til kollegaernes
    besÃƒÂ¸gslister.],
    [#strong[UC12]], [\[\[Administrer
    transportmidler\]\]], [Administrativ medarbejder ÃƒÂ¥bner systemet og
    administrerer transportmidlerne.],
  )]
  , kind: table
  )

#quote(block: true)[
\[!AI forslag til UC\]-
#link("https://gemini.google.com/share/b5175280a06e") \#\#\# Ã°Å¸Å¡Â²
HÃƒÂ¥ndtering af Transport & Booking

Dette virker som et af kerneomrÃƒÂ¥derne (pain points), da de i dag bruger
Outlook og skal overholde specifikke retningslinjer.

- #strong[UC1: Se ledige transportmidler] (Medarbejderen skal kunne se,
  hvad der er tilgÃƒÂ¦ngeligt hvornÃƒÂ¥r).

- #strong[UC2: Book transportmiddel] (DÃƒÂ¦kker over bÃƒÂ¥de bil og cykel.
  Systemet skal her understÃƒÂ¸tte de "retningslinjer", PO nÃƒÂ¦vner).

- #strong[UC3: Ãƒâ€ ndre/Annuller booking] (NÃƒÂ¸dvendigt i ethvert
  bookingsystem).

- #strong[UC4: Registrer brug af privatbil] (Da PO nÃƒÂ¦vner, at nogle
  bruger egen bil, kan det vÃƒÂ¦re relevant at registrere, sÃƒÂ¥ kollegaer
  kan se, at personen ikke optager en firmabil).

=== Ã°Å¸â€˜Â¥ HÃƒÂ¥ndtering af BorgerbesÃƒÂ¸g & Koordinering
<Ã°Ã¿-hÃ£ndtering-af-borgerbesÃ£g-koordinering>
Dette dÃƒÂ¦kker over den del, hvor de selv planlÃƒÂ¦gger deres arbejdsdag og
deler borgere.

- #strong[UC5: Se borgerliste / dagens besÃƒÂ¸g] (Medarbejderen trÃƒÂ¦kker
  sin liste over borgere).

- #strong[UC6: PlanlÃƒÂ¦g rÃƒÂ¦kkefÃƒÂ¸lge af besÃƒÂ¸g] (PO nÃƒÂ¦vner: "Vi skal
  selv beslutte rÃƒÂ¦kkefÃƒÂ¸lgen").

- #strong[UC7: Registrer borger-deling] (PO nÃƒÂ¦vner: "en har en borger i
  ulige uger og den anden i lige uger". Dette skal systemet nok
  understÃƒÂ¸tte for at undgÃƒÂ¥ dobbeltbesÃƒÂ¸g).

- #strong[UC8: Overdrag borger til kollega] (NÃƒÂ¥r der koordineres "pÃƒÂ¥
  kryds og tvÃƒÂ¦rs", for eksempel ved sygdom).

=== Ã¢Å¡â„¢Ã¯Â¸Â Administration (SystemopsÃƒÂ¦tning)
<Ã¢Å¡Ã¯-administration-systemopsÃ£tning>
Selvom PO (Laura) ikke eksplicit nÃƒÂ¦vner en administrator-rolle, krÃƒÂ¦ver
ethvert system nogle basale opsÃƒÂ¦tnings-Use Cases. I kan overveje at
have "Leder" eller "Systemadministrator" som aktÃƒÂ¸r her.

- #strong[UC9: OpsÃƒÂ¦t booking-retningslinjer] (Hvor lang tid frem mÃƒÂ¥
  man booke?).

- #strong[UC10: Administrer transportmidler] (TilfÃƒÂ¸j/fjern biler og
  cykler fra systemet).
]

#quote(block: true)[
\[!AI forslag til formulering af backlog items\]- \#\#\# Hvad fungerer
godt?

- #strong[De handlingsorienterede opgaver:] Punkter som #emph["GÃƒÂ¸r
  booket transportmiddel optaget efter booking"] og #emph["Ved booking,
  tjek at transportmidlet ikke er optaget"] er rigtig gode. De beskriver
  en specifik logik, der skal implementeres, og de er nemme at teste.

- #strong[FejlhÃƒÂ¥ndtering er tÃƒÂ¦nkt ind:] #emph["HÃƒÂ¥ndter valg af
  ugyldigt tidsrum med en fejlmeddelelse"] er en fremragende opgave. Den
  dÃƒÂ¦kker prÃƒÂ¦cis jeres "Extension A" fra Use Casen.

=== Hvad kan forbedres?
<hvad-kan-forbedres>
I ÃƒÂ¸jeblikket er jeres liste en blanding af meget brede koncepter
(Epics), data-krav og specifikke funktioner. For at en backlog er
"brugbar" for en programmÃƒÂ¸r, skal opgaverne vÃƒÂ¦re konkrete, afgrÃƒÂ¦nsede
og testbare.

Her er 3 principper, I kan bruge til at omformulere dem:

==== 1. Brug handlingsudsagnsord (GÃƒÂ¸r det aktivt)
<brug-handlingsudsagnsord-gÃ£r-det-aktivt>
UndgÃƒÂ¥ navneord (substantiver) som overskrifter. En opgave bÃƒÂ¸r
fortÃƒÂ¦lle en udvikler, hvad der skal #emph[laves].

- #emph[FÃƒÂ¸r:] "BekrÃƒÂ¦ftigelse af booking"

- #emph[Efter:] "Vis en bekrÃƒÂ¦ftelsesside/popup, nÃƒÂ¥r en booking er
  gennemfÃƒÂ¸rt."

- #emph[FÃƒÂ¸r:] "Bruger data" (Denne er for bred Ã¢â‚¬â€œ hvad skal der ske
  med dataen?)

- #emph[Efter:] "Opret database-tabel til opbevaring af
  brugerinformation (pÃƒÂ¦dagog-ID, navn)."

==== 2. Del de store "klumper" op (Granularitet)
<del-de-store-klumper-op-granularitet>
En opgave som #emph["Booking funktion"] er alt for stor (det kaldes ofte
et "Epic" i agil udvikling). En bookingfunktion bestÃƒÂ¥r af mange smÃƒÂ¥
dele. For at gÃƒÂ¸re den brugbar, skal den brydes ned i tekniske tasks:

- "Implementer frontend-knap til at indsende booking."

- "Lav backend-endpoint der modtager og validerer booking-anmodningen."

- "Opdater databasen sÃƒÂ¥ transportmidlet tilknyttes pÃƒÂ¦dagogens ID."

==== 3. Overvej at bruge "User Story"-formatet
<overvej-at-bruge-user-story-formatet>
Selvom I spÃƒÂ¸rger efter #emph[tekniske] opgaver, starter en backlog ofte
med User Stories, som derefter brydes ned i tekniske tasks. Dette format
sikrer, at I husker #emph[hvorfor] funktionen laves:

#quote(block: true)[
#strong[Format:] Som `[aktÃƒÂ¸r]` ÃƒÂ¸nsker jeg `[en funktion]`, for at
`[skabe en bestemt vÃƒÂ¦rdi]`.
]

- #emph[FÃƒÂ¸r:] "Oversigt over transportmidler"

- #emph[Efter (User Story):] "Som specialpÃƒÂ¦dagog ÃƒÂ¸nsker jeg at se en
  liste over transportmidler, sÃƒÂ¥ jeg hurtigt kan fÃƒÂ¥ et overblik."

- #emph[TilfÃƒÂ¸j Acceptkriterier (Definition of Done):] \* Listen skal
  vise bÃƒÂ¥de biler og cykler.

  - Listen skal kun vise transportmidler, der er ledige i det valgte
    tidsrum.

#horizontalrule

=== Et eksempel pÃƒÂ¥ en refaktoreret Use Case til Backlog
<et-eksempel-pÃ£-en-refaktoreret-use-case-til-backlog>
Hvis vi tager udgangspunkt i jeres #strong[Use Case: Book
transportmiddel], kunne de tilhÃƒÂ¸rende backlog-opgaver se sÃƒÂ¥dan her ud,
hvis de skal vÃƒÂ¦re direkte klar til et udviklerteam:

#strong[User Story:] Som specialpÃƒÂ¦dagog vil jeg kunne booke et ledigt
transportmiddel, sÃƒÂ¥ jeg kan transportere borgeren til tiden.

#strong[Tekniske tasks under denne story:]

+ #strong[Frontend:] Udvikl en "Book"-knap ud for hvert ledigt
  transportmiddel.

+ #strong[Backend:] Valider modtaget booking-anmodning (Tjek i databasen
  at kÃƒÂ¸retÃƒÂ¸jet #emph[stadig] er ledigt, for at forhindre
  dobbeltbooking).

+ #strong[Database:] Opdater transportmidlets status fra 'Ledig' til
  'Booket' i det specifikke tidsrum.

+ #strong[Frontend/System:] Vis succes-meddelelse til pÃƒÂ¦dagogen ved
  vellykket booking.

+ #strong[System:] Send notifikation/log til admin, hvis systemet fanger
  et forsÃƒÂ¸g pÃƒÂ¥ dobbeltbooking (FejlhÃƒÂ¥ndtering).

Ved at strukturere det sÃƒÂ¥dan, ved den person der skal programmere det,
prÃƒÂ¦cis hvilken lille brik de skal lÃƒÂ¸se fÃƒÂ¸rst.

Vil du have hjÃƒÂ¦lp til at bryde jeres anden Use Case ("Se ledige
transportmidler for et bestemt tidspunkt") ned i helt konkrete
frontend-, backend- og database-opgaver, sÃƒÂ¥ I kan se endnu et eksempel?
]

Vi vurderer umiddelbart, at vi i den aktuelle ramme(tid), ikke har
mulighed for at skabe nogle deciderede gain creators og vi vil bevÃƒÂ¦ge
os for langt udenfor scope sÃƒÂ¥fremt vi prÃƒÂ¸ver.

Derimod er der mulige pain relief i at gÃƒÂ¸re det mere overskueligt
sammenlignet med deres nuvÃƒÂ¦rende lÃƒÂ¸sning (Outlook).

Ud fra AI-genererede pain points diskuterer vi, hvilke briefs vi skal
skrive ud. Vi snakker om, hvordan vi kan reliefe noget pain ved at skabe
bedre overblik over bookingsystemet end der i forvejen er i outlook.

Vores system kan mÃƒÂ¥ske ikke skabe gains, men snarere reliefe pains
(Medarbejdere har allerede et bookingsystem i Outlook, men behÃƒÂ¸ver en
simplere oversigt)

Visionen for vores projekt er at gÃƒÂ¸re det nemmere at koordinere
transportmidlerne.

Administration og hÃƒÂ¥ndtering af borgerbesÃƒÂ¸g er sekundÃƒÂ¦rt
(HÃƒÂ¥ndteringen af borgerbesÃƒÂ¸g/borgerliste i forhold til
transportbooking er en stÃƒÂ¦rkere og langt mere kompliceret lÃƒÂ¸sning, der
i dette projekt ligger uden for scope.)

== Brief
<brief>
- Fokus pÃƒÂ¥ at der skal vÃƒÂ¦re en aktÃƒÂ¸r, et mÃƒÂ¥l og systemets ansvar.
- De bliver holdt sÃƒÂ¥ neutrale som muligt for ikke at trÃƒÂ¦ffe nogle
  arkitektur beslutninger (eks, computerskÃƒÂ¦rm, pÃƒÂ¥ mobil osv. undlades)
  da dette ikke er blevet specificeret fra PO.
- TilfÃƒÂ¸j/fjern medarbejder Use Cases bliver sammenskrevet til een, og
  medarbejder data kommer i stedet udefra.

Vi arbejder med use cases pÃƒÂ¥ fÃƒÂ¸lgende mÃƒÂ¥de: 1. Vi laver en liste af
use cases ud fra vores domÃƒÂ¦ne model og ordanalyse (PO udsagn). 2.
Udvider dem alle til brief. 3. Vi rangerer dem ud fra risiko og
vÃƒÂ¦rdiskabelse. 4. UdvÃƒÂ¦lger de vigtigste 10-20%, som laves til fully
dressed. 5. De fully dressed use cases oversÃƒÂ¦ttes til tekniske
implamenterings opgaver. 6. Herefter pointgives hver opgave i
backloggen(ovenstÃƒÂ¥ende opgaver) 7. Vi laver en detaljeret plan over
nÃƒÂ¦ste iteration og en general plan over alle iterationerne.

Vi taler lang tid om hvorvidt at 4 x 1 skal vurderes lavere end 3 x 2,
da 4 x 1 kan vÃƒÂ¦re en lavthÃƒÂ¦ngende frugt som skaber meget vÃƒÂ¦rdi for
kunden. Eks. med at kunden har et krav om at hjemmesiden skal vÃƒÂ¦re
blÃƒÂ¥, men selvom det er en lavt hÃƒÂ¦ngende frugt er det ikke sikkert det
skal prioriteres over eks. 3 x 2 som ikke skaber lige sÃƒÂ¥ meget
"direkte" vÃƒÂ¦rdi for kunden, men derimod indirekte vÃƒÂ¦rdi fordi kunden
ikke altid ved hvad de gerne vil have, fordi det kan vÃƒÂ¦re lige meget om
hjemmesiden er blÃƒÂ¥ hvis den ikke virker.

Vi kom frem til at vÃƒÂ¦gtning af vÃƒÂ¦rdi og risici baseret pÃƒÂ¥
kvadranterne ikke gav mening, da det ikke er muligt at vurdere hvilken
af de to "midter" kvadranter der skal vÃƒÂ¦gte hÃƒÂ¸jest. Derfor gik vi over
til en tvÃƒÂ¦rakse der gÃƒÂ¥r fra hÃƒÂ¸jest vÃƒÂ¦rdi til lavest (se billeder
nedenfor).

Vi besluttede os for at bruge 1-5 fordi at det er skalaen brugt i excel
arket og ai bakker op om at det er den mest brugte konvention.

#box(image("/docs/attachments/Risk.jpg"))

#box(image("/docs/attachments/Valuecost.jpg"))

Vi arbejder med risk matrix og cost/value diagram. Vi udleder et samlet
tal (ml. 1-5) fra begge og ganger disse for at fÃƒÂ¥ et tal at prioritere
ud fra.

Obs. Vi er klar over, at de to vÃƒÂ¦rdier fra hver diagram ikke bliver
ganget, selvom det muligvis vil give det mest prÃƒÂ¦cise tal, men vi
vurderer, at vores modificerede diagrammer (Se tanker om risk matrix)
giver et mere hÃƒÂ¥ndgribeligt tal at arbejde med.

#box(image("/docs/attachments/{825ACE63-23A5-4514-9340-BEF34A439882}.png"))
