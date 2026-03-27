using KoordineringsApp.Domain;
using KoordineringsApp.FileIO.Interfaces;
using System;
using System.Collections.Generic;
using System.Text;

namespace KoordineringsApp.Services
{
    /// <summary>
    /// Eksponerer et forenklet indgangspunkt for UI-lagets adgang til services.
    /// </summary>
    public class AppFacade
    {
        private readonly VehicleService _vehicleService;
        private readonly BookingService _bookingService;

        /// <param name="vehicleService">Service til operationer på køretøjer.</param>
        /// <param name="bookingService">Service til operationer på bookinger.</param>
        public AppFacade(VehicleService vehicleService, BookingService bookingService)
        {
            _vehicleService = vehicleService;
            _bookingService = bookingService;
        }

        /// <summary>
        /// Henter alle køretøjer til præsentationslaget.
        /// </summary>
        /// <returns>En sekvens af køretøjer.</returns>
        public IEnumerable<IVehicle> GetVehicles()
        {
            return _vehicleService.GetVehicles();
        }
    }
}
