<%@ Page Title="" Language="C#" MasterPageFile="~/User/user_nav.Master" AutoEventWireup="true" CodeBehind="watch_video.aspx.cs" Inherits="E_learning.User.watch_video" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="jumbotron jumbotron-fluid page-header position-relative overlay-bottom" style="margin-bottom: 90px;">
        <div class="container text-center py-5">
            <h1 class="text-white display-1">Courses</h1>
            <div class="d-inline-flex text-white mb-5">
                <p class="m-0 text-uppercase"><a class="text-white" href="#">Home</a></p>
                <i class="fa fa-angle-double-right pt-1 px-3"></i>
                <p class="m-0 text-uppercase">Watch video</p>
            </div>
            <div class="mx-auto mb-5" style="width: 100%; max-width: 600px;">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="ddlCourses" class="text-white">Select Course:</label>
                        <select id="ddlCourses" class="form-control">
                            <option value="">Select Course</option>
                        </select>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="ddlSubCourses" class="text-white">Select SubCourse:</label>
                        <select id="ddlSubCourses" class="form-control">
                            <option value="">Select SubCourse</option>
                        </select>
                    </div>
                </div>
                <button id="btnPlayVideo" type="button" class="btn btn-secondary px-4 px-lg-5" onclick="playSelectedVideo()">Play Video</button>
            </div>
        </div>
    </div>

    <div class="container-fluid py-5">
        <div class="container py-5">
            <div class="row mx-0 justify-content-center">
                <div class="col-lg-12">
                    <div class="section-title text-center position-relative mb-5">
                        <div id="videoPanel" class="mt-4 w-100">
                            <!-- Video will be displayed here -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function () {
            // Fetch courses on page load
            $.ajax({
                type: "POST",
                url: "watch_video.aspx/GetCourses",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var courses = response.d;
                    var ddlCourses = $('#ddlCourses');
                    ddlCourses.empty();
                    ddlCourses.append($('<option>').val('').text('Select Course'));
                    $.each(courses, function (index, course) {
                        ddlCourses.append($('<option>').val(course.CourseName).text(course.CourseName));
                    });
                },
                error: function (response) {
                    console.log(response.responseText);
                }
            });

            // Handle course selection change
            $('#ddlCourses').change(function () {
                var selectedCourse = $(this).val();
                if (selectedCourse) {
                    $.ajax({
                        type: "POST",
                        url: "watch_video.aspx/GetSubCourses",
                        data: JSON.stringify({ course: selectedCourse }),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            var subCourses = response.d;
                            var ddlSubCourses = $('#ddlSubCourses');
                            ddlSubCourses.empty();
                            ddlSubCourses.append($('<option>').val('').text('Select SubCourse'));
                            $.each(subCourses, function (index, subCourse) {
                                ddlSubCourses.append($('<option>').val(subCourse.VideoUrl).text(subCourse.SubCourseName));
                            });
                        },
                        error: function (response) {
                            console.log(response.responseText);
                        }
                    });
                } else {
                    $('#ddlSubCourses').empty();
                }
            });
        });
        // Function to play selected video
        function playSelectedVideo() {
            var selectedVideoId = $('#ddlSubCourses').val();
            if (selectedVideoId) {
                var videoPanel = $('#videoPanel');
                var embedUrl = 'https://www.youtube.com/embed/' + selectedVideoId;
                videoPanel.html('<iframe width="100%" height="500" src="' + embedUrl + '" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>');
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Please select a subcourse to play the video!'
                });
            }
        }


    </script>
      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</asp:Content>
