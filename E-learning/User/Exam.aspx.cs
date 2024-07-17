using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_learning.User
{
    public partial class Exam : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    // Hide the Certification button initially
            //    Button1.Visible = false;
            //}

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/user/certification/java.aspx");
        }
    }
}