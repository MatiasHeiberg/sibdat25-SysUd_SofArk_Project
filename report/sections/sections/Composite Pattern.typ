

I vores første iteration af projektet var udgangspunktet #link(<UC2>, underline[UC2]) (Se ledige transportmidler for et bestemt tidspunkt). For at kunne estimere implementeringen mere præcist, foldede vi den ud, så den blev flere mindre tasks. Vi oprettede domæneklasser for Car, Bike og Employee og dertilhørende JSON-filer. For at sikre en så fleksibel og vedligeholdelsesvenlig arkitektur som muligt, valgte vi at implementere et repository pattern. Formålet var at abstrahere dataadgangen, så servicelaget ikke har direkte afhængighed til datakilden. Repositories kan virke overflødigt i vores indtil nu simple system, men gør det skalerbart til en fremtidig database som datakilde uden at skulle ændre logik i vores services. Samtidig bidrager det til at holde vores domæneklasser rene og fri for datalagringslogik. Vi introducerede nu interfacet, `IRepository<T>`, fordi vi havde flere repositories med ens funktionalitet - de læser json-filerne og deserialiserer dem til objekter. For at undgå gentagelse oprettede vi den abstrakte `FileHandler`-klasse, som de tre konkrete repositories nedarver fra. Til at starte med implementerede vi en superklasse, `BaseVehicleRepository`, som `CarRepository` og `BikeRepository` nedarvede fra. Den blev introduceret for at samle fælles funktionalitet for transportmidler, mens selve polymorfien blev håndteret gennem `IVehicleProvider`, hvor konkrete typer blev opcastet til `IVehicle`. Med introduktionen af interfacet, `IVehicleProvider`, blev ansvaret flyttet væk fra superklassen, da det var interfacet, som `VehicleService` afhang af. Vores base-klasse gjorde det dog stadig muligt at genbruge logik mellem repositories.

Under implementeringen blev vi med hjælp fra et genereret klassediagram opmærksomme på den unødvendige kompleksitet i vores design, hvilket gjorde både superklassen og interfacet overflødige. På dette tidspunkt bestod vores arkitektur stadig af to abstraktioner - `IRepository<T>` og `IVehicleProvider`, som servicelaget var afhængig af for at kunne håndtere forskellige transportmidler, da `IRepository<Car>` og `IRepository<Bike>` ikke kunne behandles som `IRepository<IVehicle>`. Klassediagrammet gjorde det tydeligt, at superklassen og `IVehicleProvider` kun eksisterede i systemet for at løse det problem. I et forsøg på at samle flere forskellige transportmidler under en struktur, implementerede vi klassen `CompositeVehicleProvider`, der samlede flere `IVehicleProvider`-instanser og fungerede som kompositklassen fra composite pattern.

```cs
  // IVehicleProvider - interfacet som samlingspunktet afhang af

  public interface IVehicleProvider
  {
      IEnumerable<IVehicle> LoadVehicles();
  }

  // BaseVehicleRepository - superklassen der nedarver af Car- og BikeRepository

  public abstract class BaseVehicleRepository<T>
      : FileHandler<T>, IVehicleProvider
  {
      public BaseVehicleRepository(string path) : base(path) { }
      public IEnumerable<IVehicle> LoadVehicles() =>
          Load().Cast<IVehicle>();
  }

  // CompositeVehicleProvider - samler flere IVehicleProvider-instanser og er kompositklassen i composite pattern

  public class CompositeVehicleProvider : IVehicleProvider
  {
      private readonly IEnumerable<IVehicleProvider> _providers;

      public CompositeVehicleProvider(
          IEnumerable<IVehicleProvider> providers)
      {
          _providers = providers;
      }

      public IEnumerable<IVehicle> LoadVehicles()
      {
          var allVehicles = new List<IVehicle>();
          foreach (var provider in _providers)
          {
              allVehicles.AddRange(provider.LoadVehicles());
          }
          return allVehicles;
      }
  }

```
Efter indplementeringen af kovarians blev det muligt at generalisere vores composite pattern og skabe `CompositeRepository<T>` som en generisk løsning. Med kovarians `<out T>` i `IRepository<T>` blev det muligt at behandle repositories af specifikke typer, Bike og Car, som repositories af deres fælles supertype `IVehicle`. Med denne vigtige ændring blev designet åbent for nye samlinger af repositories i senere iterationer. Det betyder, at compileren nu tillader, at `IRepository<Car>` og `IRepository<Bike>`, samt alle fremtidige transportmidler, der implementerer IVehicle, kan behandles som `IRepository<IVehicle>`, og samtidig risikerer vi ikke, at vores employees bliver behandlet som transportmidler, fordi de ikke er en del af samme typehierarki.

Med indførelsen af kovarians kunne vi fjerne `IVehicleProvider` og `BaseVehicleRepository` og erstatte dem med en generisk `CompositeRepository<T>`. Refaktoringen til kovarians gjorde samtidig metoden `LoadVehicles()` overflødig, da behovet for runtime-casting til `IVehicle` blev erstattet af compile-time kontrol. Metoden var `BaseVehicleRepository`'s eneste ansvar - derfor kunne klassen fjernes.

```cs
// IRepository med kovarians (out T) - muliggør at IRepository<Car> kan behandles som IRepository<IVehicle>

public interface IRepository<out T>
{
    IEnumerable<T> Load();
}

// CompositeRepository<T> - generisk composite pattern. T er covariant: Car og Bike kan bruges som IVehicle, men Employee kan ikke, fordi den ikke implementerer IVehicle

public class CompositeRepository<T> : IRepository<T>
{
    private readonly IEnumerable<IRepository<T>> _repositories;

    public CompositeRepository(IEnumerable<IRepository<T>> repositories)
    {
        _repositories = repositories;
    }

    public IEnumerable<T> Load()
    {
        return _repositories.SelectMany(r => r.Load());
    }
}

// VehicleService afhænger nu af IRepository<IVehicle> frem for IVehicleProvider
public class VehicleService
{
    private readonly IRepository<IVehicle> _repository;

    public VehicleService(IRepository<IVehicle> repository)
    {
        _repository = repository;
    }

    public IEnumerable<IVehicle> GetVehicles()
    {
        return _repository.Load();
    }
}
```
Det ender med at give os et generisk Composite Pattern, hvor servicelaget kan hente alle objekter af en type uden at have kendskab til konkrete repository-implementationer.






