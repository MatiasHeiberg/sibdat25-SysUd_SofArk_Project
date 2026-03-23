using KoordineringsApp.FileIO;

namespace KoordineringsApp.Domain
{
    public class Bike : IVehicle
    {
        public int Id { get; set; }
        public string Name { get; set; } = "";
    }
}
