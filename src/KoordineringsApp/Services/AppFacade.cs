using KoordineringsApp.Domain;
using KoordineringsApp.FileIO.Interfaces;
using System;
using System.Collections.Generic;
using System.Text;

namespace KoordineringsApp.Services
{
    public class AppFacade
    {
        private readonly VehicleService _vehicleService;
        private readonly BookingService _bookingService;

        public AppFacade(VehicleService vehicleService, BookingService bookingService)
        {
            _vehicleService = vehicleService;
            _bookingService = bookingService;
        }

        public IEnumerable<IVehicle> GetVehicles()
        {
            return _vehicleService.GetVehicles();
        }
    }
}
