using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_learning.Admin
{
    public partial class Admin_home : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cf = ConfigurationManager.ConnectionStrings["E-Leraning"].ConnectionString;
            conn = new SqlConnection(cf);
            conn.Open();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string course_name, sub_course;
            double price;
            course_name=TextBox1.Text;
            sub_course=TextBox2.Text;
            price = double.Parse(TextBox3.Text);

                    string q = $"EXEC add_cource  '{course_name}','{sub_course}','{price}'";
                    SqlCommand cmd = new SqlCommand(q, conn);
                  

                    cmd.ExecuteNonQuery();
               
                    Response.Write("<script>alert('Product Added Successfully')</script>");
                
           
        }
    }
}