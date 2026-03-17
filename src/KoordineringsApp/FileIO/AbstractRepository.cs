using System;
using System.Collections.Generic;
using System.Text;

namespace KoordineringsApp.FileIO
{
    public abstract class AbstractRepository
    {
        private readonly string _path;

        protected AbstractRepository(string path) => _path = path;
        protected string GetPath() => _path;
    }
}
