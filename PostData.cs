using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;
using BlogTask.Model;

namespace BlogTask.Data
{
    internal class PostData
    {
        public int Insert(Post post)
        {
            using (SqlConnection con = new SqlConnection(Sql.ConnectionString))
            {
                con.Open();

                string query = $"INSERT INTO Posts (Title,Content) VALUES (@title,@content)";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("title", post.Title);
                cmd.Parameters.AddWithValue("content", post.Content);

                return cmd.ExecuteNonQuery();
            }
        }

        public Post GetPostById(int Id)
        {
            Post post = new Post();
            using (SqlConnection con = new SqlConnection(Sql.ConnectionString))
            {
                con.Open();
                string query = "SELECT * FROM Post WHERE Id =@id";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("Id", Id);
                using (SqlDataReader dr = cmd.ExecuteReader())
                {

                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {

                            post.Id = dr.GetInt32(0);
                            post.Title = dr.GetString(10);
                            post.Content = dr.GetString(30);

                        }
                    }
                    else return null;

                }
            }
            return post;
        }
        public List<Post> GetAllPosts(string title,string content)
        {
            List<Post> posts = new List<Post>();
            using (SqlConnection con = new SqlConnection(Sql.ConnectionString))
            {
                con.Open();

                string query = "SELECT * FROM Posts WHERE Title =@title, Content =@content";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("Title", title);
                cmd.Parameters.AddWithValue("Content", content);

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    { 
                        Post post = new Post()
                        {
                            Id = dr.GetInt32(0),
                            Title = dr.GetString(10),
                            Content = dr.GetString(20)
                            
                        };

                        posts.Add(post);
                    }
                }
            }
            return posts;
        }
    }

}



        

