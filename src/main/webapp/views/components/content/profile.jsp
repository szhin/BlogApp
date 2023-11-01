<!-- Content -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		
		<head>
			<link rel="stylesheet" href="./resources/css/forum-styles.css">
		</head>

		<div id="content" class="gap-profile-content">
			<section class="create-blog-form">
				<button id="show-create-post"><img class="create-icon" src="./resources/images/icons/create-post.png">Tạo
					bài viết</button>
				<div id="overlay" onclick="closeCreatePost()"></div>
				<div id="create-post">
					<div class="size-form">
						<img onClick="closeCreatePost()" src="./resources/images/icons/close.png">
						<form method="POST" action="createBlogPost">
							<h2>Tạo bài viết</h2>
							<input type="text" name="title-blog" placeholder="Tiêu đề bài viết" required>
							<textarea name="content" placeholder="Nội dung" required></textarea>
							<button type="submit" name="submit-create-post">Post</button>
						</form>
					</div>
				</div>
			</section>

			<c:choose>
				<c:when test="${isHaveBlog}">
					<h2 class="collection-blog">Bài viết của bạn</h2>
					<c:forEach items="${blogList}" var="blog">
						<c:set var="fullDateTime" value="${blog.getCreationDate().toString()}" />
						<c:set var="dateOnly" value="${fullDateTime.split(' ')[0]}" />

						<div class="your-blog-container">
							<a class="your-blog-title" href="blog?id=${blog.id}">${blog.title}</a>
							<span class="your-blog-time">${dateOnly}</span>
							<div class="icon-dispatcher">
								<a class="edit-icon" href="editBlog?id=${blog.id}">
									<span style="font-size: 12px;">Sửa</span>
									<img src="./resources/images/icons/edit.png">
								</a>
							</div>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<h2 class="collection-blog">Bạn chưa tạo bài viết nào</h2>
				</c:otherwise>
			</c:choose>


		</div>