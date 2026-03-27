using KoordineringsApp.FileIO;

namespace KoordineringsApp.Domain
{
    /// <summary>
    /// Repræsenterer en bil i domænemodellen.
    /// </summary>
    public class Car : IVehicle
    {
        public int Id { get; set; }
        public string Name { get; set; } = "";
    }
}
