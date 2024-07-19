<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/side_nav.Master" AutoEventWireup="true" CodeBehind="ExamResponse.aspx.cs" Inherits="E_learning.Admin.ExamResponse" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <div class="card-deck ">
            <div class="card">
                <asp:Image ID="Image1" class="card-img-top" runat="server" ImageUrl="~/pic/javabanner.jpg" Height="200" />
                <div class="card-body">
                    <h5 class="card-title">Java</h5>
                    <p class="card-text">Student Response</p>
                    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="https://docs.google.com/spreadsheets/d/1E_36C4K9KHDOtHM0HJBQIYXjQlo5C-ZcfCUgTR-c_gY/edit?resourcekey=&gid=2081878442#gid=2081878442" Target="_blank" CssClass="btn btn-sm w-100" Style="background-color: #695cfe; color: aliceblue; font-size: 18px; display: inline-block; text-decoration: none; padding: 8px 12px; border-radius: 4px;">
                      Check Response
                    </asp:HyperLink>
                </div>
            </div>
            <div class="card mt-3">
                <asp:Image ID="Image2" class="card-img-top" runat="server" ImageUrl="~/pic/net.jfif" Height="200" />
                <div class="card-body">
                    <h5 class="card-title">Java</h5>
                    <p class="card-text">Student Response</p>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="https://docs.google.com/spreadsheets/d/1icAniLRjqr_rmklquyoJ3Auc-cQk2BRB9xY4XazG-Hg/edit?resourcekey=&gid=123276971#gid=123276971" Target="_blank" CssClass="btn btn-sm w-100" Style="background-color: #695cfe; color: aliceblue; font-size: 18px; display: inline-block; text-decoration: none; padding: 8px 12px; border-radius: 4px;">
                        Check Response
                    </asp:HyperLink>
                </div>
                <div class="card mt-3">
                    <asp:Image ID="Image3" class="card-img-top" runat="server" ImageUrl="~/pic/python.png" Height="200" />
                    <div class="card-body">
                        <h5 class="card-title">Python</h5>
                        <p class="card-text">Student Response</p>
                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="https://docs.google.com/spreadsheets/d/1eBv7GywWny6V_wKzfKkRSlc5NaeNvU_OuDj7EYyeiQE/edit?resourcekey#gid=161745225" Target="_blank" CssClass="btn btn-sm w-100" Style="background-color: #695cfe; color: aliceblue; font-size: 18px; display: inline-block; text-decoration: none; padding: 8px 12px; border-radius: 4px;">
                              Check Response
                        </asp:HyperLink>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
