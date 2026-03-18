using KoordineringsApp.Services;
using KoordineringsApp.Domain;
using KoordineringsApp.FileIO.Interfaces;
using System;
using System.Collections.Generic;
using System.Text;

namespace KoordineringsApp.FileIO
{
    public class CarRepository : BaseVehicleRepository<Car>
    {
        public CarRepository(string path) : base(path)
        {
        }
    }
}
