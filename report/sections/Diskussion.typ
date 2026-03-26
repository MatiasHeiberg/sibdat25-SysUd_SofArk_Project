== Andre Patterns
=== Identificerede GoF-lignende patterns
Selvom vi først og fremmest implementerer Facade- og Composite patterns i vores nuværende design, kan man identificere elementer, der minder om Strategy og Template Method. Man kan argumentere for, at vores Car- og Bike repositories benytter sig af en form for strategi, fordi `VehicleService` afhænger af `IRepository<IVehicle>` i stedet for konkrete datakilder, men adfærden varierer ikke, og der findes kun en metode `Load()`. I det klassiske pattern vil der typisk være flere alternative algoritmer, der gør noget forskelligt, hvilket giver langt større fleksibilitet end vores meget simple dataload. På samme måde fungerer vores `FileHandler<T>` som en slags template, da den har ansvar for filhåndteringen, mens subklasser som `CarRepository` og `BikeRepository` leverer specifikke detaljer, men mangler de abstrakte metoder, som det kræves i et standardiseret Template Method pattern. Helt klassisk definerer baseklassen abstrakte metoder, der overskrives af subklasserne. I vores design sikrer mønstret primært genbrug af kode og ikke en fleksibel mulighed for at variere adfærd.

Ovenstående er et godt eksempel på, hvordan patterns ofte kan genkendes i forskellige former, selv når de ikke implementeres fuldt ud, og hvordan principperne som eksempelvis genbrugelig funktionalitet bliver anvendt, selvom det ikke slavisk følger GoF's klassiske syntaks.
=== Fravalgte patterns
I forbindelse med vores tidlige design, som tog udgangspunkt i IO-laget, overvejede vi flere GoF-patterns, inden vi landede på repository-løsningen.

Vi undersøgte *Factory Pattern* til oprettelse af forskellige typer objekter fra vores datakilde. Men da vi allerede havde fastlagt os på udelukkende at arbejde med JSON-filer, vurderede vi, at introduktionen af Factory ville øge kompleksiteten, så det ikke længere stod mål med behovet.

Det var det samme ræsonnement, der fik os til at fravælge *Adapter Pattern*. Vi overvejede at bruge det som en bro mellem vores domænelag og et fremtidigt datalager. Men da dette datalager slet ikke var i vores scope, og for at undgå at størstedelen af vore designbeslutninger var taget af hensyn til mulige fremtidige udvidelser, besluttede vi os for at fokusere på at løse et reelt behov og ikke over-engineere vores system.

Vi havde et behov for at håndtere vores lister med transportmidler, der skulle vises i UI'et. I den forbindelse kom vi ind på brugen af *Singleton Pattern* til at sikre os, at kun én instans af samlingen eksisterer på tværs af applikationen. Vi besluttede os dog for at læse og skrive data ved hver ændring, og derved gjorde det Singleton-listen overflødig.

== SOLID og GRASP

De arkitektoniske beslutninger vi traf undervejs i projektet har som oftest taget udgangspunkt i SOLID- og GRASP-principperne. De beslutninger, der bliver beskrevet i afsnit 4.1, er drevet af et ønske om at overholde disse.

En tidlig version af domæneklassen `Bike` viste et klart brud på Single Responsibility Principle, da klassen selv oprettede sit repository med `new` direkte i konstruktøren:
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
Her havde `Bike` både til opgave at holde domænedata samt håndtere dataadgang.  Vi rettede dette brud på SRP ved at separere domæne- og IO-laget tydeligt fra hinanden, så dataadgang håndteres af repositories, mens `Bike` udelukkende repræsenterer domænet.

Det er værd at bemærke, at vores implementering af Facade pattern med `AppFacade` bevidst bryder Open Closed-princippet.

Hver gang en ny service tilføjes, kræver det ændring af konstruktør og metodeliste:

```csharp
public AppFacade(VehicleService vehicleService, BookingService bookingService)
{
    _vehicleService = vehicleService;
    _bookingService = bookingService;
}
```
Dette er et kompromis, vi bevidst har indgået, da Facade-mønstrets formål netop er at samle services og holde præsentationslaget uvidende om dem. Hertil forbedrer det developer experience ved at abstrahere vores servicelag bag en samlet grænseflade.

OCP var også den primære årsag til vores refaktorering af vores Composite pattern-implementering `CompositeVehicleProvider` til den generiske `CompositeRepository<T>`.

Med den generiske løsning kan vi tilføje en `BookingRepository` uden at ændre anden kode:

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

Inden refaktoreringen var `CompositeVehicleProvider` lukket for udvidelse, da den var hardcodet til `IVehicle`.

Et andet problem vi løste under vores refaktorering var et direkte brud på Liskov Substitution Principle. Vi erkendte, at `IRepository<Car>` ikke kunne erstatte `IRepository<Vehicle>`, på trods af at `Car` implementerer `IVehicle`. Som beskrevet i 4.1 løste vi dette ved indførelsen af kovarians.

Vi har endvidere fokuseret på at samle alle afhængigheder, som Dependency Inversion-princippet foreskriver, i DI-roden i `App.xaml.cs`.

Ifølge GRASP's Information Expert-princip bør ansvar placeres der, hvor informationen befinder sig. `FileHandler<T>` er vores informationsekspert for filindlæsning, da den kender filstien og typen samt har ansvaret for at deserialisere.

Hele vores forløb har i høj grad været præget af design- og arkitekturvalg, og det er især SOLID- og GRASP-principperne, der har guidet os - både i vores oprindelige beslutninger, men særligt også i vores refaktorering. Den tid, det har krævet at efterleve principperne korrekt fremfor at levere funktionalitet, har igennem hele forløbet været et diskussionsemne for os. Derfor er det især dette forhold mellem designkvalitet og iterativ levering i en læringsmæssig kontekst, som er udgangspunktet for den følgende refleksion.
