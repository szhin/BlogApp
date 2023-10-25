<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% if (session.getAttribute("name")==null) { response.sendRedirect("forum.jsp"); } %>
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
                       <a class="brand" style="position: fixed; top: 50px;" href="#"><small>A</small>B
                              <small> B</small>log
                              <span>We are one</span>
                        </a>
                  </div>
            </div>
			<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
			<%-- Check for the "status" query parameter --%>
			<% String status = request.getParameter("status"); %>
			
			<% if (status != null && !status.isEmpty()) { %>
			    <script type="text/javascript">
			        var status = "<%= status %>";
			        if (status === "Error edit blog") {
			            swal("Error", "Không chỉnh sửa được blog", "error");
			        } else if (status == "warning delete cancel") {
			        	 swal("Warning", "Bạn đã quyết định không xoá blog", "warning");
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