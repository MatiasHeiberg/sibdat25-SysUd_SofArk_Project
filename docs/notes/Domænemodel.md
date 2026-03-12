---
created: 2026-03-12
section: Inception
exclude: false
sortKey: 0.44368
---
```mermaid
classDiagram

class Medarbejder
class Transport
class Borger
class Booking
class Bostøtte
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
Medarbejder -- Borger : besøger
Medarbejder -- Booking : laver
Booking -- Retningslinjer : har
Booking -- Outlook : bruger

Medarbejder "14" -- "1" Bostøtte : er
Medarbejder -- Botilbud : ansat
Bostøtte -- Botilbud : tilbyder
Bostøtte -- Privatbil : bruger

Medarbejder -- Borgerliste : har
Borgerliste "1..*" -- "1..*" Borger : på
```

![[12321.jpg]]