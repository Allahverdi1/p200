using ConsoleApp15.Model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;

namespace ConsoleApp15.Data
{
    internal class StadionData
    {
        public int Insert(Stadion stadion)
        {
            using (SqlConnection con = new SqlConnection(Sql.ConnectionString))
            {
                con.Open();

                string query = $"INSERT INTO Stadions (Name,HourPrice,Capacity) VALUES (@name,@price,@capacity)";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("name", stadion.Name);
                cmd.Parameters.AddWithValue("price", stadion.HourPrice);
                cmd.Parameters.AddWithValue("capacity", stadion.Capacity);


                return cmd.ExecuteNonQuery();
            }
        }
    }
}
