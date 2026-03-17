using KoordineringsApp.FileIO;

namespace KoordineringsApp.Domæne
{
    public class Car : Vehicle
    {
        private readonly CarRepository _repository;
        public override int Id { get; set; }
        public override string? Name { get; set; }
        public Car(CarRepository repository) => _repository = repository;
    }
}
