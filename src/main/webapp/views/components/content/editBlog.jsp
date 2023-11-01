<!-- Content -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	
	<head>
		<link rel="stylesheet" href="./resources/css/forum-styles.css">
	</head>
	
	<div id="content" class="gap-profile-content edit-blog">
		<section class="edit-blog-form">
			<div id="edit-post">
				<div class="size-form">
					<form method="POST" action="editBlog">
						<h2>Chỉnh sửa bài viết</h2>
						<input type="text" name="title-blog" value="${blogTitle }" required>
						<textarea name="content" required>${blogContent }</textarea>
						<div style="display: flex; gap: 2rem; align-items: center;">
							<button type="submit" name="editBlogController" style="width: 55rem; margin-top: 0;">Chỉnh
								sửa</button>
							<a href="deleteBlog.jsp" style="color: red;">Xoá blog này</a>
						</div>
					</form>
				</div>

			</div>
		</section>
	</div>