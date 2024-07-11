using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Razorpay.Api;

namespace E_learning.User
{
    public partial class Add_to_cart : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cf = ConfigurationManager.ConnectionStrings["E-Leraning"].ConnectionString;
            conn = new SqlConnection(cf);
            conn.Open();
            if (!IsPostBack)
            {
                

                GrandTotal();

            }
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label lb = (Label)GridView1.Rows[e.RowIndex].FindControl("Label1");
            string id = lb.Text;
            string q = $"delete from cart where video_id='{id}'";

            SqlCommand c = new SqlCommand(q, conn);
            c.ExecuteNonQuery();

            Response.Redirect("Add_to_cart.aspx");
        }

        public void GrandTotal()
        {
            string q = $"select sum(price) as tot from cart where suser='{Session["acc_username"].ToString()}'";
            SqlCommand command = new SqlCommand(q, conn);
            SqlDataReader r = command.ExecuteReader();
            r.Read();
            Label7.Text = r["tot"].ToString();
            double Grandtotal = double.Parse(Label7.Text);
            Session["FinalTotal"] = Grandtotal;

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            // Razorpay API Key and Secret
            string razorpayKeyId = "rzp_test_VPel75yVZnzpbD";
            string razorpayKeySecret = "SYoHmR95xmbUb7BNW1SSLzBc";

            // Amount to be paid (dynamic amount retrieval example)
            double amount = double.Parse(Session["FinalTotal"].ToString());

            // Prepare options for creating an order
            Dictionary<string, object> options = new Dictionary<string, object>();
            options.Add("amount", amount * 100); // Amount in smallest currency unit (e.g., paise)
            options.Add("currency", "INR");
            options.Add("receipt", "order_receipt_123"); // Replace with your receipt identifier
            options.Add("payment_capture", 1); // Automatically capture payment

            // Initialize Razorpay client
            RazorpayClient razorpayClient = new RazorpayClient(razorpayKeyId, razorpayKeySecret);

            try
            {
                // Create an order
                Razorpay.Api.Order order = razorpayClient.Order.Create(options);

                // Extract order ID from the response
                string orderId = order["id"].ToString();
                Session["OrderId"] = orderId;

                // Generate Razorpay script
                string razorpayScript = $@"
                <script src='https://checkout.razorpay.com/v1/checkout.js'></script>
            <script>
                var options = {{
                    'key': '{razorpayKeyId}', // Replace with your Razorpay API Key
                    'amount': {amount * 100}, // Amount is in currency subunits (e.g., paise)
                    'currency': 'INR',
                    'name': 'GlowSkills', // Name of your company or app
                    'description': 'Checkout Payment',
                    'order_id': '{orderId}', // Order ID from Razorpay
                    'handler': function(response) {{
                        alert('Payment successful: ' + response.razorpay_payment_id);
                        alert('Order ID: ' + response.razorpay_order_id);
                        alert('Signature: ' + response.razorpay_signature);
                        // Handle the response after payment success
                        window.location.href = 'Invoice.aspx';
                    }},
                    'prefill': {{
                        'name': 'Prasad Mhasal', // Customer's name
                        'email': 'gaurav.kumar@example.com', // Customer's email
                        'contact': '8767614273' // Customer's phone number
                    }},
                    'notes': {{
                        'address': 'Razorpay Corporate Office' // Additional notes if any
                    }},
                    'theme': {{
                        'color': '#3399cc' // Theme color
                    }}
                }};
                var rzp1 = new Razorpay(options);
                rzp1.on('payment.failed', function(response) {{
                    alert(response.error.code + ': ' + response.error.description);
                    // Handle failed payment
                }});
                rzp1.open();
                e.preventDefault();
            </script>";

                // Inject the Razorpay script into the page
                ClientScript.RegisterStartupScript(this.GetType(), "razorpay", razorpayScript, false);

            }
            catch (Exception ex)
            {
                Response.Clear();
                Response.Write($"<p>Error: {ex.Message}</p>");
                Response.End();
            }
        }
            protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserHome.aspx");

        }

    }
}