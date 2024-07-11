using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace E_learning.Admin
{
    public partial class enquiry : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["E-Leraning"].ConnectionString;
            conn = new SqlConnection(connectionString);
            conn.Open();
            if (!IsPostBack)
            {
             
                GridView1.RowCommand += new GridViewCommandEventHandler(GridView1_RowCommand);
            }

        }

        public void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Send_Email")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[index];
                int getTouchId = Convert.ToInt32(((Label)row.FindControl("get_touch_idLabel")).Text);
                string name = ((Label)row.FindControl("nameLabel")).Text;
                string email = ((Label)row.FindControl("emailLabel")).Text;
                string subject = ((Label)row.FindControl("subjectLabel")).Text;
                string message = ((Label)row.FindControl("messageLabel")).Text;

                SendEmail(getTouchId, name, email, subject, message);
                DeleteUser(getTouchId);
            }
        }

        public void DeleteUser(int getTouchId)
        {
            string query = "DELETE FROM get_touch WHERE get_touch_id = @getTouchId";
            using (SqlCommand command = new SqlCommand(query, conn))
            {
                command.Parameters.AddWithValue("@getTouchId", getTouchId);
                command.ExecuteNonQuery();
            }
        }

        public void SendEmail(int getTouchId, string name, string email, string subject, string message)
        {
            string emailBody = $"Dear {name},<br /><br />" +
                               $"Your inquiry with the subject '{subject}' has been resolved and deleted from our system.<br /><br />" +
                               $"Here is the original message:<br />" +
                               $"{message}<br /><br />" +
                               $"Thank you for reaching out.<br /><br />" +
                               $"Best regards,<br />Your Company";

            try
            {
                MailMessage mailMessage = new MailMessage();
                mailMessage.To.Add(new MailAddress(email));
                mailMessage.From = new MailAddress("prasadmhasal@gmail.com");
                mailMessage.Subject = "Your inquiry has been resolved";
                mailMessage.Body = emailBody;
                mailMessage.IsBodyHtml = true;

                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587); 
                smtpClient.Credentials = new NetworkCredential("prasadmhasal@gmail.com", "fxjuqdrhzmmeksyq");
                smtpClient.EnableSsl = true;
                smtpClient.Send(mailMessage);


                //Response.Write("<script>alert('Email Send Successfully')</script>");
                DeleteUser(getTouchId);
                ShowSweetAlert("Success", "Email sent successfully!", "success");
            }
            catch (Exception ex)
            {
               
                System.Diagnostics.Debug.WriteLine("Error sending email: " + ex.Message);
                throw; 
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