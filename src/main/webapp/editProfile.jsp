<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<% if (session.getAttribute("name")==null) { response.sendRedirect(request.getContextPath() + "/forum" ); } %>

			<!DOCTYPE html>
			<html lang="en">

			<head>
					<%@include file="./views/common/meta.jsp" %>
					<title>Edit profile</title>
			</head>

			<body>

				<div id="forum">
				
					<%@include file="./views/common/leftSideBar.jsp" %>
					
					<%@include file="./views/components/content/editProfile.jsp" %>
						
					<%@include file="./views/common/rightSideBar.jsp" %>
				
				</div>
				
				<%@include file="./views/common/footer.jsp" %>

				<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

				<c:if test="${not empty status }">
					<c:set var="status" value="${status }" />
					<c:choose>
						<c:when test="${status eq 'warning email already' }">
							<c:set var="title" value="Sorry" />
							<c:set var="message" value="Email đã tồn tại" />
							<c:set var="alertType" value="warning" />
						</c:when>
						<c:when test="${status eq 'error wrong password' }">
							<c:set var="title" value="Sai mật khẩu" />
							<c:set var="message" value="Không thể xác nhận" />
							<c:set var="alertType" value="error" />
						</c:when>
						<c:when test="${status eq 'error get info' }">
							<c:set var="title" value="Error" />
							<c:set var="message" value="Có lỗi khi lấy thông tin người dùng" />
							<c:set var="alertType" value="error" />
						</c:when>
						<c:when test="${status eq 'error' }">
							<c:set var="title" value="Error" />
							<c:set var="message" value="Có lỗi đối với email" />
							<c:set var="alertType" value="error" />
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