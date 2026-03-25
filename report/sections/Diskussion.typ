== Andre Patterns
=== Identificerede Gof-lignende patterns
Selvom vi primært implementerer Facade- og Composite-patterns i vores nuværende design, kan man identificere elementer, der minder om Strategy og Template Method. Man kan argumentere for, at vores Car- og Bike repositories benytter sig af en form for strategi, fordi `VehicleService` afhænger af `IRepository<IVehicle>` i stedet for konkrete datakilder, men adfærden varierer ikke, og der findes kun en metode `Load()`. I det klassiske pattern vil der typisk være flere alternative algoritmer, der gør noget forskelligt, hvilket giver langt større fleksibilitet end vores meget simple dataload. På samme måde fungerer vores `FileHandler<T>` som en slags template, da den har ansvar for filhåndteringen, mens subklasser som `CarRepository` og `BikeRepository` leverer specifikke detaljer, men mangler de abstrakte metoder, som det kræves i et standardiseret Template Method pattern. Helt klassisk definerer baseklassen (`FileHandler<T>`) abstrakte metoder, der overskrives af subklasserne. I vores design sikrer mønstret primært genbrug af kode og ikke en fleksibel mulighed for at variere adfærd.

Ovenstående er et godt eksempel på, hvordan patterns ofte kan genkendes i forskellige former, selv når de ikke implementeres fuldt ud, og hvordan principperne som eksempelvis genbrugelig funktionalitet bliver anvendt, selvom det ikke slavisk følger Gof's klassiske syntaks.
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

Med den generiske løsning kan vi tilføje en `BookingReposit`
