<%@ Page Title="" Language="C#" MasterPageFile="~/User/user_nav.Master" AutoEventWireup="true" CodeBehind="Contact_us.aspx.cs" Inherits="E_learning.User.Contact_us" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <!-- Header Start -->
    <div class="jumbotron jumbotron-fluid page-header position-relative overlay-bottom" style="margin-bottom: 90px;">
        <div class="container text-center py-5">
            <h1 class="text-white display-1">Contact</h1>
            <div class="d-inline-flex text-white mb-5">
                <p class="m-0 text-uppercase"><a class="text-white" href="">Home</a></p>
                <i class="fa fa-angle-double-right pt-1 px-3"></i>
                <p class="m-0 text-uppercase">Contact</p>
            </div>
        </div>
    </div>
    <!-- Header End -->
    <!-- Contact Start -->
    <div class="container-fluid py-5">
        <div class="container py-5">
            <div class="row align-items-center">
                <div class="col-lg-5 mb-5 mb-lg-0">
                    <div class="bg-light d-flex flex-column justify-content-center px-5" style="height: 450px;">
                        <div class="d-flex align-items-center mb-5">
                            <div class="btn-icon bg-primary mr-4">
                                <i class="fa fa-2x fa-map-marker-alt text-white"></i>
                            </div>
                            <div class="mt-n1">
                                <h4>Our Location</h4>
                                <p class="m-0">123 Street, New York, USA</p>
                            </div>
                        </div>
                        <div class="d-flex align-items-center mb-5">
                            <div class="btn-icon bg-secondary mr-4">
                                <i class="fa fa-2x fa-phone-alt text-white"></i>
                            </div>
                            <div class="mt-n1">
                                <h4>Call Us</h4>
                                <p class="m-0">+012 345 6789</p>
                            </div>
                        </div>
                        <div class="d-flex align-items-center">
                            <div class="btn-icon bg-warning mr-4">
                                <i class="fa fa-2x fa-envelope text-white"></i>
                            </div>
                            <div class="mt-n1">
                                <h4>Email Us</h4>
                                <p class="m-0">info@example.com</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-7">
                    <div class="section-title position-relative mb-4">
                        <h6 class="d-inline-block position-relative text-secondary text-uppercase pb-2">Need Help?</h6>
                        <h1 class="display-4">Send Us A Message</h1>
                    </div>
                    <div class="contact-form">
                        <form>
                            <div class="row">
                                <div class="col-6 form-group">
                                    
                                    <asp:TextBox ID="TextBox1" runat="server" class="form-control border-top-0 border-right-0 border-left-0 p-0" placeholder="Your Name" required="required"></asp:TextBox>
                                </div>
                                <div class="col-6 form-group">
                                 
                                    <asp:TextBox ID="TextBox2" runat="server"  class="form-control border-top-0 border-right-0 border-left-0 p-0" placeholder="Your Email" required="required"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                               
                                <asp:TextBox ID="TextBox3" runat="server" class="form-control border-top-0 border-right-0 border-left-0 p-0" placeholder="Subject" required="required"></asp:TextBox>
                            </div>
                            <div class="form-group">
                               
                                 <asp:TextBox ID="myTextarea" runat="server" TextMode="MultiLine" class="form-control border-top-0 border-right-0 border-left-0 p-0" placeholder="Your Message" required="required"></asp:TextBox>
                            </div>
                            <div>
                               
                                <asp:Button ID="Button1"  class="btn  py-3 px-5" style="background-color:#695cfe ; color:aliceblue;height: 60px;" runat="server" Text="Send Message" onclick="Button2_Click"/>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Contact End -->

</asp:Content>
