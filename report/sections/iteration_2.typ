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


Overflow iteration 1 til iteration 2.

Ikke rent iterativt, men da vi aldrig nÃƒÂ¥ede at fÃƒÂ¦rdiggÃƒÂ¸re vores
"slice" i iteration 1 giver det ikke mening at gÃƒÂ¥ videre med andre use
cases eller subtasks.

Vi har gjort vores composite pattern generisk sÃƒÂ¥dan at den ikke kun kan
samle "vehicle" repositories men er ÃƒÂ¥ben for at kunne lave nye
kompositter i fremtiden. Den overholder Open/Closed princippet. Denne
beslutning medfÃƒÂ¸rte en udfordring med type sikkerheden. I vores domÃƒÂ¦ne
er visse domÃƒÂ¦ne klasser relateret og andre ikke, derfor skulle vi sikre
at kompositten ikke kunne lave en samling af (eksempelvist) Employee- og
Car objekter. For at implementere denne begrÃƒÂ¦nsning (business rule) har
vi brugt generic covariance til at sikre at Car og Bike objekter kan
samles da de begge implementere IVehicle, men ikke med Employee da den
ikke er del af samme nedarvningstrÃƒÂ¦. Dette er muligt fordi covariance
tillader kompileren at behandle Car og Bike som den samme type uden at
bruge IVehicle objekter.

Vi har valgt at forbedre DX ved at abstrahere vores service klasser bag
ÃƒÂ©n samlet AppFacade klasse. Der er ogsÃƒÂ¥ en god mulighed for at
indkapsle og gemme implementeringsdetaljerne af vore service klasser.

Vi bruger facade som planlagt, og accepter at den modificeres nÃƒÂ¥r
systemet vokser, og dokumenter det som en bevidst trade-off.
