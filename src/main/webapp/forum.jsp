<%@page import="com.general.DatabaseUtil"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
                   
                   						
<% 

	try (Connection connection = DatabaseUtil.getConnection()) {
		
	    int userId = (int) request.getSession().getAttribute("userId");
	
	    String selectBlogQuery = "SELECT * FROM blog_posts ORDER BY id DESC";
	    
	    PreparedStatement selectStatement = connection.prepareStatement(selectBlogQuery);
		
	    ResultSet rs = selectStatement.executeQuery();
	    
	   	while (rs.next()) {
	   		int blogId = rs.getInt("id");
	      	String title = rs.getString("title");
	      	String fullDateTime = rs.getString("creation_date");
			String dateOnly = fullDateTime.split(" ")[0]; // Tách lấy phần ngày
%>
			<div class="blog-container">
                              <a class="blog-category" href="entertain.jsp"
                                    style="background-color: #176B87; color: #fff;">Giải trí</a>
                              <a class="your-blog-title" href="blog?id=<%=blogId %>"><%=title %></a>
                              <div class="blog-details">
                                    <span id="sidebar-icon"><img src="./images/icons/schedule.png"></span>
                                    <span><%=dateOnly %></span>
                                    <span id="sidebar-icon"><img src="./images/icons/clock.png"></span>
                                    <span>5 phút đọc</span>
                              </div>
                        </div>
<% 			
			
	   	}
	    
    	rs.close();
   	 	selectStatement.close();
   	 	connection.close();
	} catch (SQLException e) {
    	e.printStackTrace();
	}
%>
                        

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