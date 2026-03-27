using KoordineringsApp.Domain;
using KoordineringsApp.FileIO.Interfaces;

namespace KoordineringsApp.Services
{
    /// <summary>
    /// Leverer applikationens use cases relateret til køretøjer.
    /// </summary>
    public class VehicleService
    {
        private readonly IRepository<IVehicle> _repository;

        /// <param name="repository">Repository der bruges til at indlæse køretøjer.</param>
        public VehicleService(IRepository<IVehicle> repository)
        {
            _repository = repository;

        }

        /// <summary>
        /// Henter alle tilgængelige køretøjer.
        /// </summary>
        /// <returns>En sekvens af køretøjer.</returns>
        public IEnumerable<IVehicle> GetVehicles()
        {
            return _repository.Load();
        }
    }
}