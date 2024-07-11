<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/side_nav.Master" AutoEventWireup="true" CodeBehind="dashbord.aspx.cs" Inherits="E_learning.Admin.dashbord" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style>
        /* bar  */
        .flex {
            -webkit-box-flex: 1;
            -ms-flex: 1 1 auto;
            flex: 1 1 auto
        }

        @media (max-width:991.98px) {
            .padding1 {
                padding: 1.5rem
            }
        }

        @media (max-width:767.98px) {
            .padding1 {
                padding: 1rem
            }
        }

        /* .padding {
  padding: 5rem
} */
        .order-card {
            /* background:#FAFAFA; */
            color: #fff;
        }

        .bg-c-blue {
            background: linear-gradient(to bottom right, rgba(255, 0, 0, 0.3), rgba(0, 0, 255, 0.3))
        }

        .bg-c-green {
            background: linear-gradient( to bottom right,#fcdf8a, #f38381);
        }

        .bg-c-yellow {
            background: linear-gradient( to bottom right,#f2d50f, #da0641);
        }

        .bg-c-pink {
            background: linear-gradient(to bottom right, #fad961, #f76b1c);
        }


        .card {
            border-radius: 5px;
            -webkit-box-shadow: 0 1px 2.94px 0.06px rgba(4,26,55,0.16);
            box-shadow: 0 1px 2.94px 0.06px rgba(4,26,55,0.16);
            border: none;
            margin-bottom: 30px;
            -webkit-transition: all 0.3s ease-in-out;
            transition: all 0.3s ease-in-out;
        }

            .card .card-block {
                padding: 25px;
            }

        .order-card i {
            font-size: 26px;
        }

        .f-left {
            float: left;
        }

        .f-right {
            float: right;
        }
    </style>
    <script>
        $(document).ready(function () {
            var ctx = $("#chart-line");
            var myLineChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: [1500, 1600, 1700, 1750, 1800, 1850, 1900, 1950, 1999, 2050],
                    datasets: [{
                        data: [86, 114, 106, 106, 107, 111, 133, 221, 783, 2478],
                        label: "Student",
                        borderColor: "#458af7",
                        backgroundColor: '#458af7',
                        fill: false
                    }, {
                        data: [282, 350, 411, 502, 635, 809, 947, 1402, 3700, 5267],
                        label: "visit",
                        borderColor: "#8e5ea2",
                        fill: true,
                        backgroundColor: '#8e5ea2'
                    }, {
                        data: [168, 170, 178, 190, 203, 276, 408, 547, 675, 734],
                        label: "Purchase",
                        borderColor: "#3cba9f",
                        fill: false,
                        backgroundColor: '#3cba9f'
                    }]
                },
                options: {
                    title: {
                        display: true,
                        text: 'World population per region (in millions)'
                    }
                }
            });
        });
    </script> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container-fluid mt-5">
     <div class="row" >
         <div class="col-md-4 col-xl-3  ">
             <div class="card bg-c-blue order-card">
                 <div class="card-block ">
                     <h6 class="m-b-20">Sells</h6>
                     <h2 class="text-right"><i class="fa fa-cart-plus f-left"></i><span>
                         <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label></span></h2>
                     <p class="m-b-0">Sells<span class="f-right"><asp:Label ID="Label6" runat="server" Text="Label"></asp:Label></span></p>
                 </div>
             </div>
         </div>
         
         <div class="col-md-4 col-xl-3">
             <div class="card bg-c-green order-card">
                 <div class="card-block">
                     <h6 class="m-b-20">Orders Placed</h6>
                     <h2 class="text-right"><i class="fa fa-rocket f-left"></i><span><asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></span></h2>
                     <p class="m-b-0">Orders Placed<span class="f-right"><asp:Label ID="Label4" runat="server" Text="Label"></asp:Label></span></p>
                 </div>
             </div>
         </div>
         
         <div class="col-md-4 col-xl-3">
             <div class="card bg-c-yellow order-card">
                 <div class="card-block">
                     <h6 class="m-b-20">Course Count</h6>
                     <h2 class="text-right"><i class="fa fa-refresh f-left"></i><span>
                         <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></span></h2>
                     <p class="m-b-0">Course Count<span class="f-right"> <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></span></p>
                 </div>
             </div>
         </div>
         
         <div class="col-md-4 col-xl-3">
             <div class="card bg-c-pink order-card">
                 <div class="card-block">
                     <h6 class="m-b-20">User Account</h6>
                     <h2 class="text-right"><i class="fa fa-credit-card f-left"></i><span><asp:Label ID="Label7" runat="server" Text="Label"></asp:Label></span></h2>
                     <p class="m-b-0">User Account<span class="f-right"><asp:Label ID="Label8" runat="server" Text="Label"></asp:Label></span></p>
                 </div>
             </div>
         </div>
     </div>

     <!-- test -->
     <div class="page-content page-container container-fluid" id="page-content">
         <div class="padding1 w-100">
             <div class="row">
                 <div class="container-fluid d-flex justify-content-center ">
                     <div class="col-sm-12 col-md-10 col-lg-8 col-xl-6 w-100 vh-100 ">
                         <!-- Adjust col sizes based on your preference -->
                         <div class="card1">
                             <div class="card-header card-header1">Student chart</div>
                             <div class="card-body" style="height: 420px">
                                 <div class="chartjs-size-monitor" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
                                     <div class="chartjs-size-monitor-expand" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">
                                         <div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div>
                                     </div>
                                     <div class="chartjs-size-monitor-shrink" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">
                                         <div style="position:absolute;width:200%;height:200%;left:0; top:0"></div>
                                     </div>
                                 </div> 
                                 <canvas id="chart-line" class="chartjs-render-monitor"></canvas>
                             </div>
                         </div>
                     </div>
                 </div>
             </div>
         </div>
     </div>
 </div>
</asp:Content>
