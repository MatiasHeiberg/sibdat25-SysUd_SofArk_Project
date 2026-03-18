using KoordineringsApp.FileIO.Interfaces;
using System.Collections.Generic;

namespace KoordineringsApp.FileIO
{
    public class CompositeVehicleProvider : IRepository<IVehicle>
    {
        private readonly IEnumerable<IRepository<IVehicle>> _repositories;

        public CompositeVehicleProvider(IEnumerable<IRepository<IVehicle>> repositories)
        {
            _repositories = repositories;
        }

        public IEnumerable<IVehicle> Load()
        {
            var allVehicles = new List<IVehicle>();

            foreach (var repo in _repositories)
            {
                allVehicles.AddRange(repo.Load());
            }

            return allVehicles;
        }
    }
}
