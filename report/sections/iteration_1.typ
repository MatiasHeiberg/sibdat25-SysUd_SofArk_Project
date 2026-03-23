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


Vi skal diskutere, hvad der skal udarbejdes i fÃƒÂ¸rste iteration (mandag
\+ tirsdag), og hvad der kan nÃƒÂ¥s (tidsestimering).

Vi aftaler, at estimere ud fra points (Fibonacci)

Vi forsÃƒÂ¸ger at dele UC2 (Se ledige transportmidler for et bestemt
tidspunkt) og UC (Book transportmiddel) i smÃƒÂ¥ tekniske task, vi vil
forsÃƒÂ¸ge at tidsestimere.

== Dag 1
<dag-1>
Dag 2

Vi diskutere hvorvidt vores lister der skal vises skal vÃƒÂ¦re singleton
eller om der er en bedre mÃƒÂ¥de. Vi tale om der er 2 mÃƒÂ¥der at hÃƒÂ¥ndtere
dataen, vil vi lÃƒÂ¦se nÃƒÂ¥r programmet kÃƒÂ¸rer og gemme nÃƒÂ¥r vi lukker det
eller vil vi lÃƒÂ¦se og skrive efter hver ÃƒÂ¦ndring. Vi gÃƒÂ¥r med den sidste
og derfor virker det ikke hensigtsmÃƒÂ¦ssigt at bruge singletons.

Vi gÃƒÂ¥r med almindelige lister for nu og laver et controller klasse for
at have listerne i et applikationslag.

Vi taler meget om MVC vs.~MVVM, og prÃƒÂ¸ver at finde rundt i hvad der er
hvad og hvordan vi hensigtsmÃƒÂ¦ssigt designer vores system, og om vi har
brug for en controller klasse til at holde pÃƒÂ¥ vores lister eller om
vores MainWindow.xaml.cs faktisk er vores ModelView klasse - chatGPT
siger nej.

Vi beslutter at have listerne i vores controller-klasse da det i forhold
til vores scope passer bedst, selvom det ogsÃƒÂ¥ ville give mening at have
det i vewmodel i mvvm.

#horizontalrule

Vi lavet et generisk IRepository, mÃƒÂ¥ske?

=== Den arkitektoniske ÃƒÂ¥rsag: Sikkerhed og Hensigt
<den-arkitektoniske-Ã£rsag-sikkerhed-og-hensigt>
Selvom vi hypotetisk set #emph[kunne] tvinge DI-containeren til at
levere en liste, sÃƒÂ¥ ville vi lade vÃƒÂ¦re af rent arkitektoniske
ÃƒÂ¥rsager. Det handler om, hvad vi giver vores `VehicleService` lov til
at gÃƒÂ¸re.

- #strong[Hvad kan en `List<T>`?] En liste har metoder som `.Add()`,
  `.Remove()` og `.Clear()`. Hvis du injicerede en liste, ville din
  `VehicleService` pludselig kunne slette et repository fra samlingen
  eller tilfÃƒÂ¸je et nyt, mens programmet kÃƒÂ¸rer. Det er et brud pÃƒÂ¥
  ansvarsfordelingen! Det er systemets opstart (DI-containeren), der
  bestemmer hvilke datakilder der findes, ikke din service.

- #strong[Hvad kan en `IEnumerable<T>`?] En IEnumerable reprÃƒÂ¦senterer
  blot en "sekvens af data, der kan itereres over". Den har
  #strong[ingen] `.Add()` eller `.Remove()` metoder. Den er read-only
  fra din services perspektiv. Din service kan kun sige
  `foreach (var provider in _vehicleProviders)` og lÃƒÂ¦se fra dem.

Ved at bruge `IEnumerable` sender du et krystalklart signal til andre
udviklere (og dig selv om 6 mÃƒÂ¥neder): #emph["Denne samling af providers
er skrivebeskyttet. Vi skal bare lÃƒÂ¸be dem igennem og bruge dem, ikke
ÃƒÂ¦ndre i selve samlingen."]

