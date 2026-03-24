using KoordineringsApp.Domain;
using KoordineringsApp.FileIO.Interfaces;

namespace KoordineringsApp.Services
{
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
}