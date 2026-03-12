---
created: 2026-03-12
section: Inception
exclude: false
sortKey: 0.44368
---
```mermaid
classDiagram  
  
class Medarbejder {   
koordinerer
}  
  
class Transport {   
}  
  
class Borger {  
}  

class Booking {  
}  

class Bostøtte {  
}  

class Botilbud {  
} 

class Retningslinjer {  
}

class Borgerliste {  
}


Medarbejder  --  Transport : bruger
Medarbejder -- Borger : besøger
Medarbejder -- Booking : laver(outlook)
Medarbejder "14"-- "1" Bostøtte : er
Medarbejder -- Botilbud : ansat
Botilbud -- Bostøtte : tilbyder
Booking -- Transport : har
Booking -- Retningslinjer : har
Medarbejder "1" -->  "1" Borgerliste : har
Borger "1..*" -- "1..*" Borgerliste : på
```