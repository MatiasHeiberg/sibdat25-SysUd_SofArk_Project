using KoordineringsApp.FileIO.Interfaces;

namespace KoordineringsApp.Program
{
    public class VehicleService
    {
        private readonly IEnumerable<IVehicleProvider> _providers;

        public VehicleService(IEnumerable<IVehicleProvider> providers)
        {
            _providers = providers;
        }

        public List<IVehicle> LoadVehicles()
        {
            var allVehicles = new List<IVehicle>();

            foreach (var provider in _providers)
            {
                var vehiclesFromProvider = provider.LoadVehicles();
                allVehicles.AddRange(vehiclesFromProvider);
            }

            return allVehicles;
        }
    }
}