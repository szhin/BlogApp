<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
      <!DOCTYPE html>
      <html lang="en">

      <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Diễn đàn</title>
            <link rel="stylesheet" href="./css/forum-styles.css">
      </head>

      <body>
            <div id="forum">
                  <div id="sidebar">
                        <%-- <div id="profile-image" style="background-image: url(./images/default-img-profile.jpeg)">
                        <a href="profile.jsp"></a>
                        </div>
                        <div id="profile-name">
	                        <a href="profile.jsp">
	                        	<%= session.getAttribute("name") == null ? "Chưa Login" : session.getAttribute("fullname") %>
	                        </a>
	                    </div>
                        <div id="profile-description">Always learning, always innovating!</div>
                        <div id="social-icons">
                              <a href="https://github.com/" target="_blank" id="sidebar-icon"><img
                                          src="./images/icons/github.png"></a>
                              <a href="https://facebook.com/" target="_blank" id="sidebar-icon"><img
                                          src="./images/icons/fb.png"></a>
                        </div> --%>
                        <a href="index.jsp" id="sidebar-items">
                              <span id="sidebar-icon"><img src="./images/icons/home.png"></span>
                              <span id="home-text">Trang chủ</span>
                        </a>
                        <a href="#" id="sidebar-items">
                              <span id="sidebar-icon"><img src="./images/icons/forum.png"></span>
                              <span id="home-text" class="active-forum">Diễn đàn</span>
                        </a>
                     
                        <a href="<%= session.getAttribute("name") == null ? "login.jsp" : "profile.jsp" %>" id="sidebar-items">
                              <span id="sidebar-icon"><img src="<%= session.getAttribute("name") == null ? "./images/icons/login.png" : "./images/icons/create-post.png" %>"></span>
                              <span id="home-text"><%= session.getAttribute("name") == null ? "Đăng nhập" : "Đăng bài" %></span>
                        </a>
                  </div>
                  <div id="content" class="gap-forum-content">
                        <div class="blog-container">
                              <a class="blog-category" href="entertain.jsp"
                                    style="background-color: #176B87; color: #fff;">Giải trí</a>
                              <a class="blog-title">Hành trình học lập trình của tôi</a>
                              <div class="blog-details">
                                    <span id="sidebar-icon"><img src="./images/icons/schedule.png"></span>
                                    <span>12/10/2023</span>
                                    <span id="sidebar-icon"><img src="./images/icons/clock.png"></span>
                                    <span>5 phút đọc</span>
                              </div>
                        </div>
                       <div class="blog-container">
                              <a class="blog-category" href="entertain.jsp"
                                    style="background-color: #176B87; color: #fff;">Giải trí</a>
                              <a class="blog-title">Hành trình học lập trình của tôi</a>
                              <div class="blog-details">
                                    <span id="sidebar-icon"><img src="./images/icons/schedule.png"></span>
                                    <span>12/10/2023</span>
                                    <span id="sidebar-icon"><img src="./images/icons/clock.png"></span>
                                    <span>5 phút đọc</span>
                              </div>
                        </div>
                        <div class="blog-container">
                              <a class="blog-category" href="entertain.jsp"
                                    style="background-color: #176B87; color: #fff;">Giải trí</a>
                              <a class="blog-title">Hành trình học lập trình của tôi</a>
                              <div class="blog-details">
                                    <span id="sidebar-icon"><img src="./images/icons/schedule.png"></span>
                                    <span>12/10/2023</span>
                                    <span id="sidebar-icon"><img src="./images/icons/clock.png"></span>
                                    <span>5 phút đọc</span>
                              </div>
                        </div>
                        <div class="blog-container">
                              <a class="blog-category" href="entertain.jsp"
                                    style="background-color: #176B87; color: #fff;">Giải trí</a>
                              <a class="blog-title">Hành trình học lập trình của tôi</a>
                              <div class="blog-details">
                                    <span id="sidebar-icon"><img src="./images/icons/schedule.png"></span>
                                    <span>12/10/2023</span>
                                    <span id="sidebar-icon"><img src="./images/icons/clock.png"></span>
                                    <span>5 phút đọc</span>
                              </div>
                        </div>
                        <div class="blog-container">
                              <a class="blog-category" href="entertain.jsp"
                                    style="background-color: #176B87; color: #fff;">Giải trí</a>
                              <a class="blog-title">Hành trình học lập trình của tôi</a>
                              <div class="blog-details">
                                    <span id="sidebar-icon"><img src="./images/icons/schedule.png"></span>
                                    <span>12/10/2023</span>
                                    <span id="sidebar-icon"><img src="./images/icons/clock.png"></span>
                                    <span>5 phút đọc</span>
                              </div>
                        </div>

                  </div>
                  <div id="right-sidebar">
                       <a class="brand" href="#"><small>A</small>B
                              <small> B</small>log
                              <span>We are one</span>
                        </a>
                  </div>
            </div>
      </body>

      </html>