<%@page import="com.blog.model.Blog"%>
<%@page import="java.util.List"%>
<%@page import="com.blog.dao.BlogDAO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
					<div style="position: fixed; top: 50px;">
                        <a href="index" id="sidebar-items">
                              <span id="sidebar-icon"><img src="./images/icons/home.png"></span>
                              <span id="home-text">Trang chủ</span>
                        </a>
                        <a href="forum" id="sidebar-items">
                              <span id="sidebar-icon"><img src="./images/icons/forum.png"></span>
                              <span id="home-text" class="active-forum">Diễn đàn</span>
                        </a>
                     
                        <c:choose>
						    <c:when test="${empty sessionScope.name}">
						        <a href="login.jsp" id="sidebar-items">
						            <span id="sidebar-icon"><img src="./images/icons/login.png"></span>
						            <span id="home-text">Đăng nhập</span>
						        </a>
						    </c:when>
						    <c:otherwise>
						        <a href="profile" id="sidebar-items">
						            <span id="sidebar-icon"><img src="./images/icons/create-post.png"></span>
						            <span id="home-text">Đăng bài</span>
						        </a>
						        <c:if test="${not empty sessionScope.name}">
						            <a href="setting.jsp" id="sidebar-items" style="position: fixed; bottom: 60px;">
						                <span id="sidebar-icon"><img src="./images/icons/setting.png"></span>
						                <span id="home-text" class="sidebar-setting">Cài đặt</span>
						            </a>
						        </c:if>
						    </c:otherwise>
						</c:choose>
                        
                 	</div>
                  </div>
                  <div id="content" class="gap-forum-content">
                  
                  	<c:forEach items="${blogList }" var="blog">
                  		<div class="blog-container">
				            <a class="blog-category" href="entertain.jsp" style="background-color: #176B87; color: #fff;">Giải trí</a>
				            <a class="your-blog-title" href="blog?id=${blog.getId() }">${blog.getTitle() }</a>
				            <div class="blog-details">
				                <span id="sidebar-icon"><img src="./images/icons/schedule.png"></span>
				                <span>${blog.getCreationDate().toString().split(" ")[0]}</span>
				                <span id="sidebar-icon"><img src="./images/icons/clock.png"></span>
				                <span>5 phút đọc</span>
				            </div>
				        </div>
                  	</c:forEach> 
   
				
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