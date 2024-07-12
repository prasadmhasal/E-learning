using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_learning.login
{
    public partial class login1 : System.Web.UI.Page
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
            string user, pass;
            user = TextBox1.Text;
            pass = TextBox2.Text;
            string q = $"exec User_login  '{@user}','{@pass}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                while (rdr.Read())
                {
                    if (rdr["acc_username"].Equals(user) && rdr["acc_userpass"].Equals(pass) && rdr["urole"].Equals("Admin"))
                    {
                        Response.Write($"<script>alert('{Session["ID"]}')</script>");
                        Response.Redirect("~/Admin/dashbord.aspx");
                    }

                    if (rdr["acc_username"].Equals(user) && rdr["acc_userpass"].Equals(pass) && rdr["urole"].Equals("User") && rdr["status"].Equals("Active"))
                    {

                        Session["acc_useremail"] = rdr["acc_useremail"].ToString();
                        Session["acc_username"] = user;
                        Response.Write("<script>alert('login')</script>");

                        Response.Redirect("~/User/UserHome.aspx");
                    }
                    if (rdr["acc_username"].Equals(user) && rdr["acc_userpass"].Equals(pass) && rdr["urole"].Equals("User") && rdr["status"].Equals("Blocked"))
                    {

                        Response.Write("<script>alert('Your blocked by Admin')</script>");
                    }
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Credentials')</script>");
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {



            string acc_username, acc_useremail, acc_userpass, urole = "User", status = "Active";
            acc_username = TextBox3.Text;
            acc_useremail = TextBox5.Text;
            acc_userpass = TextBox9.Text;
            string q = $"exec User_res '{@acc_username}','{@acc_useremail}','{@acc_userpass}','{@urole}','{@status}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.ExecuteNonQuery();
            clear();

            Response.Write("<script>alert('Registration Successfull')</script>");
        }
        protected void clear()
        {
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox9.Text = "";
            TextBox10.Text = "";
        }
    }
}