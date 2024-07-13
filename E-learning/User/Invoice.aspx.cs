using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_learning.User
{
    public partial class Invoice : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["E-Leraning"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
            string userID = Session["acc_username"].ToString();
            double Grandtotal;
            Grandtotal = double.Parse(Session["FinalTotal"].ToString());
            Label1.Text = Grandtotal.ToString();

            string q = $"INSERT INTO mycourse (course, subcourse, course_url, course_title, suser, price ,image , dt ) " +
            "SELECT course, subcourse, course_url, course_title, suser, price ,image , dt " +
            "FROM cart WHERE suser=@userID";
            SqlCommand c = new SqlCommand(q, conn);
            c.Parameters.AddWithValue("@UserID", userID);
            int row = c.ExecuteNonQuery();
            if (row > 0)
            {
                string query = $"delete from cart where suser='{Session["acc_username"].ToString()}'";
                SqlCommand cm = new SqlCommand(query, conn);
                cm.ExecuteNonQuery();

            }
            if (!IsPostBack)
            {
                // Get today's date
                DateTime today = DateTime.Today;

                // Format the date as desired (e.g., "MM/dd/yyyy")
                string formattedDate = today.ToString("MM/dd/yyyy");

                // Set the text of the Label control
                LabelDate.Text = formattedDate;
                
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string userID = Session["acc_username"].ToString();
            string q = "INSERT INTO course_history (course, subcourse, course_url, course_title, suser, price, image ,dt ) " +
               "SELECT course, subcourse, course_url, course_title, suser, price, image , dt  " +
               "FROM mycourse WHERE suser=@UserID";
            SqlCommand c = new SqlCommand(q, conn);
            c.Parameters.AddWithValue("@UserID", userID);
            int row = c.ExecuteNonQuery();
            if (row > 0)
            {
                string query = $"delete from mycourse where suser='{Session["acc_username"].ToString()}'";
                SqlCommand cm = new SqlCommand(query, conn);
                cm.ExecuteNonQuery();

            }

            Response.Redirect("UserHome.aspx");

        }

    }
}