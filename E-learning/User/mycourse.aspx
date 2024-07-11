<%@ Page Title="" Language="C#" MasterPageFile="~/User/user_nav.Master" AutoEventWireup="true" CodeBehind="mycourse.aspx.cs" Inherits="E_learning.User.mycourse" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         <!-- Header Start -->
    <div class="jumbotron jumbotron-fluid page-header position-relative overlay-bottom" style="margin-bottom: 90px;">
        <div class="container text-center py-5">
            <h1 class="text-white display-1">My Courses</h1>
            <div class="d-inline-flex text-white mb-5">
                <p class="m-0 text-uppercase"><a class="text-white" href="">Home</a></p>
                <i class="fa fa-angle-double-right pt-1 px-3"></i>
                <p class="m-0 text-uppercase">Courses</p>
            </div>
        </div>
    </div>
    <!-- Header End -->
     <div class="container-fluid py-2">
    <div class="container py-5">
        <div class="row mx-0 justify-content-start">
            <div class="col-lg-8">
              
                <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" DataKeyField="" RepeatColumns="3" RepeatDirection="Horizontal" CellPadding="15" OnItemCommand="DataList1_ItemCommand" >
                    <ItemTemplate>
                        <div class="card shadow rounded" style="width: 18rem; margin: 20px;">
                            <img class="card-img-top" src='<%# Eval("image") %>' alt="Course image" width="250" height="200">
                            <div class="card-body">
                               <%-- <p class="card-text"><strong>Course ID:</strong> <%# Eval("course_id") %></p>--%>
                                <p class="card-text"><strong>Course:</strong> <%# Eval("course") %></p>
                                <p class="card-text"><strong>Subcourse:</strong> <%# Eval("subcourse") %></p>
                                <p class="card-title"><strong>Title:</strong><%# Eval("course_title") %></p>
                                 <%-- <p class="card-title"><strong>Price:</strong><%# Eval("price") %></p>--%>
                               <%-- <p class="card-text"><strong>URL:</strong> <a href='<%# Eval("course_url") %>' target="_blank"><%# Eval("course_url") %></a></p>--%>
                                <div class="d-grid gap-2">
                                    <asp:Button ID="Button1" runat="server" Text="Watch Video" CssClass="btn btn-dark" CommandName="View" />
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                    ConnectionString="<%$ ConnectionStrings:E-Leraning %>"
                    SelectCommand="SELECT * FROM [course_history] WHERE [suser] = @suser">
                    <SelectParameters>
                        <asp:SessionParameter Name="suser" SessionField="acc_username" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</div>
</asp:Content>
