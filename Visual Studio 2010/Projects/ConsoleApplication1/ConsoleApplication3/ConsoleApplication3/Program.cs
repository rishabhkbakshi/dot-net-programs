using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ConsoleApplication3
{
    class Program
    {
        static void Main(string[] args)
        {
            for (int i = 1; i <= 5; i++)
            {
                for (int j = 1; j < i - 1; j++)
                {
                    Console.Write("");
                }
                for (int k = 1; k <= i; k++)
                {
                    Console.Write(" *");
                }
                Console.WriteLine("");
            }
            Console.ReadLine();
        }
    }
}
