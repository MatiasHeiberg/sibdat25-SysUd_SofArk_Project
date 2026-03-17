using KoordineringsApp.FileIO.Interfaces;
using System;
using System.Collections.Generic;
using System.Text;

namespace KoordineringsApp.FileIO
{
    public class EmployeeRepository<T> : FileHandler<T>
    {
        public EmployeeRepository(string path) : base(path)
        {

        }
    }
}
