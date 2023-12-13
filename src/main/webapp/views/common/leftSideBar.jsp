<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<div id="sidebar">
			<div style="position: fixed; top: 50px;">
				<c:if test="${not empty sessionScope.name }">
					<div id="profile-image" style="background-image: url(./resources/images/default-img-profile.jpeg)"></div>
					<div id="profile-name">${fullname }</div>
					<div id="profile-description">Always learning, always <br>innovating!</div>
					<div id="social-icons">
						<a href="https://github.com/" target="_blank" id="sidebar-icon"><img
								src="./resources/images/icons/github.png"></a>
						<a href="https://facebook.com/" target="_blank" id="sidebar-icon"><img
								src="./resources/images/icons/fb.png"></a>
					</div>
				</c:if>

				<a href="<%= response.encodeURL(request.getContextPath() + "/index") %>" id="sidebar-items">
					<span id="sidebar-icon"><img src="./resources/images/icons/home.png"></span>
					<span id="home-text">Trang chủ</span>
				</a>
				<a href="<%= response.encodeURL(request.getContextPath() + "/forum") %>" id="sidebar-items">
					<span id="sidebar-icon"><img src="./resources/images/icons/forum.png"></span>
					<span id="home-text">Diễn đàn</span>
				</a>

				<c:choose>
					<c:when test="${empty sessionScope.name}">
						<a href="<%= response.encodeURL(request.getContextPath() + "/login.jsp") %>" id="sidebar-items">
							<span id="sidebar-icon"><img src="./resources/images/icons/login.png"></span>
							<span id="home-text">Đăng nhập</span>
						</a>
					</c:when>
					<c:otherwise>
						<a href="<%= response.encodeURL(request.getContextPath() + "/profile") %>" id="sidebar-items">
							<span id="sidebar-icon"><img src="./resources/images/icons/create-post.png"></span>
							<span id="home-text">Đăng bài</span>
						</a>

						<a href="<%= response.encodeURL(request.getContextPath() + "/setting.jsp") %>" id="sidebar-items">
							<span id="sidebar-icon"><img src="./resources/images/icons/setting.png"></span>
							<span id="home-text" class="sidebar-setting">Cài đặt</span>
						</a>
						<a href="<%= response.encodeURL(request.getContextPath() + "/logout") %>" id="sidebar-items">
							<span id="sidebar-icon"><img src="./resources/images/icons/logout.png"></span>
							<span id="home-text" style="color: rgb(82, 156, 170);">Đăng xuất</span>
						</a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>