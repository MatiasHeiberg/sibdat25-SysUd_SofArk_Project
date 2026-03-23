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


Vi valgte at fÃƒÂ¥ AI til at generere Use Cases ud fra vores domÃƒÂ¦nemodel
inden vi selv skrev Use Cases. BegrÃƒÂ¦nsede det vores egen kreativitet da
vi derefter selv skrev Use Cases?

Vi arbejdede ud fra et kort udsagn fra PO (se 'svar fra klient'). Med
den begrÃƒÂ¦nsede domÃƒÂ¦neviden og uden et lÃƒÂ¸bende samspil med klienten
vurderede vi, at det gav mening at klarlÃƒÂ¦gge domÃƒÂ¦net yderligere ved at
udarbejde en domÃƒÂ¦nemodel fÃƒÂ¸r Use Cases.

Det gÃƒÂ¥r mod Larmans proces, hvor domÃƒÂ¦nemodel laves pÃƒÂ¥ baggrund af
udarbejdede Use Cases. Her er det dog udgangspunktet, at det er i
samspil med forretningsdomÃƒÂ¦net.

Vi har diskuteret om vi skal have med i baghovedet vores begrÃƒÂ¦nsede
scope (skoleprojekt 2 uger) nÃƒÂ¥r vi analysere og prioriterer ELLER om vi
skal forholde os til processen med et ÃƒÂ¥bent sind, og vÃƒÂ¦re naive og
ikke vÃƒÂ¦re forudindtaget om hvad der er vigtigt og hvordan virkeligheden
ser ud i problemdomÃƒÂ¦net.

Vi kan ikke komme uden om at vi godt ved at mange problemer er uden for
vores scope, men vi har valgt at vÃƒÂ¦re sÃƒÂ¥ tro mod den agile tankegang
som muligt, og lade vores analyse vÃƒÂ¦re ÃƒÂ¥ben for alle vinkler. Vi tager
hÃƒÂ¸jde for vores meget lille scope i vores value-driven prioritering af
use cases. Hvis vi kan se at noget er out of scope, placerer vi den i
den hÃƒÂ¸je ende pÃƒÂ¥ #emph[Cost] aksen hvilket pÃƒÂ¥virker dens samlede
prioriterings-score. Ydermere forbeholder vi os retten til at ignorere
en use case pÃƒÂ¥ trods af dens score hvis vi ved at det er out of scope.

Det blev ikke muligt at fÃƒÂ¥ yderligere informationer angÃƒÂ¥ende domÃƒÂ¦ne i
weekenden, sÃƒÂ¥ vi arbejder videre med det udsagn, vi startede med i
starten af projektet.

Vi er allerede ved at gÃƒÂ¥ over tid i forhold til planen, og vi blev ikke
helt fÃƒÂ¦rdige med inception-fasen inden weekenden. Det forsÃƒÂ¸ger vi at
rette op pÃƒÂ¥ ved praktisk at sÃƒÂ¦tte en timer pÃƒÂ¥ udarbejdelsen af vores
fully dressed use cases og kravspecifikationer samt tidestimering af
vores iterationer.

I arbejdet med at rangere notes med vores tekniske tasks pÃƒÂ¥, erfarer vi
allerede fra starten af, at vi ikke har vÃƒÂ¦ret detaljerede nok i vores
udarbejdelse af tasks. Med en task som fx 'Brugerdata' diskuteres det,
om det indeholder oprettelse af fil, der skal lÃƒÂ¦ses og skrives til med
brugerdata, om det bare er en proberty, der er en del af en booking
(fordi vi i stedet har bookingdata i en fil), eller om det i
virkeligheden skal vÃƒÂ¦re en database.

Vi har brug for mere viden om de enkelte tasks for at kunne lave den
bedst mulige tidsestimering. Hvis vi har forskellige ideer om hver
enkelt tasks kompleksitet, bliver det uprÃƒÂ¦cist og konsekvensen bliver,
at ÃƒÂ¸velsen tager alt for lang tid.

Vi bÃƒÂ¸r desuden ikke have sÃƒÂ¥ mange tasks med i en ÃƒÂ¸velse -
uoverskueligt.

== IO
<io>
Vi snakker om brug af factory pattern til vores IO. Det virker godt hvis
vi gerne vil give mulighed for at lÃƒÂ¦se og skrive i flere forskellige
formater, men det er ikke tilfÃƒÂ¦ldet for os. Vi snakker derefter om
facade, fordi det reducerer coupling, men det passer heller ikke lige
pÃƒÂ¥ vores problemstilling. Vi gennemgÃƒÂ¥r ogsÃƒÂ¥ adapter, men det virker
ogsÃƒÂ¥ sÃƒÂ¸gt, og passer bedre sÃƒÂ¥fremt vi have en database implementeret.
Vi snakker derefter om at oprette en repository klasse til hver json vi
vil lÃƒÂ¦se nÃƒÂ¥r nu vores program ikke er stÃƒÂ¸rre end det er. Lige
umiddelbart kan vi ikke se et GoF pattern der passer til
I/O.#box(image("/docs/attachments/12336.jpg"))

Vi taler lidt om tidsestimering pÃƒÂ¥ bagkant af vores fÃƒÂ¸rste iteration
hvor vi kun nÃƒÂ¥ede 2-3/11 opgaver. De to fÃƒÂ¸rste opgaver var meget
simple og vi vÃƒÂ¦gtede dem til vÃƒÂ¦rende 2 point, men de viste sig faktisk
at fylde mere end hel dag, fordi vi fÃƒÂ¸lte os nÃƒÂ¸dsaget til at tage en
helt masse arkitektoniske beslutning om hele systemet. Det vil sige, at
vi i fÃƒÂ¸rste iteration kun nÃƒÂ¥ede omkring 12 point ud af de 24 point vi
havde forventet. Det er dog vigtigt at notere, at vi pga vores
grundighed forventer nogle af de senere implementeringer bliver lettere.
SÃƒÂ¥ mÃƒÂ¥ske i stedet for at nÃƒÂ¥ 24 i den her iteration og 24 nÃƒÂ¦ste nÃƒÂ¥r
vi rent faktisk 12 i den fÃƒÂ¸rste og 32 i den nÃƒÂ¦ste. I nÃƒÂ¦ste projekt
skal vi have in mente, at det er svÃƒÂ¦rt at estimere tiden i
opstartsfasen, da alle vigtige beslutninger om arkitektur osv. bÃƒÂ¸r
tages der.

Hvordan udleder vi tasks? (nÃƒÂ¥r vi mangler vores erfaring) Formal skal
beskrive formÃƒÂ¥l pÃƒÂ¥ konceptouelt niveau og afgrÃƒÂ¦nses pÃƒÂ¥ et logisk
niveau(business rules) - bedstemor skal kunne forstÃƒÂ¥ det.

Problemet der opstÃƒÂ¥r i vores process, er at vi kun har adgang til det
konceptuelle niveau, fordi vi mangler en po (domÃƒÂ¦ne forstÃƒÂ¥else).

LÃƒÂ¸sning mÃƒÂ¥ske trin 0, hvor vi kunstigt beslutter nogle business rules
og genbesÃƒÂ¸ger trin 0 iterativt i gennem processen og
opdaterer/optimerer.
