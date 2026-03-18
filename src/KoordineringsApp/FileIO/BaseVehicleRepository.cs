using KoordineringsApp.FileIO.Interfaces;
using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;

namespace KoordineringsApp.FileIO
{
    public abstract class BaseVehicleRepository<T> : FileHandler<T> where T : IVehicle

    {
        public BaseVehicleRepository(string path) : base(path) 
        {
        }
      
    }
}
    