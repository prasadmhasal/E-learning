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
    public partial class mycourse : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cf = ConfigurationManager.ConnectionStrings["E-Leraning"].ConnectionString;
            conn = new SqlConnection(cf);
            conn.Open();
            if (!IsPostBack)
            {
                if (Session["acc_username"] == null)
                {
                    
                    string userName = GetLoggedInUserName();
                    Session["acc_username"] = userName;
                }
                    getdata();
            }

            
        }

        public void getdata()
        {
            string ql = $" select * from course_history where suser = '{Session["acc_username"].ToString()}'";
            SqlCommand cmd = new SqlCommand(ql, conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {

                string date = rdr["dt"].ToString();
                DateTime newdate =DateTime.Parse(date);
                DateTime date2= newdate.AddDays(30);
                DateTime date3 = DateTime.Now;
                if (date3 >= date2)
                {
                string dl = $" delete from course_history where  dt = '{date}' suser = '{Session["acc_username"].ToString()}'";
                SqlCommand cmd2 = new SqlCommand(dl, conn);
                SqlDataReader rdr2 = cmd2.ExecuteReader();
                }

            }
        }
        private string GetLoggedInUserName()
        {
          
            
            return "userName";
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
           

            if (e.CommandName == "View")
            {
                Response.Redirect("watch_video.aspx");

            }


        }
    }
}