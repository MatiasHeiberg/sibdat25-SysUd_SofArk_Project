using KoordineringsApp.FileIO.Interfaces;
using System;
using System.Collections.Generic;
using System.Text;

using KoordineringsApp.Domain;

namespace KoordineringsApp.FileIO
{
    public class EmployeeRepository : FileHandler<Employee>
    {
        public EmployeeRepository(string path) : base(path)
        {

        }
    }
}
