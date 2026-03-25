== Andre Patterns
== SOLID og GRASP

De arkitektoniske beslutninger vi traf undervejs i projektet har som oftest taget udgangspunkt i SOLID- og GRASP-principperne. De beslutninger der bliver beskrevet i afsnit 4.1 er drevet af et ønske om at overholde disse.

En tidlig version af domæneklassen {Employee} viste et klart brud på Single Responsebility Principle, da den selv holdt en reference til sit repository:
```csharp
public class Employee
  {
      private readonly EmployeeRepository _repository;
      public Employee(EmployeeRepository repository) =>
  _repository = repository;
  }
```
Her havde `Employee` både til opgave at holde domænedata samt håndtere data.  Vi rettede dette brud på SRP ved at separere domæne- og IO-laget tydeligt fra hinanden.

Det er værd at bemærke, at vores implementering af 'Facade pattern' `AppFacade` bevidst bryder Open/closed-princippet.

Hver gang en ny service tilføjes kræver det ændring af kontruktør og metodeliste:

 ```csharp
  public AppFacade(VehicleService vehicleService, BookingService
   bookingService)
  {
      _vehicleService = vehicleService;
      _bookingService = bookingService;
  }
  ```
Dette er et kompromis vi bevidst har indgået da Facade-mønsterets formål netop er at samle services og holde præsentationslaget uvidende omkring dem. (NÆVN DX?)

OCP var også den primære årsag til vores refactoring af vores Composite-pattern implementering `CompositeVehicleProvider` til den generiske `CompositeRepository<T>`.

Med den generiske løsning kan vi tilføje en `BookingReposit