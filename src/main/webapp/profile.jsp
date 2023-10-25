<%@page import="com.blog.dao.BlogDAO"%>
<%@page import="com.blog.model.Blog"%>
<%@page import="java.util.List"%>
<%@page import="com.blog.service.BlogService"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% if (session.getAttribute("name")==null) { response.sendRedirect("forum.jsp"); } %>
      <!DOCTYPE html>
      <html lang="en">

      <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Hồ sơ</title>
            <link rel="stylesheet" href="alert/dist/sweetalert.css">
            <link rel="stylesheet" href="./css/forum-styles.css">
      </head>

      <body>
            <input type="hidden" id="status" value="<%= request.getAttribute("status") %>">

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
                              <span id="home-text" class="active-forum">Đăng bài</span>
                        </a>
                        <a href="setting.jsp" id="sidebar-items" style="position: fixed; bottom: 60px;">
                              <span id="sidebar-icon"><img src="./images/icons/setting.png"></span>
                              <span id="home-text" class="sidebar-setting">Cài đặt</span>
                        </a>

                      </div>   
                  </div>
                  <div id="content" class="gap-profile-content">
                        <section class="create-blog-form">
                              	<button id="show-create-post"><img class="create-icon" src="./images/icons/create-post.png">Tạo bài viết</button>     
                              	<div id="overlay" onclick="closeCreatePost()"></div>
                             	 <div id="create-post">
                                   <div class="size-form">
                                   	<img onClick="closeCreatePost()" src="./images/icons/close.png">
                                    <form method="POST" action="createBlogPost">
                                    	<h2>Tạo bài viết</h2>
                                    	<input type="text" name="title-blog" placeholder="Tiêu đề bài viết" required>
                                    	<textarea name="content" placeholder="Nội dung" required></textarea>
                                    	<button type="submit" name="submit-create-post">Post</button>
                                    </form>
                                   </div>
                              </div>
                        </section>
						
					<% 
					if (session.getAttribute("name") !=null ) {
					    BlogService blogService = new BlogService();
						
					    int userId = (int) request.getSession().getAttribute("userId");
					    
					    if (blogService.isHaveBlog(userId)) {
					%>
					    <h2 class="collection-blog">Bài viết của bạn</h2>
					<%
					        for (Blog blog : blogService.getListUserBlogs()) {
					            String fullDateTime = blog.getCreationDate().toString();
					            String dateOnly = fullDateTime.split(" ")[0];
					%>
					            <div class="your-blog-container">
					                <a class="your-blog-title" href="blog?id=<%= blog.getId() %>"><%= blog.getTitle() %></a>
					                <span class="your-blog-time"><%= dateOnly %></span>
					               	<div class="icon-dispatcher">
					               		<a class="edit-icon" href="editBlog?id=<%= blog.getId() %>">
					               			<span style="font-size: 12px;">Sửa</span> <img src="./images/icons/edit.png">
					               		</a>
					               	</div>
					            </div>
					<%
					        }
					
					    } else {
					%>
					    <h2 class="collection-blog">Bạn chưa tạo bài viết nào</h2>
					<%
					    }
					}
					%>
						

                  </div>
                  
                  <div id="right-sidebar">
                       <a class="brand" style="position: fixed; top: 50px;" href="#"><small>A</small>B
                              <small> B</small>log
                              <span>We are one</span>
                        </a>
                  </div>
            </div>
            <script>
                  const createPostButton = document.getElementById('show-create-post');
                  const overlay = document.getElementById('overlay');
                  const createPostForm = document.getElementById('create-post');

                  createPostButton.addEventListener('click', () => {
                        overlay.style.display = 'block';
                        createPostForm.style.display = 'block';
                  });

                  function closeCreatePost() {
                        overlay.style.display = 'none';
                        createPostForm.style.display = 'none';
                  }

            </script>
			<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
			<%-- Check for the "status" query parameter --%>
			<% String status = request.getParameter("status"); %>
			
			<% if (status != null && !status.isEmpty()) { %>
			    <script type="text/javascript">
			        var status = "<%= status %>";
			        if (status == "success") {
			            swal("Success", "Your post created success", "success");
			        } else if (status == "error when create post") {
			            swal("Oh no", "Wrong something when create post", "warning");
			        } else if (status == "login success") {
			            swal("Oh yeah!", "Bạn đã đăng nhập thành công", "success");
			        } else if (status == "Success edit blog") {
			        	 swal("Oh yeah!", "Bạn đã chỉnh sửa blog thành công", "success");
			        } else if (status == "success deleted blog") {
			        	 swal("Success", "Bạn đã xoá blog thành công", "success");
			        }
			
			    </script>
			<% } %>
			
			<%-- Remove the "status" query parameter from the URL --%>
			<script type="text/javascript">
			    if (window.location.search.indexOf('status=') > -1) {
			        window.history.replaceState({}, document.title, window.location.pathname);
			    }
			</script>
			
      </body>

      </html>