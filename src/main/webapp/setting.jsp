<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% if (session.getAttribute("name")==null) { response.sendRedirect("profile.jsp"); } %>
  
      <!DOCTYPE html>
      <html lang="en">

      <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Settings</title>
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
	                        <a href="index" id="sidebar-items">
	                              <span id="sidebar-icon"><img src="./images/icons/home.png"></span>
	                              <span id="home-text">Trang chủ</span>
	                        </a>
	                        <a href="forum" id="sidebar-items">
	                              <span id="sidebar-icon"><img src="./images/icons/forum.png"></span>
	                              <span id="home-text">Diễn đàn</span>
	                        </a>
	                        
	             
	                        <a href="profile" id="sidebar-items">
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
                        	<div class="setting">
                        		<h1 style="margin-bottom: 20px;">Thông tin tài khoản</h1>
						        <div class="setting-info">
						        	<p>Họ và tên: <span><%= session.getAttribute("fullname") %></span>
							        </p>
							        <p>Email: <span><%= session.getAttribute("userEmail") %></span>
							        </p>
							        <p>Mật khẩu: <span>************</span></p>
							        <p>Số điện thoại: <span><%= session.getAttribute("userPhone") %></span>
							        </p>

						        </div>    
						        <a class="edit" href="editProfile.jsp">Sửa thông tin</a>
							
							 	<a class="delete" href="confirmDelete.jsp" style="color: red;">Xóa tài khoản</a> 
                       		</div>
                        </div>
                  </div>
                  <div id="right-sidebar">
                       <a class="brand" style="position: fixed; top: 50px;" href="index"><small>A</small>B
                              <small> B</small>log
                              <span>We are one</span>
                        </a>
                  </div>
            </div>

            <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
           <c:if test="${not empty status}">
			    <c:set var="status" value="${status}" />
			    <c:choose>
			        <c:when test="${status eq 'warning delete cancel'}">
			        	<c:set var="title" value="Oh yeah" />
			            <c:set var="message" value="Thật tuyệt khi bạn không xoá tài khoản" />
			            <c:set var="alertType" value="warning" />
			        </c:when>
			        <c:when test="${status eq 'success edit info'}">
			        	<c:set var="title" value="Success" />
			            <c:set var="message" value="Chỉnh sửa thông tin thành công" />
			            <c:set var="alertType" value="success" />
			        </c:when>
			        <c:when test="${status eq 'success change password'}">
			        	<c:set var="title" value="Success" />
			            <c:set var="message" value="Thay đổi mật khẩu thành công" />
			            <c:set var="alertType" value="success" />
			        </c:when>

			    </c:choose>

			    <script type="text/javascript">
				    var status = "${status}";
				    if (status) {
				        swal("${title}", "${message}", "${alertType}");
				        <c:remove var="status" scope="session" />
				    }
			    </script>
			</c:if>
       
      </body>

      </html>