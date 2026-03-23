using KoordineringsApp.Domain;
using KoordineringsApp.FileIO.Interfaces;
using System.Collections.Generic;

namespace KoordineringsApp.FileIO
{
    public class CompositeVehicleProvider : IVehicleProvider
    {
        private readonly IEnumerable<IVehicleProvider> _providers;

        public CompositeVehicleProvider(IEnumerable<IVehicleProvider> providers)
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
}
