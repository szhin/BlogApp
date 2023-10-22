<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% if (session.getAttribute("name")==null) { response.sendRedirect("profile.jsp"); } %>
      <!DOCTYPE html>
      <html lang="en">

      <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Edit profile</title>
            <link rel="stylesheet" href="alert/dist/sweetalert.css">
            <link rel="stylesheet" href="./css/forum-styles.css">
            <link rel="stylesheet" href="./css/setting.css">
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
                        <div id="blog-content" >
                        	<section class="edit-profile">
								<h1 style="margin-bottom: 2rem;">Sửa thông tin</h1>
								<form method="POST" action="editProfile" id="editProfile-form">
									<div class="form-group">
										<p class="form-item">Họ và tên</p>
										<input type="text" name="name" id="name" value="<%= session.getAttribute("fullname") %>" required />
									</div>
									<div class="form-group">
										<p class="form-item">Email</p>
										<input type="email" name="email" id="email" value="<%= session.getAttribute("userEmail") %>" required />
									</div>			
									<div class="form-group">
										<p class="form-item">Số điện thoại</p>
										<input type="text" name="contact" id="contact" value="<%= session.getAttribute("userPhone") %>" required />
									</div>
									
									<div class="form-group">
										<p class="form-item confirm">Nhập mật khẩu để xác nhận</p>
										<input type="password" name="password" id="password" placeholder="Mật khẩu của bạn" required />
									</div>
									
									<div class="form-group form-button">
										<input type="submit" name="editProfile" id="editProfile" class="form-submit" value="Xác nhận chỉnh sửa" />
									</div>				
								</form>
								<a href="changePassword.jsp" class="change-password">Thay đổi mật khẩu</a>
							</section>
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
            <% String status = request.getParameter("status"); %>
			
			<% if (status != null && !status.isEmpty()) { %>
			    <script type="text/javascript">
			        var status = "<%= status %>";
			        
			        if (status === "warning email already") {
			            swal("Sorry", "Email đã tồn tại", "warning");
			        } else if (status === "error wrong password") {
			            swal("Sai mật khẩu", "Không thể xác nhận", "error");
			        } else if (status == "error get info") {
			        	swal("Error", "Có lỗi khi lấy thông tin người dùng", "error")
			        } else if (status == "error") {
			        	swal("Error", "Có lỗi đối với email", "error")
			        }
			    </script>
			<% } %>
			
			<%-- Remove the "status" query parameter from the URL --%>
			<script type="text/javascript">
				if ((window.location.search.indexOf('status=') > -1)) {
				 	window.history.replaceState({}, document.title, window.location.pathname);
				}
			</script>
      </body>

      </html>