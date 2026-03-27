namespace KoordineringsApp.Domain
{
    /// <summary>
    /// Repræsenterer et køretøj, som kan vises i systemet.
    /// </summary>
    public interface IVehicle
    {
        int Id { get; set; }
        string Name { get; set; }
    }
}