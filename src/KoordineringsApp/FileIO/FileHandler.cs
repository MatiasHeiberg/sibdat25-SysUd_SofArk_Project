using KoordineringsApp.FileIO.Interfaces;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Text.Json;
using System.Text.Json.Nodes;

namespace KoordineringsApp.FileIO
{
    /// <summary>
    /// Leverer fælles funktionalitet til indlæsning af JSON-filer for repositories.
    /// </summary>
    /// <typeparam name="T">Domænetypen der deserialiseres fra JSON.</typeparam>
    public abstract class FileHandler<T> : IRepository<T>
    {
        private readonly string _path;

        /// <summary>
        /// Initialiserer en ny filhåndtering for en specifik filsti.
        /// </summary>
        /// <param name="path">Stien til JSON-filen.</param>
        public FileHandler(string path) => _path = path;

        /// <summary>
        /// Den konfigurerede filsti til datafilen.
        /// </summary>
        protected string Path => _path;

        /// <summary>
        /// Læser og deserialiserer alle poster fra den konfigurerede JSON-fil.
        /// </summary>
        /// <returns>En sekvens af deserialiserede domæneobjekter.</returns>
        public IEnumerable<T> Load()
        {
            var text = File.ReadAllText(_path);
            return JsonSerializer.Deserialize<List<T>>(text);
        }

      }
    }
