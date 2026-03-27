using KoordineringsApp.FileIO;
using System;
using System.Collections.Generic;
using System.Text;

namespace KoordineringsApp.Domain
{
    /// <summary>
    /// Repræsenterer en medarbejder i domænemodellen.
    /// </summary>
    public class Employee
    {
        public string Name { get; set; }
        public int ID { get; set; }
    }
}
