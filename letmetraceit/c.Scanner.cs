using System;
using System.Collections.Generic;
using System.Text;

namespace letmetraceit
{
    internal partial class cScanner
    {

        void GetNumber()
        {
            yylval.s = yytext;
            yylval.d = Double.Parse(yytext);
            yylval.i = int.Parse(yytext);
        }

		public override void yyerror(string format, params object[] args)
		{
			base.yyerror(format, args);
			Console.WriteLine(format, args);
			Console.WriteLine();
		}
    }
}
