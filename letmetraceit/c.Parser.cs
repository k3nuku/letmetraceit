using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace letmetraceit
{
    internal partial class cParser
    {
        public cParser() : base(null) { }

        public void Parse(string s)
        {
            byte[] inputBuffer = System.Text.Encoding.Default.GetBytes(s);
            MemoryStream stream = new MemoryStream(inputBuffer);
            this.Scanner = new cScanner(stream);
            this.Parse();
        }
    }
}
