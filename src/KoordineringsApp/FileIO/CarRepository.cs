using KoordineringsApp.Services;
using KoordineringsApp.Domain;
using KoordineringsApp.FileIO.Interfaces;
using System;
using System.Collections.Generic;
using System.Text;

namespace KoordineringsApp.FileIO
{
    /// <summary>
    /// Indlæser bildata fra en JSON-fil.
    /// </summary>
    public class CarRepository : FileHandler<Car> // Dette er det der forbinder CarRepository med Car klassen
    {

        /// <param name="path">Stien til filen med bildata.</param>
        public CarRepository(string path) : base(path)
        {
        }
    }
}
