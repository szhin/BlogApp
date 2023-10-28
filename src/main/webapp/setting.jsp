<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% if (session.getAttribute("name")==null) { response.sendRedirect("profile.jsp"); } %>

			<!DOCTYPE html>
			<html lang="en">

			<head>
					<%@include file="./views/common/meta.jsp" %>
					<title>Cài đặt</title>
					<link rel="stylesheet" href="alert/dist/sweetalert.css">
					<link rel="stylesheet" href="./resources/css/forum-styles.css">
					<link rel="stylesheet" href="./resources/css/setting.css">
			</head>

			<body>
				<input type="hidden" id="status" value="${status }">

				<div id="forum">
					<%@include file="./views/common/leftSideBar.jsp" %>

					<%@include file="./views/components/contentSetting.jsp" %>
						
					<%@include file="./views/common/rightSideBar.jsp" %>
				
				</div>

				<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
				<c:if test="${not empty status}">
					<c:set var="status" value="${status}" />
					<c:choose>
						<c:when test="${status eq 'warning delete cancel'}">
							<c:set var="title" value="Oh yeah" />
							<c:set var="message" value="Thật tuyệt khi bạn không xoá tài khoản" />
							<c:set var="alertType" value="warning" />
						</c:when>
						<c:when test="${status eq 'success edit info'}">
							<c:set var="title" value="Success" />
							<c:set var="message" value="Chỉnh sửa thông tin thành công" />
							<c:set var="alertType" value="success" />
						</c:when>
						<c:when test="${status eq 'success change password'}">
							<c:set var="title" value="Success" />
							<c:set var="message" value="Thay đổi mật khẩu thành công" />
							<c:set var="alertType" value="success" />
						</c:when>

					</c:choose>

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