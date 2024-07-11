using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_learning.Admin
{
    public partial class Add_video : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCoursesDropdown();
            }
        }

        private void BindCoursesDropdown()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["E-Leraning"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    string query = "SELECT DISTINCT course_name FROM Add_Course";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        SqlDataReader rdr = cmd.ExecuteReader();
                        ddlCourses.DataSource = rdr;
                        ddlCourses.DataTextField = "course_name";
                        ddlCourses.DataValueField = "course_name";
                        ddlCourses.DataBind();
                        rdr.Close();
                    }
                    ddlCourses.Items.Insert(0, new ListItem("-- Select Course --", ""));
                }
                catch (Exception ex)
                {
                    
                    Console.WriteLine("Error fetching courses: " + ex.Message);
                }
            }
        }

        protected void ddlCourses_SelectedIndexChanged(object sender, EventArgs e)
        {
            string course_name = ddlCourses.SelectedValue;

            if (!string.IsNullOrEmpty(course_name))
            {
                BindSubCoursesDropdown(course_name);
            }
            else
            {
                ddlSubCourses.Items.Clear();
                ddlSubCourses.Items.Insert(0, new ListItem("-- Select Sub-Course --", ""));
            } 
        }

        public void BindSubCoursesDropdown(string course_name)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["E-Leraning"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    string query = "SELECT course_id , sub_cource FROM Add_Course WHERE course_name = @course_name";
                    using (SqlCommand command = new SqlCommand(query, conn))
                    {
                        command.Parameters.AddWithValue("@course_name", course_name);
                        SqlDataReader reader = command.ExecuteReader();
                        ddlSubCourses.Items.Clear();

                        while (reader.Read())
                        {
                            int course_id = Convert.ToInt32(reader["course_id"]);
                            Session["course_id"] = course_id;
                            ddlSubCourses.Items.Add(new ListItem(reader["sub_cource"].ToString(), reader["sub_cource"].ToString()));
                        }

                        reader.Close();
                    }
                }
                catch (Exception ex)
                {
                    
                    Console.WriteLine("Error fetching sub-courses: " + ex.Message);
                    
                }
            }
        }
        protected void ddlSubCourses_SelectedIndexChanged(object sender, EventArgs e)
        {
       
            string selectedSubCourse = ddlSubCourses.SelectedValue;
         
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["E-Leraning"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                if (FileUpload1.HasFile)
                {

                    try
                    {
                        conn.Open();
                        string image;
                        double price = double.Parse (TextBox2.Text.ToString());
                        SqlCommand cmd = new SqlCommand("co_video", conn);
                        cmd.CommandType = CommandType.StoredProcedure;

                        FileUpload1.SaveAs(Server.MapPath("/Images/") + Path.GetFileName(FileUpload1.FileName));
                        image = "/Images/" + Path.GetFileName(FileUpload1.FileName);
                        cmd.Parameters.AddWithValue("@course_id", Session["course_id"]);
                        cmd.Parameters.AddWithValue("@course", ddlCourses.SelectedItem.Text);
                        cmd.Parameters.AddWithValue("@subcourse", ddlSubCourses.SelectedItem.Text);
                        cmd.Parameters.AddWithValue("@course_url", TextBox3.Text);
                        cmd.Parameters.AddWithValue("@course_title", TextBox1.Text);
                        cmd.Parameters.AddWithValue("@image", image);
                        cmd.Parameters.AddWithValue("@price", price);





                        int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        
                        Console.WriteLine("Data inserted successfully into Course_video table.");
                        Response.Write("<script>alert('Data inserted successfully into Course_video table')</script>");
                    }
                    else
                    {
                        
                        Console.WriteLine("No rows affected. Data may not have been inserted.");
                    }
                    }
                catch (Exception ex)
                {
                   
                    Console.WriteLine("Error inserting into Course_video: " + ex.Message);
                }
                }
                else
                {
                    // Display message if no file is uploaded
                    Response.Write("<script>alert('Please select a file to upload')</script>");
                }
            }
        }

    }
}