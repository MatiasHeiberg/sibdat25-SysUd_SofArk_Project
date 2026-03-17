using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Text.Json;
using System.Text.Json.Nodes;

namespace KoordineringsApp.FileIO
{
    public abstract class FileHandler
    {
        private readonly string _path;

        protected FileHandler(string path) => _path = path;
        protected string Path => _path;

        public List<T> Read<T>()
        {
            var text = File.ReadAllText(_path);
            return JsonSerializer.Deserialize<List<T>>(text);
        }

      }
    }
