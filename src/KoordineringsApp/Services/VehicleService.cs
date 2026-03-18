using KoordineringsApp.FileIO.Interfaces;

namespace KoordineringsApp.Services
{
    public class VehicleService
    {
        private readonly IVehicleProvider _provider;

        public VehicleService(IVehicleProvider provider)
        {
            _provider = provider;
        }

        public IEnumerable<IVehicle> GetVehicles()
        {
            return _provider.LoadVehicles();
        }
    }
}