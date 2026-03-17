using KoordineringsApp.Domæne;
using KoordineringsApp.FileIO.Interfaces;
using System;
using System.Collections.Generic;
using System.Text;

namespace KoordineringsApp.Application
{
    public class VehicleService
    {
        private readonly IRepository<Vehicle> _repository;
        public List<Vehicle> Vehicles { get; set; }

        public VehicleService(IRepository<Vehicle> repository)
        {
            _repository = repository;
            Vehicles = new List<Vehicle>();
            LoadVehicles();

        }

        private void LoadVehicles()
        {

        }

    }
}
