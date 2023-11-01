<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<% if (session.getAttribute("name")==null) { response.sendRedirect(request.getContextPath() + "/forum" ); } %>

			<!DOCTYPE html>
			<html lang="en">

			<head>
				<%@include file="./views/common/meta.jsp" %>
				<title>Change password</title>
				<link rel="stylesheet" href="alert/dist/sweetalert.css">
			</head>

			<body>
				<input type="hidden" id="status" value="${status }">

				<div id="forum">
				
					<%@include file="./views/common/leftSideBar.jsp" %>
					
					<%@include file="./views/components/content/changePassword.jsp" %>
						
					<%@include file="./views/common/rightSideBar.jsp" %>
				
				</div>
				
				<%@include file="./views/common/footer.jsp" %>

				<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
				<c:if test="${not empty status }">
					<c:set var="status" value="${status }" />
					<c:choose>
						<c:when test="${status eq 'error wrong password' }">
							<c:set var="title" value="Sorry" />
							<c:set var="message" value="Bạn đã nhập sai mật khẩu hiện tại" />
							<c:set var="alertType" value="error" />
						</c:when>
						<c:when test="${status eq 'error wrong re-password' }">
							<c:set var="title" value="Oh no" />
							<c:set var="message" value="Mật khẩu mới không trùng khớp" />
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