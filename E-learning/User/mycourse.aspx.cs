using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_learning.User
{
    public partial class mycourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["acc_username"] == null)
                {
                    // Assuming you have a method to get the logged-in user's username
                    string userName = GetLoggedInUserName(); // Replace this with your actual method
                    Session["acc_username"] = userName;
                }
            }
        }
        private string GetLoggedInUserName()
        {
          
            // Replace this with the actual logic to get the logged-in user's username
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