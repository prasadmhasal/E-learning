<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Invoice.aspx.cs" Inherits="E_learning.User.Invoice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Invoice with ribbon - Bootdey.com</title>
    <link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <script type="text/javascript"> </script>
    <style type="text/css">
        body {
            margin-top: 20px;
            background: #eee;
        }

        /*Invoice*/
        .invoice .top-left {
            font-size: 65px;
            color: #3ba0ff;
        }

        .invoice .top-right {
            text-align: right;
            padding-right: 20px;
        }

        .invoice .table-row {
            margin-left: -15px;
            margin-right: -15px;
            margin-top: 25px;
        }

        .invoice .payment-info {
            font-weight: 500;
        }

        .invoice .table-row .table > thead {
            border-top: 1px solid #ddd;
        }

            .invoice .table-row .table > thead > tr > th {
                border-bottom: none;
            }

        .invoice .table > tbody > tr > td {
            padding: 8px 20px;
        }

        .invoice .invoice-total {
            margin-right: -10px;
            font-size: 16px;
        }

        .invoice .last-row {
            border-bottom: 1px solid #ddd;
        }

        .invoice-ribbon {
            width: 85px;
            height: 88px;
            overflow: hidden;
            position: absolute;
            top: -1px;
            right: 14px;
        }

        .ribbon-inner {
            text-align: center;
            -webkit-transform: rotate(45deg);
            -moz-transform: rotate(45deg);
            -ms-transform: rotate(45deg);
            -o-transform: rotate(45deg);
            position: relative;
            padding: 7px 0;
            left: -5px;
            top: 11px;
            width: 120px;
            background-color: #66c591;
            font-size: 15px;
            color: #fff;
        }

            .ribbon-inner:before, .ribbon-inner:after {
                content: "";
                position: absolute;
            }

            .ribbon-inner:before {
                left: 0;
            }

            .ribbon-inner:after {
                right: 0;
            }

        @media(max-width:575px) {
            .invoice .top-left, .invoice .top-right, .invoice .payment-details {
                text-align: center;
            }

            .invoice .from, .invoice .to, .invoice .payment-details {
                float: none;
                width: 100%;
                text-align: center;
                margin-bottom: 25px;
            }

                .invoice p.lead, .invoice .from p.lead, .invoice .to p.lead, .invoice .payment-details p.lead {
                    font-size: 22px;
                }

            .invoice .btn {
                margin-top: 10px;
            }
        }

        @media print {
            .invoice {
                width: 900px;
                height: 800px;
            }
        }

        .invoice-date {
            font-size: 14px;
            color: #333;
            /* Add more styles as needed */
        }
    </style>
</head>
<body>
        <form id="form1" runat="server">
        <div>
            <div class="container bootstrap snippets bootdeys">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="panel panel-default invoice" id="invoice">
                            <div class="panel-body">
                                <div class="invoice-ribbon">
                                    <div class="ribbon-inner">PAID</div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6 top-left">
                                        <%-- <i class="fa fa-rocket"></i>--%>
                                    
                                        <h1 class="m-0 text-uppercase text-primary">
                                            <i class="fa fa-book-reader mr-3"></i>GlowSkills
                                        </h1>
                                    </div>
                                    <div class="col-sm-6 top-right">
                                        <h3 class="marginright">INVOICE-1234578</h3>
                                        <span class="marginright">
                                            <asp:Label ID="LabelDate" runat="server" CssClass="invoice-date"></asp:Label>
                                        </span>
                                    </div>
                                </div>
                                <hr>
                                
                                <div class="table-responsive">
                                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                                        <Columns>
                                            <asp:BoundField DataField="course" HeaderText="Course Name" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" SortExpression="course" />
                                            <asp:BoundField DataField="subcourse" HeaderText="Subcourse" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" SortExpression="subcourse" />
                                            <asp:BoundField DataField="course_title" HeaderText="Title" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" SortExpression="course_title" />
                                            <asp:BoundField DataField="price" HeaderText="Total Price (&#8377;)" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right" SortExpression="price" />
                                        </Columns>
                                        <HeaderStyle HorizontalAlign="Center" BackColor="#337AB7" ForeColor="White" />
                                        <RowStyle CssClass="odd" />
                                        <AlternatingRowStyle CssClass="even" />
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:E-Leraning%>" ProviderName="<%$ ConnectionStrings:E-Leraning.ProviderName %>" SelectCommand="SELECT * FROM [mycourse]"></asp:SqlDataSource>
                                </div>
                                <div class="row">
                                    <div class="col-xs-6 margintop">
                                        <p class="lead marginbottom">THANK YOU!</p>
                                        <asp:Button ID="btnPrint" class="btn btn-success" runat="server" Text="Print Invoice" OnClientClick="printPage();" />
                                       <%-- <asp:Button ID="btnSendInvoice" class="btn btn-danger" runat="server" Text="Mail Invoice" />--%>

                                    </div>
                                    <div class="col-xs-6 text-right pull-right invoice-total">
                                        <p>Discount (10%) : &#8377;101 </p>
                                        <p>Grandtotal :<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                                        </p>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="d-grid gap-2">
                    <asp:Button ID="Button1" class="btn rounded bg-dark text-white" runat="server" Text="Home" OnClick="Button1_Click" />

                </div>
            </div>
        </div>
    </form>

    <script type="text/javascript">
        function printPage() {
            window.print();
            return false; // Prevent postback of the button
        }

        // Get today's date



    </script>
</body>
</html>
