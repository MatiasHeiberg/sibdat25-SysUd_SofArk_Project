using KoordineringsApp.Domæne;
using System;
using System.Collections.Generic;
using System.Text;

namespace KoordineringsApp.Application
{
    internal class Controller
    {

        public List<Vehicle> Vehicles { get; set; }

        public Controller()
        {
            Vehicles = new List<Vehicle>();


            
        }

    }
}
