<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
      <!DOCTYPE html>
      <html lang="en">

      <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Blog</title>
            <link rel="stylesheet" href="alert/dist/sweetalert.css">
            <link rel="stylesheet" href="./css/forum-styles.css">
      </head>

      <body>
            <input type="hidden" id="status" value="<%= request.getAttribute("status") %>">

            <div id="forum">
                  <div id="sidebar">
                        <div id="profile-image" style="background-image: url(./images/default-img-profile.jpeg)">
                        </div>
                        <div id="profile-name">
                              <%= session.getAttribute("name")==null ? "Chưa Login" : session.getAttribute("fullname")
                                    %>
                        </div>
                        <div id="profile-description">Always learning, always innovating!</div>
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

                  </div>
                  <div id="content" class="gap-profile-content">
                        <div id="blog-content">
                        	<% if (session.getAttribute("status")=="error" ) {%>
                            		<p>Không có quyền xem blog này.</p>
                        	<% } else { %>
                            		<div class="blog-container">
                                        <a class="blog-title" style="font-size: 4.5rem;"><%= request.getAttribute("blogTitle") %></a>
                                       	<div class="blog-creator">
                                       		<span id="sidebar-icon"><img src="./images/icons/author.png"></span>
	                                    	<span><%= request.getAttribute("blogCreator") %></span>   
                                       	</div>
                                        <div class="blog-details" style="margin-bottom: 2rem;">
	                                        <span id="sidebar-icon"><img src="./images/icons/schedule.png"></span>
	                                        <span><%= request.getAttribute("blogTime") %></span>
	                                        <span id="sidebar-icon"><img src="./images/icons/clock.png"></span>
	                                        <span>6 phút đọc</span>
	                                       
                                    	</div>                                  	
                                    	<div class="blog-content">         		   
                                            <p class="content"><%= request.getAttribute("blogContent") %></p>           
                                   		</div>              
                                    </div>  
                        	<% } %>      
                        </div>
                  </div>
                  <div id="right-sidebar">
                       <a class="brand" href="#"><small>A</small>B
                              <small> B</small>log
                              <span>We are one</span>
                        </a>
                  </div>
            </div>



            <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
            <script type="text/javascript">

                  var status = document.getElementById("status").value;
                  if (status == "error") {
                        swal("Sorry", "Something wrong", "error");
                  }

            </script>
      </body>

      </html>