using System;
using System.Collections.Generic;
using System.Text;

namespace KoordineringsApp.Domæne
{
    public abstract class Vehicle
    {
        public abstract int Id { get; set; }
        public bool IsAvailble { get; set; } = true;
        public abstract string? Name { get; set; }
    }
}
