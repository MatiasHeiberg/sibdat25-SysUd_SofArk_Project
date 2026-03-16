using System;
using System.Collections.Generic;
using System.Text;

namespace KoordineringsApp.FileIO
{
    public abstract class AbstractRepository
    {
        private abstract string Path { get; private set; }
        public string Load()
        {
            return default;
        }
        public void Save()
        {
        }
    }
}
