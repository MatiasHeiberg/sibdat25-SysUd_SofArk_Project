== Faktiske iterationsstruktur
Vores oprindelig plan indeholdte 3 iterationer, hver med én use case opdelt i tasks. Det viste sig, at vores første planlagte iteration (UC2: Se ledige transportmidler), indeholdte kompleksitet nok til langt mere end en to-dags iteration.

Det faktisk forløb afveg markant fra den oprindelige plan. Allerede mandag d. 16 marts - første dag af iteration 1 - stod det klart, at inception fasen ikke var afsluttet. Derfor prioriterede vi at afsætte tid til at færdiggøre estimering og task-formulering frem for at starte implementering forhastet.

De feature-orienterede tasks samt vores beslutning om, at implementere i "Vertikale slices" @larmanApplyingUMLPatterns afledte mange arkitektoniske beslutninger tidligt i vores designfase.

Iteration 1 - UC 2 (16.-17. marts) (24 story points):
Tasks:

De definerede tasks variede meget i kompleksitet og detaljegrad på trods af at de mest abstrakte (eks. Opret Bookingfunktion) var sortered fra på dette tidspunkt.
Vi prioriterede derfor de meset håndgribelige tasks: "Brugerdata" og "Håndter data for transportmidler". Disse to tasks der oprindeligt var tildelt 2 storypoints hver endte med at tage det meste af 1. Iteration.

Implementeringen af bruger- og køretøjsdata dækkede reelt over et helt lag af beslutninger hveriblandt filformat, serialisering, repository-pattern og interfacedesign. Derfor startede selve implementeringen først d. 17. marts efter vi havde besluttet os for en lagdelt arkitektur bestående af Domæne, IO og Services.

Den efterfølgende task var "Se ledige køretøjer". Denne var netop placeret her for, tidligt at tage hul på de lag vi endnu ikke havde været i berørning med i vores første implementaition, heriblandt præsentationslaget. Denne task der var tildelt 8 storypoints nåede kun at blive halvt implementeret. Derfor besluttede vi, at lade iteration 1 'overflowe' til iteration 2. BURNDOWNCHART

Iteration 2 - UC 2 (18.-24. marts)
Den oprindelig plan for Iteration 2 var UC 3 (Book transportmiddel), men det gav ikke mening, at bygge bookinglogik på et fundament vi ikke var tilfredse med. Derfor valgte vi at lade de tilbageværende tasks overflow til iteration 2 og fortsat arbejde med arkitekturen og en oversigt over køretøjer i præsentationslaget.

Onsdag d. 18 marts og fredag d. 20 marts (torsdag var vi på messe) gik rigtig meget af tiden med at refactor vores arkitektur. Vi havde ikke tasks forøje og arbejdede ikke henimod det og vi satte os i endnu dybere tidsgæld. Dét det derimod afstedkom var en veldesignet og genbruelig arkitektur der gør næste iteration meget let at implementere, eks. vil booking kun kræve en domæne klasse og en bookingservice. Det var her vi blev opmærksomme på udfordringerne ved at følge UP i en så begrænset tidsramme samtidig med, at vores fokuspunkter var at implementere bestemte designpatterns og arkitektur generelt. Derfor besluttede vi, at droppe iteration 3 som følge af det forskudte forløb og fokusere mindre på process og mere på design for den resterende tid af iteration 2.

Mandag d. 23 marts færdigegjorde vi WPF-delen implementerede vi AppFacade, for at skjule vores servicelag bag en samlet grænseflade samt DI-root'en.


//
//2 dages iterationer til et projekt der handler om designpattern og arkitektur?! wtf?
//De opgaver vi løste 18 og 19 marts var refactor freestyle for at finde den perfekt løsning fremfør at arbejde task orienteret.
//Yet, it is not the case that the entire project team focuses on one layer or service in an iteration. Rather, it is more common to implement vertical slices across the layers. This is the UP approach in the elaboration phase: Choose scenarios and requirements that force, in each iteration, a broad coverage across many architecturally significant packages/layers/subsystems, in order to reveal and stabilize the major architectural elements in the early iterations.//
//
//
//Feature-orienterede tasks afstedkom mange akrkitektoniske beslutninger (køretøj data -> iofilformat, serialisering, repository-mønster, interfacedesign
/*/meget kort - Hvad var planen?
kort - overordnet, hvad skete der faktisk?

I1: 1½ dag i stedet for 2, fordi inception ikke var færdig fredag.
2½ UC færdiggjort. Arkitektur og design. Patterns. Domæneviden.

I2: Bevidst overflow I1 - med igangværende task - bookinglogik gav ikke mening på nuværende tidspunkt. '

onsdag d. 18, refaktor, covarians,

resultat: god og sikker struktur, implementering af booking kræver kun en booking klasse og booking service, meget kan genbruges (open closed)

mandag d. 23 (App facade, GoF design pattern for at opfylde opgavens krav.) /*/
