<!-- Content -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	
	<head>
	
		<link rel="stylesheet" href="./resources/css/forum-styles.css">
			
	</head>

	<div id="content" class="gap-profile-content">
		<div id="blog-content">
			<div class="blog-container">
				<a class="blog-title" style="font-size: 4.5rem; line-height: 6rem; margin-bottom: 1.5rem;">
					<%= request.getAttribute("blogTitle") %>
				</a>
				<div class="blog-creator">
					<span id="sidebar-icon"><img src="./resources/images/icons/author.png"></span>
					<span>${blogCreator }</span>
				</div>
				<div class="blog-details" style="margin-bottom: 2rem;">
					<span id="sidebar-icon"><img src="./resources/images/icons/schedule.png"></span>
					<span>${blogTime }</span>
					<span id="sidebar-icon"><img src="./resources/images/icons/clock.png"></span>
					<span>6 phút đọc</span>

				</div>
				<div class="blog-content">
					<p class="content">${blogContent }</p>
				</div>
			</div>
		</div>
	</div>