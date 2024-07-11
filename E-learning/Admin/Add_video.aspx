<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/side_nav.Master" AutoEventWireup="true" CodeBehind="Add_video.aspx.cs" Inherits="E_learning.Admin.Add_video" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="">
        <div class="container mt-5  mb-5 overflow-hidden">
            <div runat="server" class="form-container w-50 border shadow offset-3 rounded bg-light">
                <div style="padding: 20px">
                    <h2 class="text-center">Add Video</h2>
                    <div>
                        <asp:Label ID="Label1" runat="server" Text="Course"></asp:Label>
                        <asp:DropDownList ID="ddlCourses" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlCourses_SelectedIndexChanged">
                        </asp:DropDownList>

                    </div>
                    <br />
                    <div>
                        <asp:Label ID="Label2" runat="server" Text="Sub_Course"></asp:Label>
                        <asp:DropDownList ID="ddlSubCourses" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlSubCourses_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                    <br />
                    <div class="form-group">
                        <asp:Label ID="Label3" runat="server" Text="Course Title"></asp:Label>
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <br />

                    <div class="form-group">
                        <asp:Label ID="PImg" runat="server" Text="Url"></asp:Label>
                        <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <br />
                    <div class="form-group">
                        <asp:Label ID="Label4" runat="server" Text="Images"></asp:Label>
                        <asp:FileUpload ID="FileUpload1" type="file"  CssClass="form-control" runat="server" />
                     </div>
                      <br />
                    <div class="form-group">
                        <asp:Label ID="Label5" runat="server" Text="Price"></asp:Label>
                        <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                        <br />

                    <div class="form-group text-center mt-3">
                        <asp:Button ID="Button1" runat="server" Text="Add" CssClass="btn  btn-block w-100"  style="background-color:#695cfe ; color:aliceblue" OnClick="Button1_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
