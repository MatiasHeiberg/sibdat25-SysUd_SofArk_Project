using KoordineringsApp.FileIO.Interfaces;
using System.Text.Json;

using KoordineringsApp.Domain;

namespace KoordineringsApp.FileIO
{
    /// <summary>
    /// Indlæser cykeldata fra en JSON-fil.
    /// </summary>
    public class BikeRepository : FileHandler<Bike> // Dette er det der forbinder BikeRepository med Bike klassen
    {
        /// <param name="path">Stien til filen med cykeldata.</param>
        public BikeRepository(string path) : base(path)
        {
        }
    }
}
