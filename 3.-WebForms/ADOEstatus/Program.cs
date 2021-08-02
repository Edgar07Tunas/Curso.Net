using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ADOEstatus
{
    class Program
    {
        static void Main(string[] args)
        {
            ADOEstatus con = new ADOEstatus();
            
            con.Principal();

            Console.ReadKey();
        }
         
    }
}
