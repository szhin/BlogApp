<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% if (session.getAttribute("name")==null) { response.sendRedirect(request.getContextPath() + "/forum"); } %>
     
      <!DOCTYPE html>
      <html lang="en">

      <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Chỉnh sửa blog</title>
            <link rel="stylesheet" href="alert/dist/sweetalert.css">
            <link rel="stylesheet" href="./css/forum-styles.css">
      </head>

      <body>
            <input type="hidden" id="status" value="${status }">

            <div id="forum">
                  <div id="sidebar">
                  	<div style="position: fixed; top: 50px;">
                        <div id="profile-image" style="background-image: url(./images/default-img-profile.jpeg)">
                        </div>
                        <% if (session.getAttribute("name") != null)  { %>
	                 		<div id="profile-name">
	                    		<%= session.getAttribute("fullname") %>
	                  		</div>
	              		<% } %>
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
                              <span id="home-text" class="active-forum">Đăng bài</span>
                        </a>
                        <a href="setting.jsp" id="sidebar-items" style="position: fixed; bottom: 60px;">
                              <span id="sidebar-icon"><img src="./images/icons/setting.png"></span>
                              <span id="home-text" class="sidebar-setting">Cài đặt</span>
                        </a>

                      </div>   
                  </div>
                  
                  <div id="content" class="gap-profile-content">
                        <section class="edit-blog-form">
                             	 <div id="edit-post">
                                   <div class="size-form">
                                    <form method="POST" action="editBlog">
                                    	<h2>Chỉnh sửa bài viết</h2>
                                    	<input type="text" name="title-blog" value="<%= session.getAttribute("blogTitle") %>" required>
                                    	<textarea name="content" required><%= session.getAttribute("blogContent") %></textarea>
                                    	<div style="display: flex; gap: 2rem; align-items: center;">
                                    		<button type="submit" name="editBlogController" style="width: 55rem; margin-top: 0;" >Chỉnh sửa</button>
                                    		<a href="deleteBlog.jsp" style="color: red;">Xoá blog này</a>
                                    	</div>
                                    </form>
                                   </div>
                                   
                              	</div>
                        </section>

                  </div>
                  
                  <div id="right-sidebar">
                       <a href="index" class="brand" style="position: fixed; top: 50px;" href="#"><small>A</small>B
                              <small> B</small>log
                              <span>We are one</span>
                        </a>
                  </div>
            </div>
			<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
			<c:if test="${not empty status}">
			    <c:set var="status" value="${status}" />
			    <c:choose>
			        <c:when test="${status eq 'error when create post'}">
			        	<c:set var="title" value="Cảnh báo" />
			            <c:set var="message" value="Error edit blog" />
			            <c:set var="alertType" value="error" />
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