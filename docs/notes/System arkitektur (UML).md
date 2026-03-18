---
created: 2026-03-17
section: Iteration 1
exclude: false
sortKey: 5.59721
---
# System Architecture

This document contains static and dynamic models of the current system architecture based on the existing solution.

## 1. Static Diagram (Class Diagram)

This standard Mermaid class diagram maps out the core relationships between your domain models, repositories, and interfaces based on your file structure.

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

## 2. Dynamic Diagram (Standard Mermaid Sequence)

This sequence diagram illustrates a standard program flow of getting vehicles loaded from the file system.

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
