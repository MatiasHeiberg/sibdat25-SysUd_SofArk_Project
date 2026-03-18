using KoordineringsApp.FileIO.Interfaces;
using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;

namespace KoordineringsApp.FileIO
{
    public abstract class BaseVehicleRepository<T> : FileHandler<T>, IVehicleProvider 
        where T : IVehicleProvider
    {
        public BaseVehicleRepository(string path) : base(path) 
        {
        }
        public IEnumerable<IVehicle> LoadVehicles() => Load().Cast<IVehicle>();
    }
}
    