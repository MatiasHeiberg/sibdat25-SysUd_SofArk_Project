using KoordineringsApp.FileIO.Interfaces;
using System.Text.Json;

using KoordineringsApp.Domain;

namespace KoordineringsApp.FileIO
{
    public class BikeRepository : FileHandler<Bike> // Dette er det der forbinder BikeRepository med Bike klassen
    {
        public BikeRepository(string path) : base(path)
        {
        }
    }
}
