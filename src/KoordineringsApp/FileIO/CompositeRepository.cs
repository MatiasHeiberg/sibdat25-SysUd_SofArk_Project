using System.Collections.Generic;
using System.Linq;
using KoordineringsApp.FileIO.Interfaces;

namespace KoordineringsApp.FileIO
{
    // Denne klasse kan nu genbruges for både Vehicles og Employees!
    public class CompositeRepository<T> : IRepository<T>
    {
        private readonly IEnumerable<IRepository<T>> _repositories;

        public CompositeRepository(IEnumerable<IRepository<T>> repositories)
        {
            _repositories = repositories;
        }

        public IEnumerable<T> Load()
        {
            // Vi samler data fra alle under-repositories
            return _repositories.SelectMany(r => r.Load());
        }
    }
}
