---
created: 2026-03-17
section: Iteration 1
exclude: false
sortKey: 5.48062
---
### Den arkitektoniske årsag: Sikkerhed og Hensigt

Selvom vi hypotetisk set _kunne_ tvinge DI-containeren til at levere en liste, så ville vi lade være af rent arkitektoniske årsager. Det handler om, hvad vi giver vores `VehicleService` lov til at gøre.

- **Hvad kan en `List<T>`?** En liste har metoder som `.Add()`, `.Remove()` og `.Clear()`. Hvis du injicerede en liste, ville din `VehicleService` pludselig kunne slette et repository fra samlingen eller tilføje et nyt, mens programmet kører. Det er et brud på ansvarsfordelingen! Det er systemets opstart (DI-containeren), der bestemmer hvilke datakilder der findes, ikke din service.
    
- **Hvad kan en `IEnumerable<T>`?** En IEnumerable repræsenterer blot en "sekvens af data, der kan itereres over". Den har **ingen** `.Add()` eller `.Remove()` metoder. Den er read-only fra din services perspektiv. Din service kan kun sige `foreach (var provider in _vehicleProviders)` og læse fra dem.
    

Ved at bruge `IEnumerable` sender du et krystalklart signal til andre udviklere (og dig selv om 6 måneder): _"Denne samling af providers er skrivebeskyttet. Vi skal bare løbe dem igennem og bruge dem, ikke ændre i selve samlingen."_