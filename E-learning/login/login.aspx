<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="E_learning.login.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
   <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
   
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

            <div class="container w-100">
                <div class="row">
                    <section class="">
                        <div class="container-fluid py-5 h-100 shadow">
                            <div class="row d-flex justify-content-center align-items-center h-100">
                                <div class="col col-xl-10">
                                    <div class="card" style="border-radius: 1rem;">
                                        <div class="row g-0">
                                            <div class="col-md-6 col-lg-5 d-none d-md-block">
                                                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/img1.webp"
                                                    alt="login form" class="img-fluid  h-100" style="border-radius: 1rem 0 0 1rem;" />
                                            </div>
                                            <div class="col-md-6 col-lg-7 d-flex align-items-center">
                                                <div class="card-body p-4 p-lg-5 text-black">



                                                    <div class="d-flex align-items-center mb-3 pb-1">
                                                        <i class="fas fa-cubes fa-2x me-3" style="color: #ff6219;"></i>
                                                        <span class="h1 fw-bold mb-0">Logo</span>
                                                    </div>

                                                    <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Sign into your account</h5>

                                                    <div data-mdb-input-init class="form-outline mb-4">
                                                       
                                                        <asp:TextBox ID="TextBox1" runat="server" class="form-control form-control-lg" placeholder="Username" ></asp:TextBox>
                                                        <label class="form-label" for="form2Example17">Username</label>
                                                    </div>

                                                    <div data-mdb-input-init class="form-outline mb-4">
                                                       
                                                        <asp:TextBox ID="TextBox2" runat="server" class="form-control form-control-lg" placeholder="Password"></asp:TextBox>
                                                        <label class="form-label" for="form2Example27">Password</label>
                                                    </div>

                                                    <div class="pt-1 mb-4">
                                                        
                                                        <asp:Button ID="Button1" runat="server" Text="Login" class="btn  btn-lg btn-block w-100" style="background-color:#a435f0 ; color:aliceblue" OnClick="Button1_Click" />
                                                    </div>

                                                    <a class="small text-muted" href="#!">Forgot password?</a>
                                                    <p class="mb-5 pb-lg-2" style="color: #393f81;">
                                                        Don't have an account? <a href="#!"
                                                            style="color: #393f81;"  data-toggle="modal" data-target="#exampleModal">Register here</a>
                                                    </p>

                                                    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                        <div class="modal-dialog" role="document">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title" id="exampleModalLabel">Register</h5>
                                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                        <span aria-hidden="true">&times;</span>
                                                                    </button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <div>

                                                                        <div class="form-group">
                                                                            <label for="TextBox3">Name</label>
                                                                            <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" placeholder="Enter Full Name"></asp:TextBox>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label for="">Username</label>
                                                                            <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control"></asp:TextBox>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label for="TextBox5">Email ID</label>
                                                                            <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" placeholder="Enter Email ID"></asp:TextBox>
                                                                        </div>                                                                     
                                                                        <div class="form-group">
                                                                            <label for="TextBox9">Password</label>
                                                                            <asp:TextBox ID="TextBox9" runat="server" CssClass="form-control" placeholder="Enter Password" TextMode="Password"></asp:TextBox>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label for="TextBox10">Confirm Password</label>
                                                                            <asp:TextBox ID="TextBox10" runat="server" CssClass="form-control" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
                                                                        </div>
                                                                    </div>
                                                                    <asp:Button ID="Button2" runat="server" Text="Register" CssClass="btn  btn-block" style="background-color:#a435f0 ; color:aliceblue" OnClick="Button2_Click"  />
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <a href="#!" class="small text-muted">Terms of use.</a>
                                                    <a href="#!" class="small text-muted">Privacy policy</a>


                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

                </div>
            </div>
      
    </form>
</body>
</html>
