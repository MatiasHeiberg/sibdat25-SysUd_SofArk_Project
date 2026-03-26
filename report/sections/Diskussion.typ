== Andre Patterns
=== Identificerede Gof-lignende patterns
Selvom vi primært implementerer Facade- og Composite-patterns i vores nuværende design, kan man identificere elementer, der minder om Strategy og Template Method. Man kan argumentere for, at vores Car- og Bike repositories benytter sig af en form for strategi, fordi `VehicleService` afhænger af `IRepository<IVehicle>` i stedet for konkrete datakilder, men adfærden varierer ikke, og der findes kun en metode `Load()`. I det klassiske pattern vil der typisk være flere alternative algoritmer, der gør noget forskelligt, hvilket giver langt større fleksibilitet end vores meget simple dataload. På samme måde fungerer vores `FileHandler<T>` som en slags template, da den har ansvar for filhåndteringen, mens subklasser som `CarRepository` og `BikeRepository` leverer specifikke detaljer, men mangler de abstrakte metoder, som det kræves i et standardiseret Template Method pattern. Helt klassisk definerer baseklassen (`FileHandler<T>`) abstrakte metoder, der overskrives af subklasserne. I vores design sikrer mønstret primært genbrug af kode og ikke en fleksibel mulighed for at variere adfærd.

Ovenstående er et godt eksempel på, hvordan patterns ofte kan genkendes i forskellige former, selv når de ikke implementeres fuldt ud, og hvordan principperne som eksempelvis genbrugelig funktionalitet bliver anvendt, selvom det ikke slavisk følger Gof's klassiske syntaks.
=== SOLID og GRASP

De arkitektoniske beslutninger vi traf undervejs i projektet har som oftest taget udgangspunkt i SOLID- og GRASP-principperne. De beslutninger der bliver beskrevet i afsnit 4.1 er drevet af et ønske om at overholde disse.

En tidlig version af domæneklassen `Bike` viste et klart brud på Single Responsebility Principle, da klassen selv oprettede sit repository med `new` direkte i konstruktøren:
```csharp
public class Bike : Vehicle
  {
      private readonly BikeRepository _repository;
      public Bike()
      {
        _repository = new BikeRepository();
      }
  }
```
Her havde `Bike` både til opgave at holde domænedata samt håndtere dataadgang.  Vi rettede dette brud på SRP ved at separere domæne- og IO-laget tydeligt fra hinanden, så dataadgang håndteres af repositories mens `Bike` udelukkende repræsenterer domænet.

Det er værd at bemærke, at vores implementering af 'Facade pattern' `AppFacade` bevidst bryder Open/closed-princippet.

Hver gang en ny service tilføjes kræver det ændring af kontruktør og metodeliste:

```csharp
public AppFacade(VehicleService vehicleService, BookingService bookingService)
{
    _vehicleService = vehicleService;
    _bookingService = bookingService;
}
```
Dette er et kompromis vi bevidst har indgået da Facade-mønsterets formål netop er at samle services og holde præsentationslaget uvidende omkring dem. Hertil forbedrer det developer experience, ved at abstrahere vores service lag bag en samlet grænseflade.

OCP var også den primære årsag til vores refactoring af vores Composite-pattern implementering `CompositeVehicleProvider` til den generiske `CompositeRepository<T>`.

Med den generiske løsning kan vi tilføje en `BookingRepository` uden at ændre andet kode:

```csharp
public class BookingRepository : FileHandler<Booking>
  {
      public BookingRepository(string path) : base(path)
      {
      }
  }
```

Herefter kan den bruges direkte med den eksisterende `CompositeRepository<T>`:

```csharp
IEnumerable<IRepository<Booking>> repos = [new BookingRepository("Data\\Booking.json")];
var compositeBookingRepo = new CompositeRepository<Booking>(repos);
```

Inden refaktoreringen var `CompositeVehicleProvider` lukket for udvidelse da den var hardcodet til `IVehicle`.

Et andet problem vi løste under vores refaktorering var et direkte brud på Liskov Substitution Principle. Vi erkendte, at `IReposity<Car>` ikke kunne erstatte `IRepository<Vehicle>` på trods af, at `Car` implementerer `Ivehicle` at. Som beskreveet i 4.1 løste vi dette ved indførelsen af kovarians.

Vi har endvidere fokuseret på, at samle alle afhængigheder, som Dependency Inversion princippet foreskriver, i DI-roden i `App.xaml.cs`.

I følge GRASP's Information Expert princip bør ansvar placeres der, hvor informationen befinder sig. `FileHandler<T>` er vores informationsekspert for filindlæsning, da den kender filstien og typen samt har ansvaret for at deserialisere.

Hele vores forløb har i høj grad været præget af design- og arkitekturvalg og det er i sær SOLID- og GRASP-principperne der har guidet os, både i vores oprindelige beslutninger men særledes også i vores refaktorering. Den tid det har krævet, at efterleve principperne korrekt, fremfor at levere funktionalitet, har igennem hele forløbet et diskussionsemne for os. Derfor, er det i sær dette forhold mellem designkvalitet og iterativ levering i en læringsmæssig kontekst som er udgangspunket for den følgende refleksion.
