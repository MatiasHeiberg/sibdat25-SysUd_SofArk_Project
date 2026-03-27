using System.Collections.Generic;
using System.Linq;
using KoordineringsApp.FileIO.Interfaces;

namespace KoordineringsApp.FileIO
{
    /// <summary>
    /// Aggregerer flere repositories og eksponerer dem som ét repository.
    /// </summary>
    /// <typeparam name="T">Elementtypen der indlæses af repository-samlingen.</typeparam>
    public class CompositeRepository<T> : IRepository<T>
    {
        private readonly IEnumerable<IRepository<T>> _repositories;

        /// <summary>
        /// Initialiserer et nyt composite repository ud fra underliggende repositories.
        /// </summary>
        /// <param name="repositories">De repositories der skal aggregeres.</param>
        public CompositeRepository(IEnumerable<IRepository<T>> repositories)
        {
            _repositories = repositories;
        }

        /// <summary>
        /// Indlæser og flader alle samlinger ud fra de underliggende repositories.
        /// </summary>
        /// <returns>En samlet sekvens med domæneobjekter fra alle repositories.</returns>
        public IEnumerable<T> Load()
        {
            return _repositories.SelectMany(r => r.Load());
        }
    }
}
