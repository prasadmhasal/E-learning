<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="java.aspx.cs" Inherits="E_learning.User.certification.java" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <script src='https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js'></script>
 <script src='https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js'></script>
 <script src='https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.5/jspdf.min.js'></script>
    <style>
        @media print {
            .no-print, .no-print * {
                display: none !important;
            }

            .print-m-0 {
                margin: 0 !important;
            }
        }

        .btn {
            padding: 10px 17px;
            border-radius: 3px;
            background: #f4b71a;
            border: none;
            font-size: 12px;
            margin: 10px 5px;
        }

        .toolbar {
            background: #333;
            width: 100vw;
            position: fixed;
            left: 0;
            top: 0;
            text-align: center;
        }

        .cert-container {
            margin: 65px 0 10px 0;
            width: 100%;
            display: flex;
            justify-content: center;
        }

        .cert {
            width: 800px;
            height: 600px;
            padding: 15px 20px;
            text-align: center;
            position: relative;
            z-index: -1;
        }

        .cert-bg {
            position: absolute;
            left: 0px;
            top: 0;
            z-index: -1;
            width: 100%;
        }

        .cert-content {
            width: 750px;
            height: 470px;
            padding: 70px 60px 0px 60px;
            text-align: center;
            font-family: Arial, Helvetica, sans-serif;
        }

        h1 {
            font-size: 44px;
        }

        p {
            font-size: 25px;
        }

        small {
            font-size: 14px;
            line-height: 12px;
        }

        .bottom-txt {
            padding: 12px 5px;
            display: flex;
            justify-content: space-between;
            font-size: 16px;
        }

            .bottom-txt * {
                white-space: nowrap !important;
            }

        .other-font {
            font-family: Cambria, Georgia, serif;
            font-style: italic;
        }

        .ml-215 {
            margin-left: 215px;
        }
    </style>
 
        
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <div class='toolbar no-print'>
     <button class='btn btn-info' onclick='window.print()'>Print Certificate</button>
     <button class='btn btn-info' id='downloadPDF'>Download PDF</button>
     <asp:Button ID="Button1" class='btn btn-info' runat="server" Text="Home" OnClick="button1_click" />
 </div>
 <div class='cert-container print-m-0'>
     <div id='content2' class='cert'>
         <img src='https://edgarsrepo.github.io/certificate.png' class='cert-bg' alt='' />
         <div class='cert-content'>
             <h1 class='other-font'>Certificate of Completion</h1>
             <span style='font-size: 30px;'>Reginald Bentley</span>
             <br /><br /><br /><br />
             <span class='other-font'><i><b>has completed the</b></i></span>
             <br />
             <span style='font-size: 40px;'><b></b>
                 <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></span>
             <br />
             <small>(For Soldiers)</small>
             <br /><br /><br /><br />
             <small>
                Congratulations on successfully completing the Java examination! This achievement demonstrates your dedication and proficiency in Java programming. Keep up the great work as you continue to advance your skills and knowledge.
             </small>
             <div class='bottom-txt'>
                 <span>G-1 DAPE-ARR-SF</span>
                 <span>Completed on:<asp:Label ID="LabelDate" runat="server" ></asp:Label></span>
             </div>
         </div>
     </div>
 </div>
 
 
        </div>
    </form>
 <script>
     $('#downloadPDF').click(function () {
         getScreenshotOfElement(
             $('div#content2').get(0),
             0,
             0,
             $('#content2').width() + 45,
             $('#content2').height() + 30,
             function (data) {
                 var pdf = new jsPDF('l', 'pt', [
                     $('#content2').width(),
                     $('#content2').height()
                 ]);
 
                 pdf.addImage(
                     'data:image/png;base64,' + data,
                     'PNG',
                     0,
                     0,
                     $('#content2').width(),
                     $('#content2').height()
                 );
                 pdf.save('azimuth-certificte.pdf');
             }
         );
     });
 
     function getScreenshotOfElement(element, posX, posY, width, height, callback) {
         html2canvas(element, {
             onrendered: function (canvas) {
                 var context = canvas.getContext('2d');
                 var imageData = context.getImageData(posX, posY, width, height).data;
                 var outputCanvas = document.createElement('canvas');
                 var outputContext = outputCanvas.getContext('2d');
                 outputCanvas.width = width;
                 outputCanvas.height = height;
 
                 var idata = outputContext.createImageData(width, height);
                 idata.data.set(imageData);
                 outputContext.putImageData(idata, 0, 0);
                 callback(outputCanvas.toDataURL().replace('data:image/png;base64,', ''));
             },
             width: width,
             height: height,
             useCORS: true,
             taintTest: false,
             allowTaint: false,
         });
     }
 </script>
</body>
</html>
