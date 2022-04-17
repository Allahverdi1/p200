using System;
using System.Data.SqlClient;
using ConsoleApp15.Data;
using ConsoleApp15.Model;

namespace ConsoleApp15
{
    internal class Program
    {
        static void Main(string[] args)
        {
             string connections  = @"Server=WIN-IVUSE4PLT5F\SQLEXPRESS;Database=Futbol;Trusted_Connection=TRUE";
            SqlConnection con = new SqlConnection(connections);
            Console.WriteLine("Name daxil edin");
            string Name = Console.ReadLine();
            Console.WriteLine("HourPrice daxil edin");
            double Price;
            string doubleStr = Console.ReadLine();
            double.TryParse(doubleStr, out Price);
            while (!double.TryParse(doubleStr, out Price))
            {
                Console.WriteLine("HourPrice daxil edin");
                doubleStr = Console.ReadLine();
                double.TryParse(doubleStr,out Price);
            }
            Console.WriteLine("Capacity daxil edin");
            string capacityStr = Console.ReadLine();
            int capacity;
            int.TryParse(capacityStr,out capacity);
            while(!int.TryParse(capacityStr,out capacity))
            {
                Console.WriteLine("Capacity daxil eidn");
                capacityStr = Console.ReadLine();
                int.TryParse(capacityStr, out capacity);
            }

            StadionData stadionData = new StadionData();

            Stadion stadion = new Stadion()
            {
                Name = "AP203",
                HourPrice = 30,
                Capacity = 30
            };
            Stadion stadion1 = new Stadion()
            {
                Name = "AP202",
                HourPrice = 40,
                Capacity = 20
            };
            Stadion stadion2 = new Stadion()
            {
                Name = "AP201",
                HourPrice = 50,
                Capacity = 70
            };

            static void InserStadium(string connections)
            {
                using (SqlConnection con = new SqlConnection(connections))
                {
                    con.Open();

                    Console.WriteLine("Name:");
                    string name = Console.ReadLine();

                    Console.WriteLine("Price:");
                    string price = Console.ReadLine();

                    Console.WriteLine("Capacity:");
                    string capacity = Console.ReadLine();

                    string query = $"INSERT INTO Stadions (Name,HourPrice,Capacity) VALUES ('{name}',{price},{capacity})";

                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.ExecuteNonQuery();
                }

            }






        }
    }
}
