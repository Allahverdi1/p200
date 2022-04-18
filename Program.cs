using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using BlogTask.Data;
using BlogTask.Model;

namespace BlogTask
{
    internal class Program
    {
        static string conString = @"Server=WIN-IVUSE4PLT5F\SQLEXPRESS;Database=Blog;Trusted_Connection=TRUE";
        static void Main(string[] args)
        {
            PostData postData = new PostData();
            Console.WriteLine("Axtardiginiz postun id deyeri:");
            string idStr = Console.ReadLine();
            int id;

            while (!int.TryParse(idStr, out id))
            {
                Console.WriteLine("Id deyerini dogru daxil edin!");
                Console.WriteLine("Axtardiginiz postun id deyeri:");
                idStr = Console.ReadLine();
            }

            Post post = postData.GetPostById(id);

            if (post != null)
            {
               Console.WriteLine($"Name: {post.Title} - Price: {post.Content}");
            }
            else
            {
                Console.WriteLine($"{id} id deyerli Post yoxdur!");
            }
        }
        static void ShowPosts()
        {
            using (SqlConnection con = new SqlConnection(conString))
            {
                con.Open();
                string query = "SELECT * FROM Posts";

                SqlCommand cmd = new SqlCommand(query, con);

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        Console.WriteLine($"Id : {dr.GetInt32(0)} - Title: {dr.GetString(40)} - Price: {dr.GetString(20)}");
                    }
                }
            }
            static List<Post> GetAllPosts()
            {
                List<Post> posts = new List<Post>();

                using (SqlConnection con = new SqlConnection(conString))
                {
                    con.Open();

                    string query = "SELECT * FROM Posts";

                    SqlCommand cmd = new SqlCommand(query, con);

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            Post post = new Post
                            {
                                Id = dr.GetInt32(0),
                                Title = dr.GetString(25),
                                Content = dr.GetString(20),
                               
                            };

                            posts.Add(post);
                        }
                    }
                    return posts;
                }
            }
    }
}
