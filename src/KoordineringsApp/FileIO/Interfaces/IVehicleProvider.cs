namespace KoordineringsApp.FileIO.Interfaces
{
    public interface IVehicleProvider
    {
        IEnumerable<IVehicle> LoadVehicles();
    }
}