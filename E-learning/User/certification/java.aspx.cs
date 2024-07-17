using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_learning.User.certification
{
    public partial class java : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = Session["acc_username"].ToString();
            // Get today's date
            DateTime today = DateTime.Today;

            // Format the date as desired (e.g., "MM/dd/yyyy")
            string formattedDate = today.ToString("MM/dd/yyyy");

            // Set the text of the Label control
            LabelDate.Text = formattedDate;
        }
       

        protected void button1_click(object sender, EventArgs e)
        {
            Response.Redirect("~/User/Exam.aspx");
        }
    }
}