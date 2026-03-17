---
created: 2026-03-17
section: Process
exclude: false
sortKey: 5.33639
---
Før
```csharp 
    public class Bike : Vehicle
    {
        private readonly BikeRepository _repository;

        public override int Id { get; set; }
        public override string? Name { get; set; }

        public Bike()
        {
            _repository = new BikeRepository();
        }
    }
```
Efter
```csharp 
    public class Bike : Vehicle
    {
        private readonly BikeRepository _repository;

        public override int Id { get; set; }
        public override string? Name { get; set; }

        public Bike(BikeRepository repository) => _repository = repository;
    }
```