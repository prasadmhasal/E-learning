using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_learning.User
{
    public partial class watch_video : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static List<Course> GetCourses()
        {
            List<Course> courses = new List<Course>();
            string constr = ConfigurationManager.ConnectionStrings["E-Leraning"].ConnectionString;
            string userName = HttpContext.Current.Session["acc_username"] as string;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT DISTINCT course FROM course_history WHERE suser = @UserName", con))
                {
                    cmd.Parameters.AddWithValue("@UserName", userName);
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        Course course = new Course();
                        course.CourseName = reader["course"].ToString();
                        courses.Add(course);
                    }
                }
            }
            return courses;
        }


        [WebMethod]
        public static List<SubCourse> GetSubCourses(string course)
        {
            List<SubCourse> subCourses = new List<SubCourse>();
            string constr = ConfigurationManager.ConnectionStrings["E-Leraning"].ConnectionString;
            string userName = HttpContext.Current.Session["acc_username"] as string;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT subcourse, course_url FROM course_history WHERE course = @Course AND suser = @UserName", con))
                {
                    cmd.Parameters.AddWithValue("@UserName", userName);
                    cmd.Parameters.AddWithValue("@Course", course);
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        SubCourse subCourse = new SubCourse();
                        subCourse.SubCourseName = reader["subcourse"].ToString();
                        subCourse.VideoUrl = reader["course_url"].ToString();
                        subCourses.Add(subCourse);
                    }
                }
            }
            return subCourses;
        }
        public class Course
        {
            public string CourseName { get; set; }
        }

        public class SubCourse
        {
            public string SubCourseName { get; set; }
            public string VideoUrl { get; set; }
        }





    }

}