Here is a structured summary of your changes that you can use for your
commit message, pull request description, or changelog: Domain
Refactoring Ã¢â‚¬Â¢ Renamed the domain folder from the Danish DomÃƒÂ¦ne to the
English Domain. Ã¢â‚¬Â¢ Migrated Bike.cs, Car.cs, and Employee.cs to the new
Domain folder. Ã¢â‚¬Â¢ Removed the obsolete IVehicle.cs class. FileIO and
Repository Enhancements Ã¢â‚¬Â¢ Introduced BaseVehicleRepository.cs to
consolidate shared vehicle repository logic. Ã¢â‚¬Â¢ Created new interfaces
IVehicle.cs and IVehicleProvider.cs to improve abstractions. Ã¢â‚¬Â¢ Updated
FileHandler.cs, IRepository.cs, BikeRepository.cs, CarRepository.cs, and
EmployeeRepository.cs to adopt the new interfaces and base repository.
Service Reorganization Ã¢â‚¬Â¢ Relocated VehicleService.cs from the
Application folder to the Program folder. Documentation Ã¢â‚¬Â¢ Added Valg
af IEnumerable frem for List i VehicleService.md to document the
architectural decision regarding the use of IEnumerable over List.

Se ogsÃƒÂ¥ \[\[Valg af IEnumerable frem for List i VehicleService\]\]

= System Architecture
<system-architecture>
This document contains static and dynamic models of the current system
architecture based on the existing solution.

== 1. Static Diagram (Class Diagram)
<static-diagram-class-diagram>
This standard Mermaid class diagram maps out the core relationships
between your domain models, repositories, and interfaces based on your
file structure.

```mermaid
classDiagram
    class IRepository~T~ {
        <<interface>>
        +Load() List~T~
    }
    
    class IVehicle {
        <<interface>>
    }
    
    class IVehicleProvider {
        <<interface>>
        +LoadVehicles() IEnumerable~IVehicle~
    }
    
    class FileHandler~T~ {
        <<abstract>>
        -path : string
        #Path : string
        +Load() List~T~
    }
    
    class BaseVehicleRepository~T~ {
        <<abstract>>
        +LoadVehicles() IEnumerable~IVehicle~
    }
    
    class CarRepository { }
    class BikeRepository { }
    class EmployeeRepository { }
    
    class VehicleService { 
        -providers : IEnumerable~IVehicle~ 
        +GetVehicles() IEnumerable~IVehicle~
    }
    
    IRepository~T~ <|.. FileHandler~T~
    FileHandler~T~ <|-- BaseVehicleRepository~T~
    IVehicleProvider <|.. BaseVehicleRepository~T~
    
    BaseVehicleRepository~T~ <|-- CarRepository
    BaseVehicleRepository~T~ <|-- BikeRepository
    FileHandler~T~ <|-- EmployeeRepository
    
    VehicleService --> IVehicleProvider : uses
    
    class Car
    class Bike
    class Employee
    
    IVehicle <|.. Car
    IVehicle <|.. Bike
```

== 2. Dynamic Diagram (Standard Mermaid Sequence)
<dynamic-diagram-standard-mermaid-sequence>
This sequence diagram illustrates a standard program flow of getting
vehicles loaded from the file system.

```mermaid
sequenceDiagram
    participant App
    participant VS as VehicleService
    participant Repo as IVehicleProvider
    participant FH as FileHandler
    participant FS as File System
    participant JSON as JsonSerializer

    App->>VS: GetVehicles()
    VS->>Repo: LoadVehicles()
    
    Note over Repo,FH: Calls Load() inherited from FileHandler
    Repo->>FH: Load()
    
    FH->>FS: File.ReadAllText(_path)
    FS-->>FH: json text
    
    FH->>JSON: Deserialize<List<T>>(text)
    JSON-->>FH: List<T> objects
    
    FH-->>Repo: Returns List<T>
    Repo-->>VS: Returns IEnumerable<IVehicle>
    VS-->>App: IEnumerable<IVehicle>
```

Kom til at formulere tasks ud fra en feature tankegang, selvom Larman
siger at man skal begynde med arkitekturen@larmanApplyingUMLPatterns.
Vores tasks skulle have vÃƒÂ¦re arkitektur-orienteret.

Vi skulle have lavet vores tasks mindre abstrakte, sÃƒÂ¥dan at de
indeholdte arkitekturbeslutninger ikke implementeringer af hele
features.

