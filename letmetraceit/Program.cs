using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using QUT.Gppg;
using System.IO;

namespace letmetraceit
{
    class Program
    {
        static void Main(string[] args)
        {
            FileStream fs = new FileStream(@"btrfs-find-root.c", FileMode.Open);

            cScanner sc = new cScanner();
            sc.SetSource(fs);

            cParser cp = new cParser(sc);
            Console.WriteLine(cp.Parse());
        }
    }
}
