using System;
using System.Collections.Generic;
using System.Text;

namespace KoordineringsApp.FileIO.Interfaces
{
    public interface IRepository<T>
    {
        List<T> Load();
    }
}
