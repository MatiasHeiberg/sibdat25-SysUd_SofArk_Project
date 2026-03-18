using System;
using System.Collections.Generic;
using System.Text;

namespace KoordineringsApp.FileIO.Interfaces
{
    public interface IRepository<out T>    // Bemærk 'out T'. Nu kan IRepository<Car> behandles som IRepository<IVehicle>

    {
        IEnumerable<T> Load();     
    }
}
