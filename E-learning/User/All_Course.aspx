<%@ Page Title="" Language="C#" MasterPageFile="~/User/user_nav.Master" AutoEventWireup="true" CodeBehind="All_Course.aspx.cs" Inherits="E_learning.User.All_Course" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <!-- Header Start -->
    <div class="jumbotron jumbotron-fluid page-header position-relative overlay-bottom" style="margin-bottom: 90px;">
        <div class="container text-center py-5">
            <h1 class="text-white display-1">Courses</h1>
            <div class="d-inline-flex text-white mb-5">
                <p class="m-0 text-uppercase"><a class="text-white" href="">Home</a></p>
                <i class="fa fa-angle-double-right pt-1 px-3"></i>
                <p class="m-0 text-uppercase">Courses</p>
            </div>
            <div class="mx-auto mb-5" style="width: 100%; max-width: 600px;">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <button class="btn btn-outline-light bg-white text-body px-4 dropdown-toggle" type="button" data-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="false">Courses</button>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#">Courses 1</a>
                            <a class="dropdown-item" href="#">Courses 2</a>
                            <a class="dropdown-item" href="#">Courses 3</a>
                        </div>
                    </div>
                    <input type="text" class="form-control border-light" style="padding: 30px 25px;" placeholder="Keyword">
                    <div class="input-group-append">
                        <button class="btn btn-secondary px-4 px-lg-5">Search</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Header End -->
     <div class="container-fluid py-5">
    <div class="container py-5">
        <div class="row mx-0 justify-content-center">
            <div class="col-lg-12">
               <div class="section-title text-center position-relative mb-5">
                        <h6 class="d-inline-block position-relative text-secondary text-uppercase pb-2">Our Courses</h6>
                        <h1 class="display-4">Checkout New Releases Of Our Courses</h1>
                    </div>
                <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" DataKeyField="cvideo_id" RepeatColumns="3" RepeatDirection="Horizontal" CellPadding="15" OnItemCommand="DataList1_ItemCommand">
                    <ItemTemplate>
                        <div class="card shadow rounded" style="width: 20rem; margin: 20px;">
                            <img class="card-img-top" src='<%# Eval("image") %>' alt="Course image" width="250" height="200">
                            <div class="card-body">
                                <p class="card-text"><strong>Course ID:</strong> <%# Eval("course_id") %></p>
                                <p class="card-text"><strong>Course:</strong> <%# Eval("course") %></p>
                                <p class="card-text"><strong>Subcourse:</strong> <%# Eval("subcourse") %></p>
                                <p class="card-title"><strong>Title:</strong><%# Eval("course_title") %></p>
                                  <p class="card-title"><strong>Price:</strong><%# Eval("price") %></p>
                               <%-- <p class="card-text"><strong>URL:</strong> <a href='<%# Eval("course_url") %>' target="_blank"><%# Eval("course_url") %></a></p>--%>
                                <div class="d-grid gap-2">
                                    <asp:Button ID="Button1" runat="server" Text="Add To card " CssClass="btn btn-dark" CommandName="AddToCart" CommandArgument='<%# Eval("cvideo_id") %>' />
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:E-Leraning %>" SelectCommand="SELECT * FROM [Course_video]"></asp:SqlDataSource>
            </div>
        </div>
    </div>
</div>



</asp:Content>
