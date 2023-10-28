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

				<a href="index" id="sidebar-items">
					<span id="sidebar-icon"><img src="./resources/images/icons/home.png"></span>
					<span id="home-text">Trang chủ</span>
				</a>
				<a href="forum" id="sidebar-items">
					<span id="sidebar-icon"><img src="./resources/images/icons/forum.png"></span>
					<span id="home-text">Diễn đàn</span>
				</a>

				<c:choose>
					<c:when test="${empty sessionScope.name}">
						<a href="login.jsp" id="sidebar-items">
							<span id="sidebar-icon"><img src="./resources/images/icons/login.png"></span>
							<span id="home-text">Đăng nhập</span>
						</a>
					</c:when>
					<c:otherwise>
						<a href="profile" id="sidebar-items">
							<span id="sidebar-icon"><img src="./resources/images/icons/create-post.png"></span>
							<span id="home-text">Đăng bài</span>
						</a>
						<c:if test="${not empty sessionScope.name}">
							<a href="setting.jsp" id="sidebar-items" style="position: fixed; bottom: 60px;">
								<span id="sidebar-icon"><img src="./resources/images/icons/setting.png"></span>
								<span id="home-text" class="sidebar-setting">Cài đặt</span>
							</a>
						</c:if>
					</c:otherwise>
				</c:choose>
			</div>
		</div>