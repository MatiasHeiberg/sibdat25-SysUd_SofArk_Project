---
created: 2026-03-18
section: Process
exclude: false
sortKey: 6.58371
---
``` mermaid
classDiagram
    direction BT

    %% Interfaces
    class IRepository~T~ {
        <<interface>>
        +Load() IEnumerable~T~
    }

    class IVehicle {
        <<interface>>
        +Id : int
        +Name : string
    }

    %% Domæne Models
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

    %% FileIO & Repositories
    class FileHandler~T~ {
        <<abstract>>
        -_path : string
        #Path : string
        +Load() IEnumerable~T~
    }

    class BaseVehicleRepository~T~ {
        <<abstract>>
        <<where T : IVehicle>>
    }

    class CarRepository {
    }

    class BikeRepository {
    }

    class EmployeeRepository~T~ {
    }

    class CompositeVehicleProvider {
        -_repositories : IEnumerable~IRepository~
        +Load() IEnumerable~IVehicle~
    }

    %% Services
    class VehicleService {
        -_repository : IRepository~IVehicle~
        +GetVehicles() IEnumerable~IVehicle~
    }

    %% Implementation & Inheritance
    IVehicle <|.. Car : implementerer
    IVehicle <|.. Bike : implementerer

    IRepository~T~ <|.. FileHandler~T~ : implementerer
    FileHandler~T~ <|-- BaseVehicleRepository~T~ : nedarver
    
    BaseVehicleRepository~T~ <|-- CarRepository : nedarver
    BaseVehicleRepository~T~ <|-- BikeRepository : nedarver
    FileHandler~T~ <|-- EmployeeRepository~T~ : nedarver

    %% Composite Pattern og Associationer
    IRepository~T~ <|.. CompositeVehicleProvider : implementerer (IVehicle)
    CompositeVehicleProvider o-- IRepository~T~ : aggregerer (Composite Pattern)
    
    VehicleService o-- IRepository~T~ : afhænger af (Dependency Injection)


```
