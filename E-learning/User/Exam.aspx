<%@ Page Title="" Language="C#" MasterPageFile="~/User/user_nav.Master" AutoEventWireup="true" CodeBehind="Exam.aspx.cs" Inherits="E_learning.User.Exam" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .card-deck {
            margin: 0 -15px;
            justify-content: space-between;
        }

            .card-deck .card {
                margin: 0 0 1rem;
            }

        @media (min-width: 576px) and (max-width: 767.98px) {
            .card-deck .card {
                -ms-flex: 0 0 48.7%;
                flex: 0 0 48.7%;
            }
        }

        @media (min-width: 768px) and (max-width: 991.98px) {
            .card-deck .card {
                -ms-flex: 0 0 32%;
                flex: 0 0 32%;
            }
        }

        @media (min-width: 992px) {
            .card-deck .card {
                -ms-flex: 0 0 24%;
                flex: 0 0 24%;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="jumbotron jumbotron-fluid page-header position-relative overlay-bottom" style="margin-bottom: 90px;">
      <div class="container text-center py-5">
          <h1 class="text-white display-1">Examination</h1>
          <div class="d-inline-flex text-white mb-5">
              <p class="m-0 text-uppercase"><a class="text-white" href="">Home</a></p>
              <i class="fa fa-angle-double-right pt-1 px-3"></i>
              <p class="m-0 text-uppercase">Courses</p>
          </div>
         <%-- <div class="mx-auto mb-5" style="width: 100%; max-width: 600px;">
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
          </div>--%>
      </div>
  </div>

    <%--card--%>
 <div class="container">
  <div class="card-deck">
    <div class="card">
        <asp:Image ID="Image1"  class="card-img-top" runat="server" ImageUrl="~/pic/javabanner.jpg" Height="200" />
      <div class="card-body">
        <h5 class="card-title">Java</h5>
        <p class="card-text">Problem Solving (Basic) Skills Certification Test</p>
               <asp:Button ID="Button3" runat="server" Text="Start" data-bs-dismiss="modal"   CssClass="btn btn-sm w-100 mt-2" Style="background-color: #695cfe; color: aliceblue; font-size: 18px"  data-bs-target="#exampleModal" OnClientClick="showModal(); return false;"/>
        <%--  model --%>
          <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                  <div class="modal-content">
                      <div class="modal-header">
                          <h5 class="modal-title" id="exampleModalLabel">Examination Instructions</h5>
                          <asp:Button ID="Button2" runat="server" Text="Button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" />
                      </div>
                      <div class="modal-body">
                          
                          <p><strong>1. Arrive on Time:</strong> Ensure you arrive at the examination venue at least 15 minutes before the scheduled start time. Late arrivals may not be permitted to enter the examination room.</p>

                          <p><strong>2. Bring Necessary Materials:</strong> Carry all required materials such as pens, pencils, erasers, a calculator (if allowed), and your examination admit card. No sharing of materials is permitted during the examination.</p>

                          <p><strong>3. No Electronic Devices:</strong> Mobile phones, smartwatches, tablets, and any other electronic devices are strictly prohibited inside the examination room. Ensure all such devices are turned off and stored away as instructed by the invigilators.</p>

                          <p><strong>4. Follow Invigilator Instructions:</strong> Pay attention to the instructions given by the invigilators. Raise your hand if you need assistance during the examination and wait for an invigilator to come to you. Do not talk or disturb other candidates.</p>

                          <p><strong>5. Maintain Academic Integrity:</strong> Any form of cheating, copying, or attempting to use unauthorized materials will result in immediate disqualification and disciplinary action. Ensure you work independently and submit your own work.</p>
                      </div>
                      <div class="modal-footer">
                          
                          <asp:Button ID="Button4" runat="server" Text="Close" class="btn btn-secondary w-100" data-bs-dismiss="modal" OnClientClick="close();" />
                          <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="https://presenter.jivrus.com/p/1Pn893Ya8FmIyKtPs5icWvsJ5FDMI4OOboWOHoS5MEPY" Target="_blank" CssClass="btn btn-sm w-100" Style="background-color: #695cfe; color: aliceblue; font-size: 18px; display: inline-block; text-decoration: none; padding: 8px 12px; border-radius: 4px;">
                                Start
                            </asp:HyperLink>
                      </div>
                  </div>
              </div>
          </div>
         <%-- modelend --%>
        <asp:Button ID="Button1" CssClass="btn btn-sm w-100 mt-2" Style="background-color: #695cfe; color: aliceblue; font-size: 18px; display:none" runat="server" Text="Certification" OnClick="Button1_Click"  ClientIDMode="Static" />
      </div>   
    </div>
    <%--  second card--%>
      <div class="card">
    <asp:Image ID="Image2"  class="card-img-top" runat="server" ImageUrl="~/pic/net.jfif" Height="200" />
  <div class="card-body">
    <h5 class="card-title">.net</h5>
    <p class="card-text">Problem Solving (Basic) Skills Certification Test</p>
           <asp:Button ID="Button5" runat="server" Text="Start" data-bs-dismiss="modal"   CssClass="btn btn-sm w-100 mt-2" Style="background-color: #695cfe; color: aliceblue; font-size: 18px"  data-bs-target="#exampleModal" OnClientClick="showModal1(); return false;"/>
    <%--  model --%>
      <div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog">
              <div class="modal-content">
                  <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLabel1">Examination Instructions</h5>
                      <asp:Button ID="Button6" runat="server" Text="Button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" />
                  </div>
                  <div class="modal-body">
                      
                      <p><strong>1. Arrive on Time:</strong> Ensure you arrive at the examination venue at least 15 minutes before the scheduled start time. Late arrivals may not be permitted to enter the examination room.</p>

                      <p><strong>2. Bring Necessary Materials:</strong> Carry all required materials such as pens, pencils, erasers, a calculator (if allowed), and your examination admit card. No sharing of materials is permitted during the examination.</p>

                      <p><strong>3. No Electronic Devices:</strong> Mobile phones, smartwatches, tablets, and any other electronic devices are strictly prohibited inside the examination room. Ensure all such devices are turned off and stored away as instructed by the invigilators.</p>

                      <p><strong>4. Follow Invigilator Instructions:</strong> Pay attention to the instructions given by the invigilators. Raise your hand if you need assistance during the examination and wait for an invigilator to come to you. Do not talk or disturb other candidates.</p>

                      <p><strong>5. Maintain Academic Integrity:</strong> Any form of cheating, copying, or attempting to use unauthorized materials will result in immediate disqualification and disciplinary action. Ensure you work independently and submit your own work.</p>
                  </div>
                  <div class="modal-footer">
                      
                      <asp:Button ID="Button7" runat="server" Text="Close" class="btn btn-secondary w-100" data-bs-dismiss="modal" OnClientClick="close1();" />
                      <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="https://presenter.jivrus.com/p/1uyHan3mX_VGIP2FR77abZe8VT6t3bqJv3xTEwmpXRZc" Target="_blank" CssClass="btn btn-sm w-100" Style="background-color: #695cfe; color: aliceblue; font-size: 18px; display: inline-block; text-decoration: none; padding: 8px 12px; border-radius: 4px;">
                            Start
                        </asp:HyperLink>
                  </div>
              </div>
          </div>
      </div>
     <%-- modelend --%>
    <asp:Button ID="Button8" CssClass="btn btn-sm w-100 mt-2" Style="background-color: #695cfe; color: aliceblue; font-size: 18px; display:none" runat="server" Text="Certification" OnClick="Button1_Click"  ClientIDMode="Static" />
  </div>   
</div>
      <%--end second card--%>

     <%-- thired card--%>
            <div class="card">
    <asp:Image ID="Image3"  class="card-img-top" runat="server" ImageUrl="~/pic/python.png" Height="200" />
  <div class="card-body">
    <h5 class="card-title">Python</h5>
    <p class="card-text">Problem Solving (Basic) Skills Certification Test</p>
           <asp:Button ID="Button9" runat="server" Text="Start" data-bs-dismiss="modal"   CssClass="btn btn-sm w-100 mt-2" Style="background-color: #695cfe; color: aliceblue; font-size: 18px"  data-bs-target="#exampleModal" OnClientClick="showModal2(); return false;"/>
    <%--  model --%>
      <div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog">
              <div class="modal-content">
                  <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLabel2">Examination Instructions</h5>
                      <asp:Button ID="Button10" runat="server" Text="Button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" />
                  </div>
                  <div class="modal-body">
                      
                      <p><strong>1. Arrive on Time:</strong> Ensure you arrive at the examination venue at least 15 minutes before the scheduled start time. Late arrivals may not be permitted to enter the examination room.</p>

                      <p><strong>2. Bring Necessary Materials:</strong> Carry all required materials such as pens, pencils, erasers, a calculator (if allowed), and your examination admit card. No sharing of materials is permitted during the examination.</p>

                      <p><strong>3. No Electronic Devices:</strong> Mobile phones, smartwatches, tablets, and any other electronic devices are strictly prohibited inside the examination room. Ensure all such devices are turned off and stored away as instructed by the invigilators.</p>

                      <p><strong>4. Follow Invigilator Instructions:</strong> Pay attention to the instructions given by the invigilators. Raise your hand if you need assistance during the examination and wait for an invigilator to come to you. Do not talk or disturb other candidates.</p>

                      <p><strong>5. Maintain Academic Integrity:</strong> Any form of cheating, copying, or attempting to use unauthorized materials will result in immediate disqualification and disciplinary action. Ensure you work independently and submit your own work.</p>
                  </div>
                  <div class="modal-footer">
                      
                      <asp:Button ID="Button11" runat="server" Text="Close" class="btn btn-secondary w-100" data-bs-dismiss="modal" OnClientClick="close2();" />
                      <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="https://presenter.jivrus.com/p/11tGNRlE5Sy7tNfinCilboBjrO2a9XqaQwcEFg4ayL4k" Target="_blank" CssClass="btn btn-sm w-100" Style="background-color: #695cfe; color: aliceblue; font-size: 18px; display: inline-block; text-decoration: none; padding: 8px 12px; border-radius: 4px;">
                            Start
                        </asp:HyperLink>
                  </div>
              </div>
          </div>
      </div>
     <%-- modelend --%>
    <asp:Button ID="Button12" CssClass="btn btn-sm w-100 mt-2" Style="background-color: #695cfe; color: aliceblue; font-size: 18px; display:none" runat="server" Text="Certification" OnClick="Button1_Click"  ClientIDMode="Static" />
  </div>   
</div>
      <%--end card--%>

  </div>
</div>

 <script type="text/javascript">
   /*  first card*/
     function showModal() {
         var modal = new bootstrap.Modal(document.getElementById('exampleModal'));
         modal.show();
         var shobutton = document.getElementById("Button1").style.display = "block";
     }
     function close() {
         var shobutton = document.getElementById("Button1").style.display = "none";
     }
     /*   end first card*/
     /*  second card*/
     function showModal1() {
         var modal = new bootstrap.Modal(document.getElementById('exampleModal1'));
         modal.show();
         var shobutton = document.getElementById("Button8").style.display = "block";
     }
     function close1() {
         var shobutton = document.getElementById("Button8").style.display = "none";
     }
     /*secondend*/
     /*thired card*/
     function showModal2() {
         var modal = new bootstrap.Modal(document.getElementById('exampleModal1'));
         modal.show();
         var shobutton = document.getElementById("Button12").style.display = "block";
     }
     function close2() {
         var shobutton = document.getElementById("Button12").style.display = "none";
     }
</script>


</asp:Content>
