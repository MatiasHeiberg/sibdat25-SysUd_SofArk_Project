---
created: 2026-03-18
section: Iteration 2
exclude: false
sortKey: 6.50875
---
# System Architecture - Composite Pattern

Dette dokument indeholder et statisk og et dynamisk UML-diagram, der viser den nye arkitektur efter implementeringen af Composite Pattern for `IVehicleProvider`.

## 1. Statisk Diagram (Klassediagram)

Dette klassediagram viser, hvordan Composite-mønsteret er bygget op. `CompositeVehicleProvider` og de specifikke repositories (`CarRepository`, `BikeRepository` via `BaseVehicleRepository`) implementerer alle samme `IVehicleProvider` interface. `CompositeVehicleProvider` fungerer som en container, der samler flere providers, og `VehicleService` kender nu udelukkende til ét `IVehicleProvider` objekt.

```mermaid
classDiagram
    class IVehicleProvider {
        <<interface>>
        +LoadVehicles() IEnumerable~IVehicle~
    }

    class VehicleService {
        -IVehicleProvider _provider
        +VehicleService(IVehicleProvider provider)
        +GetVehicles() IEnumerable~IVehicle~
    }

    class CompositeVehicleProvider {
        -IEnumerable~IVehicleProvider~ _providers
        +CompositeVehicleProvider(IEnumerable~IVehicleProvider~ providers)
        +LoadVehicles() IEnumerable~IVehicle~
    }

    class FileHandler~T~ {
        <<abstract>>
        #string Path
        +Load() List~T~
    }

    class BaseVehicleRepository~T~ {
        <<abstract>>
        +BaseVehicleRepository(string path)
        +LoadVehicles() IEnumerable~IVehicle~
    }

    class CarRepository { }
    class BikeRepository { }

    VehicleService --> IVehicleProvider : bruger
    CompositeVehicleProvider ..|> IVehicleProvider : implementerer
    CompositeVehicleProvider o-- IVehicleProvider : indeholder (aggregates)
    
    BaseVehicleRepository~T~ ..|> IVehicleProvider : implementerer
    BaseVehicleRepository~T~ --|> FileHandler~T~ : arver
    
    CarRepository --|> BaseVehicleRepository~T~ : arver
    BikeRepository --|> BaseVehicleRepository~T~ : arver
```

## 2. Dynamisk Diagram (Sekvensdiagram)

Dette sekvensdiagram viser det dynamiske flow, når klienten (f.eks. brugergrænsefladen) anmoder om køretøjer. `VehicleService` kalder nu blot `LoadVehicles()` på dens ene provider (som her er `CompositeVehicleProvider`). Compositen itererer over dens egne under-providers, kalder `LoadVehicles()` på dem og samler resultaterne.

```mermaid
sequenceDiagram
    participant Client
    participant VS as VehicleService
    participant CVP as CompositeVehicleProvider
    participant CarRepo as CarRepository
    participant BikeRepo as BikeRepository

    Client->>VS: GetVehicles()
    activate VS
    
    VS->>CVP: LoadVehicles()
    activate CVP
    
    %% Loop igennem alle providers i Composite
    CVP->>CarRepo: LoadVehicles()
    activate CarRepo
    Note right of CarRepo: Indlæser og deserialiserer<br/>biler fra JSON
    CarRepo-->>CVP: Returnerer IEnumerable<IVehicle> (Biler)
    deactivate CarRepo
    
    CVP->>BikeRepo: LoadVehicles()
    activate BikeRepo
    Note right of BikeRepo: Indlæser og deserialiserer<br/>cykler fra JSON
    BikeRepo-->>CVP: Returnerer IEnumerable<IVehicle> (Cykler)
    deactivate BikeRepo
    
    Note over CVP: Samler alle lister til én liste
    CVP-->>VS: Returnerer samlet IEnumerable<IVehicle>
    deactivate CVP
    
    VS-->>Client: Returnerer IEnumerable<IVehicle>
    deactivate VS
```

## 3. Komplet Statisk Diagram over nuværende implementering

Dette diagram viser hele den nuværende implementering, herunder domænemodeller og FileIO/Repository-klasser, i én samlet visning.

```mermaid
classDiagram
    namespace Interfaces {
        class IRepository~T~ {
            <<interface>>
            +Load() List~T~
        }
        class IVehicleProvider {
            <<interface>>
            +LoadVehicles() IEnumerable~IVehicle~
        }
        class IVehicle {
            <<interface>>
        }
    }

    namespace Domain {
        class Car { }
        class Bike { }
        class Employee { }
    }

    namespace FileIO {
        class FileHandler~T~ {
            <<abstract>>
            -string _path
            #string Path
            +FileHandler(string path)
            +Load() List~T~
        }
        class BaseVehicleRepository~T~ {
            <<abstract>>
            +BaseVehicleRepository(string path)
            +LoadVehicles() IEnumerable~IVehicle~
        }
        class CarRepository { }
        class BikeRepository { }
        class EmployeeRepository { }
    }

    namespace Services {
        class VehicleService {
            -IVehicleProvider _provider
            +VehicleService(IVehicleProvider provider)
            +GetVehicles() IEnumerable~IVehicle~
        }
        class CompositeVehicleProvider {
            -IEnumerable~IVehicleProvider~ _providers
            +CompositeVehicleProvider(IEnumerable~IVehicleProvider~ providers)
            +LoadVehicles() IEnumerable~IVehicle~
        }
    }

    IRepository~T~ <|.. FileHandler~T~
    FileHandler~T~ <|-- BaseVehicleRepository~T~
    FileHandler~T~ <|-- EmployeeRepository

    IVehicleProvider <|.. BaseVehicleRepository~T~
    IVehicleProvider <|.. CompositeVehicleProvider

    BaseVehicleRepository~T~ <|-- CarRepository
    BaseVehicleRepository~T~ <|-- BikeRepository

    CompositeVehicleProvider o-- IVehicleProvider : Indeholder
    VehicleService --> IVehicleProvider : Bruger

    IVehicle <|.. Car
    IVehicle <|.. Bike
```
