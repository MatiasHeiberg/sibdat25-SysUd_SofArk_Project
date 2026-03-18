using KoordineringsApp.FileIO.Interfaces;

namespace KoordineringsApp.Services
{
    public class VehicleService
    {
        private readonly IEnumerable<IVehicleProvider> _providers;

        public VehicleService(IEnumerable<IVehicleProvider> providers)
        {
            _providers = providers;
        }

        public IEnumerable<IVehicle> GetVehicles()
        {
            var allVehicles = new List<IVehicle>();

            foreach (var provider in _providers)
            {
                IEnumerable<IVehicle> vehiclesFromProvider = provider.LoadVehicles();
                allVehicles.AddRange(vehiclesFromProvider);
            }

            return (IEnumerable<IVehicle>)allVehicles;
        }
    }
}