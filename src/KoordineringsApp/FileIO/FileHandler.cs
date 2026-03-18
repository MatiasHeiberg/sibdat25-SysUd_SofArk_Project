using KoordineringsApp.FileIO.Interfaces;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Text.Json;
using System.Text.Json.Nodes;

namespace KoordineringsApp.FileIO
{
    public abstract class FileHandler<T> : IRepository<T>
    {
        private readonly string _path;

        public FileHandler(string path) => _path = path;
        protected string Path => _path;

        public IEnumerable<T> Load()   //Ændringer : Returtypen er ændret fra List<T> til IEnumerable<T>
        {
            var text = File.ReadAllText(_path);
            return JsonSerializer.Deserialize<List<T>>(text);
        }

      }
    }
