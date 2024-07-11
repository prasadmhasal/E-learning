using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace E_learning.User
{
    public partial class user_nav : System.Web.UI.MasterPage
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cf = ConfigurationManager.ConnectionStrings["E-Leraning"].ConnectionString;
            conn = new SqlConnection(cf);
            conn.Open();
            if (Session["acc_username"] != null)
            {
                Label1.Text = Session["acc_username"].ToString();
            }
            TotalCount();
        }

        public void TotalCount()
        {
            string q = $"select count(video_id) as video_id from cart where suser = '{Session["acc_username"].ToString()}'";
            SqlCommand c = new SqlCommand(q, conn);
            SqlDataReader rdr = c.ExecuteReader();
            rdr.Read();
            Label2.Text = rdr["video_id"].ToString();


        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/login/login.aspx");
        }
        public void Button1_Click(object sender, EventArgs e)
        {
            string email = TextBox1.Text;

            try
            {
                // Set up SMTP client and send email
                SmtpClient client = new SmtpClient("smtp.gmail.com", 587)
                {
                    Credentials = new NetworkCredential("prasadmhasal@gmail.com", "fxjuqdrhzmmeksyq"),
                    EnableSsl = true
                };

                MailMessage mailMessage = new MailMessage
                {
                    From = new MailAddress("prasadmhasal@gmail.com"),
                    Subject = "Thank You For Subscribing to Us",
                    Body = @"<p>Hi [Recipient's Name],</p>
             <p>Unlock your potential with Glowskills! Subscribe now to stay updated on our latest courses and never miss a chance to learn something new.</p>
             <p><b>Why Subscribe?</b></p>
             <ul>
                 <li><b>Exclusive Updates:</b> Be the first to know about new courses.</li>
                 <li><b>Endless Learning:</b> Explore a variety of topics and skills.</li>
                 <li><b>Stay Ahead:</b> Keep up with the latest trends and advancements.</li>
             </ul>
             <p>Join our community of learners and start your journey to success!</p>
             <p>Subscribe now and transform your future!</p>
             <p>Best,<br/>
             [Your Name]<br/>
             [Your Position]<br/>
             Glowskills</p>",
                    IsBodyHtml = true
                };

                mailMessage.To.Add(email);
                client.Send(mailMessage);

                // After sending email successfully, show SweetAlert
                ShowSweetAlert("Success", "Email sent successfully!", "success");
            }
            catch (Exception ex)
            {
                // Handle exception (e.g., log it)
            }
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