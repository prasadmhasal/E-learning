using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace E_learning.User
{
    public partial class All_Course : System.Web.UI.Page
    {
        SqlConnection conn;

        protected void Page_Load(object sender, EventArgs e)
        {
            string cf = ConfigurationManager.ConnectionStrings["E-Leraning"].ConnectionString;
            conn = new SqlConnection(cf);
            conn.Open();
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string course, subcourse, course_url, course_tital, suser, image;
            string dt;
            decimal price;


            if (e.CommandName == "AddToCart")
            {
                string cvideo_id = e.CommandArgument.ToString();
                string q = "  exec FindById '" + cvideo_id + "'  ";
                if (Session["acc_username"] == null)
                {
                    // Handle the case where Session["username"] is null
                    Response.Write("<script>alert('User is not logged in or session has expired.')</script>");
                    return;
                }
                string acc_username = Session["acc_username"].ToString();
                SqlCommand cmd = new SqlCommand(q, conn);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    course = rdr["course"].ToString();
                    subcourse = rdr["subcourse"].ToString();
                    course_url = rdr["course_url"].ToString();
                    course_tital = rdr["course_title"].ToString();
                    suser = acc_username;
                    price = decimal.Parse(rdr["price"].ToString());
                    image = rdr["image"].ToString();
                    dt = DateTime.Now.ToString("d-M-yyyy");
                    DateTime now = DateTime.Now;

                    //string ql = $"exec AddToCart '{course}','{subcourse}','{course_url}','{course_tital}','{suser}','{price}','{image}'";
                    string ql = "INSERT INTO cart (course, subcourse, course_url, course_title, suser, price, image, dt) " +
                         "VALUES ('" + course + "', '" + subcourse + "', '" + course_url + "', '" + course_tital + "', '" + suser + "', " + price + ", '" + image + "','" + now + "')";

                    SqlCommand c = new SqlCommand(ql, conn);
                    c.ExecuteNonQuery();
                    Response.Write("<script>alert('Add to cart succesfully')</script>");
                    Response.Redirect("Add_to_cart.aspx");
                }

            }


        }
    }
}