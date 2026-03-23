---
created: 2026-03-18
section: Process
exclude: false
sortKey: 6.58881
---
```mermaid

classDiagram
	namespace FileIO {
	
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
    
    VehicleService o-- IRepository : afhænger af
    ```
