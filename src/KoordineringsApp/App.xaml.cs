using KoordineringsApp.Domain;
using KoordineringsApp.FileIO;
using KoordineringsApp.FileIO.Interfaces;
using KoordineringsApp.Services;
using System.Configuration;
using System.Data;
using System.Windows;

namespace KoordineringsApp
{
    /// <summary>
    /// Interaction logic for App.xaml
    /// </summary>
    public partial class App : Application
    {
        public void OnStartUp()
        {
            BikeRepository bikeRepository = new("src\\KoordineringsApp\\Data\\Bike.json");
            CarRepository carRepository = new("src\\KoordineringsApp\\Data\\Car.json");

            IEnumerable<IRepository<IVehicle>> repos = [bikeRepository, carRepository];
            var compositeRepo = new CompositeRepository<IVehicle>(repos);

            VehicleService vehicleService = new(compositeRepo);
            BookingService bookingService = new BookingService(); // Dummy service

            AppFacade facade = new AppFacade(vehicleService, bookingService);
            MainWindow mainWindow = new MainWindow(facade);
        }

    }
}