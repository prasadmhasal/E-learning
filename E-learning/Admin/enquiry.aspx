<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/side_nav.Master" AutoEventWireup="true" CodeBehind="enquiry.aspx.cs" Inherits="E_learning.Admin.enquiry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header bg-primary text-white">
                        Enquiries
                    </div>
                    <div class="card-body">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="get_touch_id" DataSourceID="SqlDataSource1" OnRowCommand="GridView1_RowCommand" CssClass="table table-bordered">
                            <Columns>
                                <asp:TemplateField HeaderText="ID">
                                    <ItemTemplate>
                                        <asp:Label ID="get_touch_idLabel" runat="server" Text='<%# Eval("get_touch_id") %>' CssClass="form-control-plaintext"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Name">
                                    <ItemTemplate>
                                        <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' CssClass="form-control-plaintext"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Email">
                                    <ItemTemplate>
                                        <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' CssClass="form-control-plaintext"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Subject">
                                    <ItemTemplate>
                                        <asp:Label ID="subjectLabel" runat="server" Text='<%# Eval("subject") %>' CssClass="form-control-plaintext"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Message">
                                    <ItemTemplate>
                                        <asp:Label ID="messageLabel" runat="server" Text='<%# Eval("message") %>' CssClass="form-control-plaintext"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Actions">
                                    <ItemTemplate>
                                        <asp:Button ID="SendEmailButton" runat="server" Text="Send Email" CssClass="btn btn-success mt-3" CommandName="Send_Email" CommandArgument='<%# Container.DataItemIndex %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:E-Leraning %>" SelectCommand="SELECT * FROM [get_touch]"></asp:SqlDataSource>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
