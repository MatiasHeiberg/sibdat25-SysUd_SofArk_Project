using KoordineringsApp.FileIO.Interfaces;
using System.Text.Json;

namespace KoordineringsApp.FileIO
{
    public class BikeRepository<T> : BaseVehicleRepository<T>
    {
        public BikeRepository(string path) : base(path)
        {
        }
    }
}
