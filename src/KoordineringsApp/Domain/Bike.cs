using KoordineringsApp.FileIO;

namespace KoordineringsApp.Domain
{
    /// <summary>
    /// Repræsenterer en cykel i domænemodellen.
    /// </summary>
    public class Bike : IVehicle
    {
        public int Id { get; set; }
        public string Name { get; set; } = "";
    }
}
