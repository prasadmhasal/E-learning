using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_learning.Admin
{
    public partial class User_List : System.Web.UI.Page
    {
        SqlConnection conn;

        protected void Page_Load(object sender, EventArgs e)
        {
            string cf = ConfigurationManager.ConnectionStrings["E-Leraning"].ConnectionString;
            conn = new SqlConnection(cf);
            conn.Open();
            if (!IsPostBack)
            {
                // Bind your GridView data source here
                BindGridView();
            }

        }
        protected void BindGridView()
        {
            
        }

        public void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
                  
            if (e.CommandName == "BlockUser" || e.CommandName == "UnblockUser")
            {
                
                if (e.CommandName == "BlockUser")
                {
                    int userId = Convert.ToInt32(e.CommandArgument);
                  
                    BlockUser(userId);
                    BlockMailsendmail();
                   
                }
                else if (e.CommandName == "UnblockUser")
                {
                    int userId = Convert.ToInt32(e.CommandArgument);
                    
                    UnblockUser(userId);
                    Unblocnsendmail();

                }
            }
            
        }
        public void BlockUser(int userId)
        {
            using (SqlCommand cmd = new SqlCommand("UPDATE user_acc SET status = 'Blocked' WHERE acc_userid = @UserId", conn))
            {
                cmd.Parameters.AddWithValue("@UserId", userId);
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('User is blocked')</script>");

            }

            GridView1.DataBind();
        }

        public void UnblockUser(int userId)
        {
            using (SqlCommand cmd = new SqlCommand("UPDATE user_acc SET status = 'Active' WHERE acc_userid = @UserId", conn))
            {
                cmd.Parameters.AddWithValue("@UserId", userId);
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('User is unblocked')</script>");
            }

            GridView1.DataBind();
        }

        public void BlockMailsendmail()
        {
            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("prasadmhasal@gmail.com");
            mail.To.Add("prasadmhasal@gmail.com");
            mail.Subject = "Student Portal Access Blocked Due to Unacceptable Behavior";
            mail.Body = "Dear Administrator,\r\n\r\nI hope this message finds you well. I regret to inform you that we have blocked access to the student portal due to unacceptable behavior by the student.\r\n\r\nPlease review this action as necessary and take any further steps required.\r\n\r\nThank you for your attention to this matter.\r\n\r\nBest regards,\r\n\r\n[Your Name]\r\n[Your Position]\r\n[Your Contact Information]";
            SmtpClient smtp = new SmtpClient("smtp.gmail.com");
            smtp.Port = 587;
            smtp.Credentials = new NetworkCredential("prasadmhasal@gmail.com", "fxjuqdrhzmmeksyq");
            smtp.EnableSsl = true;
            smtp.Send(mail);
            Response.Write("<Script>alert('Email to student ')</script>");
            
           
        }
        public void Unblocnsendmail()
        {



            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("prasadmhasal@gmail.com");
            mail.To.Add("prasadmhasal@gmail.com");
            mail.Subject = "Student Portal Access Unblocked";
            mail.Body = "Dear [Student Name],\r\n\r\nI hope this message finds you well. We are writing to inform you that your access to the student portal has been successfully unblocked by our administration team.\r\n\r\nReason for unblocking:\r\n[Provide a brief explanation of why the access was unblocked, e.g., after a review or resolution of issues.]\r\n\r\nYou can now log in to the student portal using your credentials and resume your activities.\r\n\r\nIf you have any questions or concerns regarding this matter, please do not hesitate to contact us at [Administrator's Contact Information].\r\n\r\nBest regards,\r\n\r\n[Administrator's Name]\r\n[Administrator's Position]\r\n[Institution Name]\r\n[Contact Information]";
            SmtpClient smtp = new SmtpClient("smtp.gmail.com");
            smtp.Port = 587;
            smtp.Credentials = new NetworkCredential("prasadmhasal@gmail.com", "fxjuqdrhzmmeksyq");
            smtp.EnableSsl = true;
            smtp.Send(mail);
            Response.Write("<Script>alert('Email to student ')</script>");


        }
    }
}