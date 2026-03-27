== Composite Pattern
#include "sections/Composite Pattern.typ"
== Facade Pattern
Efterhånden som servicelaget tog form, opstod spørgsmålet om, hvordan præsentationslaget skulle kommunikere med det. Vores diskussioner tog udgangspunkt i MVC versus MVVM, hvilket vi vurderede lå uden for vores scope og samtidig ikke bidrog med yderligere design patterns med henblik på opgavekravene. I stedet valgte vi at indføre AppFacade som et enkelt kontaktpunkt.

Med indførelsen af AppFacade kunne vi derved undgå den direkte kobling mellem præsentationslaget og de enkelte services. Dertil bidrog det også til at forbedre developer experience, da man undgår at skulle tilpasse `MainWindow` i takt med at nye services bliver tilføjet. Det bevidste trade-off i forhold til Open/Closed-princippet behandles i afsnit 5.2.

```cs
public class AppFacade
{
    private readonly VehicleService _vehicleService;
    private readonly BookingService _bookingService;

    public AppFacade(VehicleService vehicleService, BookingService bookingService)
    {
        _vehicleService = vehicleService;
        _bookingService = bookingService;
    }

    public IEnumerable<IVehicle> GetVehicles()
    {
        return _vehicleService.GetVehicles();
    }
}
```
De enkelte services, som `MainWindow` har brug for at kende, er derved samlet i `AppFacade`, og kun de relevante metoder eksponeres for præsentationslaget.

Dette giver et renere og mere udviklervenligt præsentationslag, da `MainWindow` udelukkende afhænger af `AppFacade` og de tilgængelige metoder.

```cs
 public partial class MainWindow : Window
 {
     private readonly AppFacade _facade;
     public MainWindow(AppFacade facade)
     {
         InitializeComponent();
         _facade = facade;
         VehicleList.ItemsSource = _facade.GetVehicles();
     }
 }
```

Derved kan alle afhængigheder flyttes over i DI-roden i `App.xaml.cs` i overensstemmelse med Dependency

```cs
public partial class App : Application
{
    protected override void OnStartup(StartupEventArgs e)
    {
        base.OnStartup(e);
        BikeRepository bikeRepository = new("Data\\Bike.json");
        CarRepository carRepository = new("Data\\Car.json");

        IEnumerable<IRepository<IVehicle>> repos = [bikeRepository, carRepository];
        var compositeRepo = new CompositeRepository<IVehicle>(repos);

        VehicleService vehicleService = new(compositeRepo);
        BookingService bookingService = new BookingService(); // Dummy service

        AppFacade facade = new AppFacade(vehicleService, bookingService);
        MainWindow mainWindow = new MainWindow(facade);
        mainWindow.Show();
    }
}
```
Her oprettes repositories, services og `AppFacade`, hvorefter `MainWindow` modtager facaden i dens konstruktør.

Ved at centrere alle afhængigheder i DI-roden opnås en klar adskillelse af systemets lag: filsystemet kendes kun af repositories, services kendes kun af `AppFacade` og præsentationslaget kender kun til facaden. Tilsammen udgør Composite- og Facade-pattern fundamentet for systemets arkitektur.
