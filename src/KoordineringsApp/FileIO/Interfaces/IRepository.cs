using System;
using System.Collections.Generic;
using System.Text;

namespace KoordineringsApp.FileIO.Interfaces
{
    /// <summary>
    /// Definerer læseoperationer til indlæsning af persistente data.
    /// </summary>
    /// <typeparam name="T">Typen som repository returnerer.</typeparam>
    public interface IRepository<out T>
    {
        /// <summary>
        /// Indlæser alle elementer fra den underliggende datakilde.
        /// </summary>
        /// <returns>En sekvens af indlæste domæneobjekter.</returns>
        IEnumerable<T> Load();
    }
}
