using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_learning.User
{
    public partial class Contact_us : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cf = ConfigurationManager.ConnectionStrings["E-Leraning"].ConnectionString;
            conn = new SqlConnection(cf);
            conn.Open();
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            string name, email, subject, message;
            name = TextBox1.Text;
            email = TextBox2.Text;
            subject = TextBox3.Text;
            message = myTextarea.Text;
            string q = $"exec get_touch_submit  '{@name}','{@email}','{@subject}','{@message}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.ExecuteNonQuery();
            //Response.Write("<script>alert('Thank You for Get in Touch With Us ')</script>");
            ShowSweetAlert("Success", "Massage sent successfully!", "success");
        }

        private void ShowSweetAlert(string title, string message, string icon)
        {
            // Build the JavaScript code for SweetAlert using StringBuilder
            StringBuilder script = new StringBuilder();
            script.Append("<script>");
            script.Append("$(document).ready(function() {");
            script.Append("Swal.fire({");
            script.AppendFormat("title: '{0}',", title);
            script.AppendFormat("text: '{0}',", message);
            script.AppendFormat("icon: '{0}',", icon);
            script.Append("backdrop: `rgba(0,0,123,0.4) url('pic/congratulations.gif') left top no-repeat`,");
            script.Append("});");
            script.Append("});");
            script.Append("</script>");

            // Register the script with the Page using ScriptManager
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "SweetAlertScript", script.ToString(), false);
        }
    }
}