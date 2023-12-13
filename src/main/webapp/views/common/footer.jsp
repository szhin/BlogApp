<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<head>
		<link rel="stylesheet" href="./resources/css/footer-styles.css">
	</head>

	<footer id="footer">
		<div class="left">
			<a class="brand" href="<%= response.encodeURL(request.getContextPath() + "/index") %>">
				<small>A</small>B
				<small> B</small>log
				<span>We are one</span>
			</a>
			<p>Tại AB Blog, bạn có thể đọc và đăng tải bài viết<br>của mình, chia sẻ nó tới với tất cả mọi người<br>đừng
				ngần ngại mà hãy sống thật với chính mình.</p>
		</div>
		<div class="column">
			<h4>Public Link</h4>
			<div class="items">
				<a href="<%= response.encodeURL(request.getContextPath() + "/index") %>">Trang chủ</a>
				<a href="<%= response.encodeURL(request.getContextPath() + "/forum") %>">Diễn đàn</a>
				<a href="<%= response.encodeURL(request.getContextPath() + "/login.jsp") %>">Đăng nhập</a>
				<a href="<%= response.encodeURL(request.getContextPath() + "/registration.jsp") %>">Đăng kí</a>
			</div>
		</div>
		<div class="column">
			<h4>Private Link</h4>
			<div class="items">
				<a href="<%= response.encodeURL(request.getContextPath() + "/profile") %>">Hồ sơ</a>
				<a href="<%= response.encodeURL(request.getContextPath() + "/profile") %>">Đăng bài</a>
				<a href="<%= response.encodeURL(request.getContextPath() + "/setting.jsp") %>">Cài đặt</a>
				<a href="<%= response.encodeURL(request.getContextPath() + "/editProfile.jsp") %>">Chỉnh sửa</a>
			</div>
		</div>
		<div class="column">
			<h4>Connect us</h4>
			<div class="items">
				<a href="https://www.facebook.com/">Facebook</a>
				<a href="https://www.instagram.com/">Instagram</a>
				<a href="https://twitter.com/">Twitter</a>
				<a href="https://www.threads.net/">Threads</a>
			</div>
		</div>
	</footer>

	<div class="license">
		<p>Design and Developed by BangAnh</p>
	</div>