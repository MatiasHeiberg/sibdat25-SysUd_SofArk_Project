using KoordineringsApp.FileIO;

namespace KoordineringsApp.Domæne
{
    public class Bike : Vehicle
    {
        private readonly BikeRepository _repository;

        public override int Id { get; set; }
        public override string? Name { get; set; }

        public Bike(BikeRepository repository) => _repository = repository;
    }
}
