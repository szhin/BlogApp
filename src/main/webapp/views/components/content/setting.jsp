<!-- Content -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<head>
		<link rel="stylesheet" href="./resources/css/forum-styles.css">
		<link rel="stylesheet" href="./resources/css/setting.css">
	</head>
	
	<div id="content" class="gap-profile-content">
		<div id="blog-content">
			<div class="setting">
				<h1 style="margin-bottom: 20px;">Thông tin tài khoản</h1>
				<div class="setting-info">
					<p>Họ và tên: <span>${fullname }</span>
					</p>
					<p>Email: <span>${userEmail }</span>
					</p>
					<p>Mật khẩu: <span>************</span></p>
					<p>Số điện thoại: <span>${userPhone }</span>
					</p>

				</div>
				<a class="edit" href="<%= response.encodeURL(request.getContextPath() + "/editProfile.jsp") %>">Sửa thông tin</a>

				<a class="delete" href="<%= response.encodeURL(request.getContextPath() + "/confirmDelete.jsp") %>" style="color: red;">Xóa tài khoản</a>
			</div>
		</div>
	</div>