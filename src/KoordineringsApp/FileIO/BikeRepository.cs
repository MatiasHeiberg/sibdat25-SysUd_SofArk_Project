using KoordineringsApp.FileIO.Interfaces;
using System.Text.Json;

namespace KoordineringsApp.FileIO
{
    public class BikeRepository : BaseVehicleRepository<BikeRepository>
    {
        public BikeRepository(string path) : base(path)
        {
        }
    }
}