Den manglende kontakt med domÃƒÂ¦net (PO) har gjort at vi skulle opfinde
mange af kravene som vi skulle basere vores designbeslutninger pÃƒÂ¥. Det
medfÃƒÂ¸rte bl.a. at vores task opdeling blev for vagt/abstrakt/store
hvilket gjorde pointfordelingen urealistisk. Vi nÃƒÂ¥ede kun "4" point ud
af 24. Fordi vores 2 points tasks i virkeligeheden var en toplevel (UI)
task der mÃƒÂ¥ske var 13 eller 21 point vÃƒÂ¦rd.

= System Architecture - Composite Pattern
<system-architecture---composite-pattern>
Dette dokument indeholder et statisk og et dynamisk UML-diagram, der
viser den nye arkitektur efter implementeringen af Composite Pattern for
`IVehicleProvider`.

== 1. Statisk Diagram (Klassediagram)
<statisk-diagram-klassediagram>
Dette klassediagram viser, hvordan Composite-mÃƒÂ¸nsteret er bygget op.
`CompositeVehicleProvider` og de specifikke repositories
(`CarRepository`, `BikeRepository` via `BaseVehicleRepository`)
implementerer alle samme `IVehicleProvider` interface.
`CompositeVehicleProvider` fungerer som en container, der samler flere
providers, og `VehicleService` kender nu udelukkende til ÃƒÂ©t
`IVehicleProvider` objekt.

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
        <<composite>>
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

    class CarRepository { <<leaf>> }
    class BikeRepository { <<leaf>> }

    VehicleService --> IVehicleProvider : bruger
    CompositeVehicleProvider ..|> IVehicleProvider : implementerer
    CompositeVehicleProvider o-- IVehicleProvider : indeholder
    
    BaseVehicleRepository~T~ ..|> IVehicleProvider : implementerer
    BaseVehicleRepository~T~ --|> FileHandler~T~ : arver
    
    CarRepository --|> BaseVehicleRepository~T~ : arver
    BikeRepository --|> BaseVehicleRepository~T~ : arver
```

== 2. Dynamisk Diagram (Sekvensdiagram)
<dynamisk-diagram-sekvensdiagram>
Dette sekvensdiagram viser det dynamiske flow, nÃƒÂ¥r klienten (f.eks.
brugergrÃƒÂ¦nsefladen) anmoder om kÃƒÂ¸retÃƒÂ¸jer. `VehicleService` kalder nu
blot `LoadVehicles()` pÃƒÂ¥ dens ene provider (som her er
`CompositeVehicleProvider`). Compositen itererer over dens egne
under-providers, kalder `LoadVehicles()` pÃƒÂ¥ dem og samler resultaterne.

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
    Note right of CarRepo: IndlÃƒÂ¦ser og deserialiserer<br/>biler fra JSON
    CarRepo-->>CVP: Returnerer IEnumerable<IVehicle> (Biler)
    deactivate CarRepo
    
    CVP->>BikeRepo: LoadVehicles()
    activate BikeRepo
    Note right of BikeRepo: IndlÃƒÂ¦ser og deserialiserer<br/>cykler fra JSON
    BikeRepo-->>CVP: Returnerer IEnumerable<IVehicle> (Cykler)
    deactivate BikeRepo
    
    Note over CVP: Samler alle lister til ÃƒÂ©n liste
    CVP-->>VS: Returnerer samlet IEnumerable<IVehicle>
    deactivate CVP
    
    VS-->>Client: Returnerer IEnumerable<IVehicle>
    deactivate VS
```

== 3. Komplet Statisk Diagram over nuvÃƒÂ¦rende implementering
<komplet-statisk-diagram-over-nuvÃ£rende-implementering>
Dette diagram viser hele den nuvÃƒÂ¦rende implementering, herunder
domÃƒÂ¦nemodeller og FileIO/Repository-klasser, i ÃƒÂ©n samlet visning.

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
        class CompositeVehicleProvider {
            -IEnumerable~IVehicleProvider~ _providers
            +CompositeVehicleProvider(IEnumerable~IVehicleProvider~ providers)
            +LoadVehicles() IEnumerable~IVehicle~
        }
    }

    namespace Services {
        class VehicleService {
            -IVehicleProvider _provider
            +VehicleService(IVehicleProvider provider)
            +GetVehicles() IEnumerable~IVehicle~
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
