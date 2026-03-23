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


== 3. marts - torsdag
<marts---torsdag>
- \[\[BostÃƒÂ¸tte vs botilbud\]\]
- \[\[Hvad er retningslinjerne\]\]
- \[\[Koordinering mellem kollegaer og/eller beboer\]\]
- \[\[PÃƒÂ¦dagogiske specialister til bestemte borgere\]\]
- \[\[8 transportmidler til 14 medarbejdere, hvad med de sidste 6
  medarbejdere\]\]
- \[\[Outlook booking, er det via kalender events\]\]
- \[\[Bliver en borger besÃƒÂ¸gt mere end en gang dagligt\]\]
- \[\[Er borgerlisten ens hver dag\]\]
- \[\[Er en borgers antal besÃƒÂ¸g variabel\]\]
- \[\[Hvordan fungerer det at bruge Outlook til koordinering\]\]
- \[\[Har i en fast tidsramme for hvert besÃƒÂ¸g\]\]

```mermaid
xychart-beta
    title "Burndown Chart UC1 & UC2"
    x-axis "Opgaver" ["Start","Tjek transport","Tidsramme","Fejl","Data","Optaget","Filter","Bruger","Besked","BekrÃƒÂ¦ft","Oversigt"]
    y-axis "Remaining Work" 0 --> 24
    line "Actual" [24, 22, 20]
    line "Ideal" [24,21.6,19.2,16.8,14.4,12,9.6,7.2,4.8,2.4,0]
```

```mermaid
xychart-beta
    title "Burndown Chart UC1 & UC2"
    x-axis "Opgaver" ["Start","Tjek transport","Tidsramme","Fejl","Data","Optaget","Filter","Bruger","Besked","BekrÃƒÂ¦ft","Oversigt"]
    y-axis "Remaining Work" 0 --> 24
    line "Actual" [24, 22, 20]
    line "Ideal" [24,21.6,19.2,16.8,14.4,12,9.6,7.2,4.8,2.4,0]
```

=== Faktisk process:
<faktisk-process>
```mermaid
gantt
    title Projektplan
    dateFormat  YYYY-MM-DD
    axisFormat  %d-%m

    section 1
    PlanlÃƒÂ¦gning          :done,    p1, 2026-03-13, 1d
    ProjektidÃƒÂ©           :done,    p1, 2026-03-13, 1d
    DomÃƒÂ¦nemodel          :done,    p1, 2026-03-13, 1d
    Use Case workshop    :active,  p1, 2026-03-13, 3d
    1. Iteration (UC1 & UC2)    :active,  p1, 2026-03-16, 2d
    2. Iteration (UC1 & UC2)    :active,  p1, 2026-03-18, 3d


    
```

FÃƒÂ¸r

```csharp
    public class Bike : Vehicle
    {
        private readonly BikeRepository _repository;

        public override int Id { get; set; }
        public override string? Name { get; set; }

        public Bike()
        {
            _repository = new BikeRepository();
        }
    }
```

Efter

```csharp
    public class Bike : Vehicle
    {
        private readonly BikeRepository _repository;

        public override int Id { get; set; }
        public override string? Name { get; set; }

        public Bike(BikeRepository repository) => _repository = repository;
    }
```

\`\`\`mermaid

classDiagram namespace FileIO {

````
    class IRepository~out T~ {
        <<interface>>
        +Load() IEnumerable~T~
    }
    class FileHandler~T~ {
        <<abstract>>
        -_path : string
    }
    class CompositeRepository~T~ {
        -_repositories : IEnumerable~IRepository~T~~
        +Load() IEnumerable~T~
    }
    class CarRepository
    class BikeRepository
    class EmployeeRepository
    
}
namespace Data {

    class bike.json
    class car.json
    class user.json
    
}
namespace Domain {

    class IVehicle {
        <<interface>>
        +Id : int
        +Name : string
    }
    class Car {
        +Id : int
        +Name : string
    }
    class Bike {
        +Id : int
        +Name : string
    }
    class Employee {
        +ID : int
        +Name : string
    }
    
}
namespace Services {

    class VehicleService {
        -_repository : IRepository~IVehicle~
        +GetVehicles() IEnumerable~IVehicle~
    }

}
direction BT

%% Implementation & Inheritance
IVehicle <|.. Car : implementerer
IVehicle <|.. Bike : implementerer

IRepository <|.. FileHandler : implementerer

FileHandler <|-- CarRepository 
FileHandler <|-- BikeRepository 
FileHandler <|-- EmployeeRepository 

%% Composite Pattern og Associationer
IRepository <|.. CompositeRepository : implementerer
CompositeRepository o-- IRepository : aggregerer

VehicleService o-- IRepository : afhÃƒÂ¦nger af
```
````
