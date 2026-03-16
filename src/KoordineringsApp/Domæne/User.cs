using KoordineringsApp.FileIO;
using System;
using System.Collections.Generic;
using System.Text;

namespace KoordineringsApp.Domæne
{
    public class Employee
    {
        private readonly UserRepository _repository;
        public string Name { get; set; }
        public int ID { get; set; }

        public Employee()
        {
            _repository = new UserRepository();
        }
    }
}
