<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/side_nav.Master" AutoEventWireup="true" CodeBehind="User_List.aspx.cs" Inherits="E_learning.Admin.User_List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
    .d-none {
        display: none;
    }
    .pagination {
        display: flex;
        justify-content: center;
        padding: 10px;
    }
    .pagination a, .pagination span {
        margin: 0 5px;
        padding: 5px 10px;
        border: 1px solid #ddd;
        color: #007bff;
        text-decoration: none;
    }
    .pagination a:hover, .pagination span:hover {
        background-color: #007bff;
        color: #fff;
    }
    .pagination .active span {
        background-color: #007bff;
        color: #fff;
        border: 1px solid #007bff;
    }
    .card {
    margin-top: 20px;
    border: 1px solid rgba(0, 0, 0, 0.125);
    border-radius: 0.25rem;
    box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
}

.card-header {
    padding: 0.75rem 1.25rem;
    margin-bottom: 0;
    background-color: #007bff;
    border-bottom: 1px solid rgba(0, 0, 0, 0.125);
    color: #fff;
}

.card-body {
    padding: 1.25rem;
}

.table {
    width: 100%;
    margin-bottom: 1rem;
    background-color: transparent;
    border-collapse: collapse;
}

.table-bordered {
    border: 1px solid #dee2e6;
}

.table-bordered th,
.table-bordered td {
    border: 1px solid #dee2e6;
    padding: 0.75rem;
    vertical-align: top;
}

.btn {
    display: inline-block;
    font-weight: 400;
    color: #212529;
    text-align: center;
    vertical-align: middle;
    user-select: none;
    background-color: #28a745;
    border: 1px solid transparent;
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    line-height: 1.5;
    border-radius: 0.25rem;
    transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
    cursor: pointer;
    text-decoration: none;
}

.btn-success {
    color: #fff;
    background-color: #28a745;
    border-color: #28a745;
}

.btn-success:hover {
    background-color: #218838;
    border-color: #1e7e34;
}

.btn-danger {
    color: #fff;
    background-color: #dc3545;
    border-color: #dc3545;
}

.btn-danger:hover {
    background-color: #c82333;
    border-color: #bd2130;
}

</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div class="container mt-5">
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header bg-primary text-white">
                    User List
                </div>
                <div class="card-body">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="acc_userid" DataSourceID="SqlDataSource1" OnRowCommand="GridView1_RowCommand" CssClass="table table-striped table-bordered">
                        <Columns>
                            <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="ID">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("acc_userid") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="acc_username" HeaderText="Username" SortExpression="acc_username" />
                            <asp:BoundField DataField="acc_useremail" HeaderText="Email" SortExpression="acc_useremail" />
                            <asp:BoundField DataField="acc_userpass" HeaderText="Password" SortExpression="acc_userpass" />
                            <asp:BoundField DataField="urole" HeaderText="Role" SortExpression="urole" />
                            <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status" />
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <asp:Button ID="btnBlockUser" runat="server" Text="Block User" CssClass="btn btn-danger mt-3 d-block" CommandName="BlockUser" CommandArgument='<%# Eval("acc_userid") %>' Visible='<%# Eval("status").ToString() == "Active" %>' />
                                    <asp:Button ID="btnUnblockUser" runat="server" Text="Unblock User" CssClass="btn btn-success mt-3 d-block" CommandName="UnblockUser" CommandArgument='<%# Eval("acc_userid") %>' Visible='<%# Eval("status").ToString() == "Blocked" %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle CssClass="pagination" />
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</div>




 

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:E-Leraning %>"  SelectCommand="SELECT * FROM [user_acc] ">
    
</asp:SqlDataSource>

</asp:Content>
