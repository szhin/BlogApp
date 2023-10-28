<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<% if (session.getAttribute("name")==null) { response.sendRedirect(request.getContextPath() + "/forum" ); } %>
			<!DOCTYPE html>
			<html lang="en">

			<head>
					<%@include file="./views/common/meta.jsp" %>
					<title>Hồ sơ</title>
					<link rel="stylesheet" href="alert/dist/sweetalert.css">
					<link rel="stylesheet" href="./resources/css/forum-styles.css">
			</head>

			<body>
				<input type="hidden" id="status" value="${status }">

				<div id="forum">
					
					<%@include file="./views/common/leftSideBar.jsp" %>
					
					<%@include file="./views/components/contentProfile.jsp" %>			

					<%@include file="./views/common/rightSideBar.jsp" %>
				
				</div>
				<script>
					const createPostButton = document.getElementById('show-create-post');
					const overlay = document.getElementById('overlay');
					const createPostForm = document.getElementById('create-post');

					createPostButton.addEventListener('click', () => {
						overlay.style.display = 'block';
						createPostForm.style.display = 'block';
					});

					function closeCreatePost() {
						overlay.style.display = 'none';
						createPostForm.style.display = 'none';
					}

				</script>
				<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
				<c:if test="${not empty status}">
					<c:set var="status" value="${status}" />
					<c:choose>
						<c:when test="${status eq 'success creating a post'}">
							<c:set var="title" value="Chúc mừng" />
							<c:set var="message" value="Tạo blog thành công" />
							<c:set var="alertType" value="success" />
						</c:when>
						<c:when test="${status eq 'error when create post'}">
							<c:set var="title" value="Cảnh báo" />
							<c:set var="message" value="Tạo blog không thành công" />
							<c:set var="alertType" value="warning" />
						</c:when>
						<c:when test="${status eq 'login success'}">
							<c:set var="title" value="Chúc mừng" />
							<c:set var="message" value="Đăng nhập thành công" />
							<c:set var="alertType" value="success" />
						</c:when>
						<c:when test="${status eq 'success edit blog'}">
							<c:set var="title" value="Chúc mừng" />
							<c:set var="message" value="Chỉnh sửa thành công" />
							<c:set var="alertType" value="success" />
						</c:when>
						<c:when test="${status eq 'success deleted blog'}">
							<c:set var="title" value="Chúc mừng" />
							<c:set var="message" value="Xoá blog thành công" />
							<c:set var="alertType" value="success" />
						</c:when>
						<c:when test="${status eq 'warning delete cancel'}">
							<c:set var="title" value="Chúc mừng" />
							<c:set var="message" value="Bạn đã quyết định không xoá blog" />
							<c:set var="alertType" value="warning" />
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