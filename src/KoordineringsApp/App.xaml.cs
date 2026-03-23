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

        BikeRepository bikeRepository = new();
        CarRepository carRepository = new();
        IEnumerable<IRepository<IVehicle>> repos = [bikeRepository, carRepository];
        CompositeRepository() compositeRepository = new();
        VehicleService vehicleService = new();
        BookingService bookingService = new BookingService();
        AppFacade facade = new AppFacade(vehicleService, bookingService);
        MainWindow mainWindow = new MainWindow(facade);
    }

}
