using KoordineringsApp.Services;
using KoordineringsApp.Domain;
using KoordineringsApp.FileIO.Interfaces;
using System;
using System.Collections.Generic;
using System.Text;

namespace KoordineringsApp.FileIO
{
    public class CarRepository : FileHandler<Car> // Dette er det der forbinder CarRepository med Car klassen
    {
        public CarRepository(string path) : base(path)
        {
        }
    }
}
