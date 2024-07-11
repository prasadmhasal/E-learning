using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_learning.Admin
{
    public partial class dashbord : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cf = ConfigurationManager.ConnectionStrings["E-Leraning"].ConnectionString;
            conn = new SqlConnection(cf);
            conn.Open();
            if (!IsPostBack)
            {
                ProductCount();
                UserAccount();
                Orderplaced();
            }
        }
        public void UserAccount()
        {
            string q = $"select count(acc_userid) as Users from user_acc where urole = 'User';";
            SqlCommand c = new SqlCommand(q, conn);
            SqlDataReader rdr = c.ExecuteReader();
            rdr.Read();
            Label7.Text = rdr["Users"].ToString();
            Label8.Text = rdr["Users"].ToString();

        }

        public void ProductCount()
        {
            string q = $"select count(course_id) as pid from Add_course";
            SqlCommand c = new SqlCommand(q, conn);
            SqlDataReader rdr = c.ExecuteReader();
            rdr.Read();
            Label1.Text = rdr["pid"].ToString();
            Label2.Text = rdr["pid"].ToString();

        }
        public void Orderplaced()
        {
            string q = $"select count(course_history_id ) as sells from course_history;";
            SqlCommand c = new SqlCommand(q, conn);
            SqlDataReader rdr = c.ExecuteReader();
            rdr.Read();
            Label3.Text = rdr["sells"].ToString();
            Label4.Text = rdr["sells"].ToString();
            Label5.Text = rdr["sells"].ToString();
            Label6.Text = rdr["sells"].ToString();

        }
    }
}