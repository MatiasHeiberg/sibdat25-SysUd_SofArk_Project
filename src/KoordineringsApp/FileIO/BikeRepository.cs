using KoordineringsApp.Domain;
using KoordineringsApp.FileIO.Interfaces;
using System.Text.Json;

namespace KoordineringsApp.FileIO
{
    public class BikeRepository : BaseVehicleRepository<Bike>
    {
        public BikeRepository(string path) : base(path)
        {
        }
    }
}
