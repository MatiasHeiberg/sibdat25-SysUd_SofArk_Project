using KoordineringsApp.FileIO;
using System;
using System.Collections.Generic;
using System.Text;

namespace KoordineringsApp.Domæne
{
    public class Employee
    {
        private readonly EmployeeRepository _repository;
        public string Name { get; set; }
        public int ID { get; set; }

        public Employee(EmployeeRepository repository)
        {
            _repository = repository;
        }
    }
}
