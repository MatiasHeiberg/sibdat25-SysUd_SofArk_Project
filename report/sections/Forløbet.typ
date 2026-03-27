#import "../template.typ": target-width
== Faktiske iterationsstruktur
Den oprindelige plan bestod af tre iterationer, hvor hver iteration tog udgangspunkt i én use case opdelt i konkrete tasks. Det viste sig hurtigt, at vores første planlagte iteration (UC2: Se ledige transportmidler) indeholdt væsentligt mere kompleksitet end forventet og ikke kunne gennemføres med en to-dages iteration.

Allerede på første dag af iteration 1 (mandag d. 16 marts) stod det klart, at inception-fasen ikke var tilstrækkeligt afsluttet. Derfor prioriterede vi at afsætte tid til at færdiggøre estimering og task-formulering frem for at påbegynde implementering på et uklart grundlag.

Vores konceptuelle tilgang til taskformulering, samt beslutningen om at arbejde med vertikale slices, @larmanApplyingUMLPatterns medførte, at mange arkitektoniske beslutninger skulle træffes tidligt i forløbet.

*Iteration 1 (16.-17. marts) - UC2 (24 story points):*

De definerede tasks varierede både i kompleksitet og detaljegrad. Selvom de mest abstrakte tasks (f.eks. "Opret bookingfunktion") var frasorteret på dette tidspunkt, viste det sig, at de resterende tasks dækkede over større tekniske beslutninger end forventet.

Vi prioriterede derfor de mest håndgribelige tasks: "Brugerdata" og "Håndter data for transportmidler". Disse tasks, som oprindeligt var estimeret til 2 story points hver, kom reelt til at udgøre hovedparten af iterationen.

Implementeringen af bruger- og køretøjsdata dækkede reelt over et helt lag af beslutninger - heriblandt filformat, serialisering, repository-pattern og interfacedesign. Som følge heraf blev selve implementeringen først påbegyndt d. 17. marts, efter vi havde fastlagt en lagdelt arkitektur bestående af domæne-, IO- og Servicelag. Med implementeringen fra iterationen resulterede det i følgende klassediagram:

#figure(
  image(
    "../assets/Klassediagrammer/Klassediagram v1.png",
    width: target-width,
  ),
  caption: [Første analyse klassediagram],
)

Den efterfølgende task, "Se ledige køretøjer", blev påbegyndt med henblik på at indrage præsentationslaget. Tasken var estimeret til 8 story points, men blev kun delvist implementeret inden for iterationen. Vi besluttede derfor at lade denne task fortsætte ind i næste iteration.

*Iteration 2 (18.-24. marts) - UC2 (fortsat)*

Den oprindelige plan for iteration 2 var at arbejde med UC3 (Book transportmiddel). Vi vurderede dog, at det var uhensigtsmæssigt at implementere bookinglogik på et fundament, vi ikke var tilfredse med. Derfor blev de tilbageværende tasks videreført til iteration 2.

I perioden onsdag d. 18 marts til fredag d. 20 marts blev tiden brugt på refactoring af arkitekturen. Dette arbejde var ikke direkte task-drevet og bidrog til yderligere forskydning i tidsplanen.

Refaktoreringen resulterede dog i et mere generisk og genanvendeligt design. Eksempelvis kan en fremtidig `BookingRepository` implementeres ved at nedarve fra en `FileHandler<Booking>` uden ændringer af eksisterende kode.

Mandag d. 23 marts blev WPF-delen færdiggjort for tasken, og der blev implementeret en AppFacade for at skjule vores servicelag bag en samlet grænseflade samt oprettelse af DI-root'en.

Forløbet synliggjorde udfordringerne ved at følge UP i en begrænset tidsramme, særligt når der samtidig er fokus på implementering af design patterns og arkitektur generelt. Dertil kommer læringsbyrden, der naturligt medfølger, da de fleste af de principper, begreber og teknikker er nye for os og skal læres sideløbende. På baggrund af dette besluttede vi i slutningen af iteration 2 at reducere vores fokus på den planlagte proces og sikre implementeringen af design patterns.

