using KoordineringsApp.FileIO.Interfaces;
using System;
using System.Collections.Generic;
using System.Text;

using KoordineringsApp.Domain;

namespace KoordineringsApp.FileIO
{
    /// <summary>
    /// Indlæser medarbejderdata fra en JSON-fil.
    /// </summary>
    public class EmployeeRepository : FileHandler<Employee>
    {
        /// <param name="path">Stien til filen med medarbejderdata.</param>
        public EmployeeRepository(string path) : base(path)
        {

        }
    }
}
