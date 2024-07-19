<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/side_nav.Master" AutoEventWireup="true" CodeBehind="Add_Course.aspx.cs" Inherits="E_learning.Admin.Admin_home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="">
    <div class="container mt-5 mb-2 mb-5 overflow-hidden ">
        <div runat="server" class="form-container w-50 border shadow offset-3 rounded bg-light">
            <div style="padding: 20px">
                <h2 class="text-center">Add Course</h2>

                <div class="form-group">
                    <asp:Label ID="PName" runat="server" Text="Course Name"></asp:Label>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <br />
                <div class="form-group">
                    <asp:Label ID="Price" runat="server" Text="Sub Cource"></asp:Label>
                    <asp:TextBox ID="TextBox2" runat="server"  CssClass="form-control"></asp:TextBox>
                </div>
                <br />


                <%--<div class="form-group">
                    <asp:Label ID="PImg" runat="server" Text="Price"></asp:Label>
                     <asp:TextBox ID="TextBox3" runat="server"  CssClass="form-control"></asp:TextBox>
                </div>--%>
                <br />
                <div class="form-group text-center mt-3">
                    <asp:Button ID="Button1" runat="server" Text="Add" CssClass="btn  btn-block w-100" style="background-color:#695cfe ; color:aliceblue" onclick="Button1_Click"  />
                </div>
            </div>
        </div>
    </div>
</div>
</asp:Content>
