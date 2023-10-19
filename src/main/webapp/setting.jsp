<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% if (session.getAttribute("name")==null) { response.sendRedirect("profile.jsp"); } %>
      <!DOCTYPE html>
      <html lang="en">

      <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Settings</title>
            <link rel="stylesheet" href="alert/dist/sweetalert.css">
            <link rel="stylesheet" href="./css/forum-styles.css">
      </head>

      <body>
            <input type="hidden" id="status" value="<%= request.getAttribute("status") %>">

            <div id="forum">
                  <div id="sidebar">
                        <div style="position: fixed; top: 50px;">
                        	<div id="profile-image" style="background-image: url(./images/default-img-profile.jpeg)"></div>
	                        <div id="profile-name">
	                              <%= session.getAttribute("name")==null ? "Chưa Login" : session.getAttribute("fullname")
	                                    %>
	                        </div>
	                        <div id="profile-description">Always learning, always <br>innovating!</div>
	                        <div id="social-icons">
	                              <a href="https://github.com/" target="_blank" id="sidebar-icon"><img
	                                          src="./images/icons/github.png"></a>
	                              <a href="https://facebook.com/" target="_blank" id="sidebar-icon"><img
	                                          src="./images/icons/fb.png"></a>
	                        </div>
	                        <a href="index.jsp" id="sidebar-items">
	                              <span id="sidebar-icon"><img src="./images/icons/home.png"></span>
	                              <span id="home-text">Trang chủ</span>
	                        </a>
	                        <a href="forum.jsp" id="sidebar-items">
	                              <span id="sidebar-icon"><img src="./images/icons/forum.png"></span>
	                              <span id="home-text">Diễn đàn</span>
	                        </a>
	                        
	             
	                        <a href="profile.jsp" id="sidebar-items">
	                              <span id="sidebar-icon"><img src="./images/icons/create-post.png"></span>
	                              <span id="home-text">Đăng bài</span>
	                        </a>
	                        
	                        <a href="#" id="sidebar-items" style="position: fixed; bottom: 60px;">
	                              <span id="sidebar-icon"><img src="./images/icons/setting.png"></span>
	                              <span id="home-text" class="sidebar-setting">Cài đặt</span>
	                        </a>
                        </div>

                  </div>
                  <div id="content" class="gap-profile-content">
                        <div id="blog-content" style="font-size: 24px; display: flex; flex-direction: column; gap: 3rem;">
                        		<h1 style="margin-bottom: 20px;">Thông tin tài khoản</h1>
						        <p>Họ và tên: <%= session.getAttribute("fullname") %>
						        </p>
						        <p>Email: <%= session.getAttribute("userEmail") %>
						        </p>
						        <p>Mật khẩu: <%= session.getAttribute("userPassword") %></p>
						        <p>Mobile: <%= session.getAttribute("userPhone") %>
						        </p>

						        <!-- Chức năng chỉnh sửa -->
						        <a href="editProfile.jsp">Chỉnh sửa</a>
						
						        <!-- Chức năng xóa tài khoản -->
						        <a href="confirmDelete.jsp" style="color: red;">Xóa tài khoản</a>     
                        </div>
                  </div>
                  <div id="right-sidebar">
                       <a class="brand" style="position: fixed; top: 50px;" href="#"><small>A</small>B
                              <small> B</small>log
                              <span>We are one</span>
                        </a>
                  </div>
            </div>

            <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
            <script type="text/javascript">

                  var status = document.getElementById("status").value;
                  if (status == "delete cancel") {
                        swal("OK", "Bạn đã không xoá tài khoản, "warning");
                  }

            </script>
      </body>

      </html>