<!-- Content -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		
		<head>
			<link rel="stylesheet" href="./resources/css/forum-styles.css">
		</head>
		
		<div id="content" class="gap-forum-content">

			<c:forEach items="${blogList }" var="blog">
				<div class="blog-container">
					<a class="blog-category" href="entertain.jsp" style="background-color: #176B87; color: #fff;">Giải
						trí</a>
					<a class="your-blog-title" href="blog?id=${blog.getId() }">${blog.getTitle() }</a>
					<div class="blog-details">
						<span id="sidebar-icon"><img src="./resources/images/icons/schedule.png"></span>
						<span>${blog.getCreationDate().toString().split(" ")[0]}</span>
						<span id="sidebar-icon"><img src="./resources/images/icons/clock.png"></span>
						<span>5 phút đọc</span>
					</div>
				</div>
			</c:forEach>
		</div>