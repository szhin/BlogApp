<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
      
            <div id="forum">
                  <div id="sidebar">
                        <div style="position: fixed; top: 50px;">
                        	<c:if test="${not empty sessionScope.name }">
                        		<div id="profile-image" style="background-image: url(./images/default-img-profile.jpeg)"></div>
		                        <div id="profile-name">${fullname }</div>
		                        <div id="profile-description">Always learning, always <br>innovating!</div>
		                        <div id="social-icons">
		                              <a href="https://github.com/" target="_blank" id="sidebar-icon"><img
		                                          src="./images/icons/github.png"></a>
		                              <a href="https://facebook.com/" target="_blank" id="sidebar-icon"><img
		                                          src="./images/icons/fb.png"></a>
		                        </div>
                        	</c:if>
                        	
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
	                        
	                        <c:if test="${not empty sessionScope.name }">
	                        	<a href="setting.jsp" id="sidebar-items" style="position: fixed; bottom: 60px;">
	                              <span id="sidebar-icon"><img src="./images/icons/setting.png"></span>
	                              <span id="home-text" class="sidebar-setting">Cài đặt</span>
	                        </a>
	                        </c:if>
                        </div>

                  </div>
                  <div id="content" class="gap-profile-content">
                        <div id="blog-content">
                            		<div class="blog-container">
                                        <a class="blog-title" style="font-size: 4.5rem; line-height: 6rem; margin-bottom: 1.5rem;"><%= request.getAttribute("blogTitle") %></a>
                                       	<div class="blog-creator">
                                       		<span id="sidebar-icon"><img src="./images/icons/author.png"></span>
	                                    	<span>${blogCreator }</span>   
                                       	</div>
                                        <div class="blog-details" style="margin-bottom: 2rem;">
	                                        <span id="sidebar-icon"><img src="./images/icons/schedule.png"></span>
	                                        <span>${blogTime }</span>
	                                        <span id="sidebar-icon"><img src="./images/icons/clock.png"></span>
	                                        <span>6 phút đọc</span>
	                                       
                                    	</div>                                  	
                                    	<div class="blog-content">         		   
                                            <p class="content">${blogContent }</p>           
                                   		</div>              
                                    </div>      
                        </div>
                  </div>
                  <div id="right-sidebar">
                       <a href="index" class="brand" style="position: fixed; top: 50px;" href="#"><small>A</small>B
                              <small> B</small>log
                              <span>We are one</span>
                        </a>
                  </div>
            </div>
            <c:if test="${not empty status }">
            <c:set var="status" value="${status }" />
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