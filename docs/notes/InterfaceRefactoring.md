---
created: 2026-03-18
section: Process
exclude: false
sortKey: 6.58881
---
```mermaid

classDiagram
	namespace FileIO {
	
	    class IRepository {
	        <<interface>>
	        +Load~T~() IEnumerable~T~
		}
		class FileHandler {
	        <<abstract>>
	        -_path : string
	    }
		class CompositeVehicleProvider~T~ {
	        -_repositories : IEnumerable~IRepository~
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
	        -_repository : IRepository
	        +GetVehicles() IEnumerable~IVehicle~
	    }
	
	}
    direction BT

    %% Implementation & Inheritance
    IVehicle <|.. Car : implementerer
    IVehicle <|.. Bike : implementerer

    IRepository <|.. FileHandler~T~ : implementerer
    
    FileHandler <|-- CarRepository : nedarver
    FileHandler <|-- BikeRepository : nedarver
    FileHandler <|-- EmployeeRepository : nedarver

    %% Composite Pattern og Associationer
    IRepository <|.. CompositeVehicleProvider~T~ : implementerer
    CompositeVehicleProvider o-- IRepository : aggregerer
    
    VehicleService o-- IRepository : afhænger af
    ```
