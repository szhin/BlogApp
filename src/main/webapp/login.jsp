<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% if (session.getAttribute("name")!=null) { response.sendRedirect("forum"); } %>

	<!DOCTYPE html>
	<html lang="en">

	<head>
		<%@include file="./views/common/meta.jsp" %>
		<title>Đăng nhập</title>
		<link rel="stylesheet" href="alert/dist/sweetalert.css">
	</head>

	<body>

		<input type="hidden" id="status" value="${status }">

		<%@include file="./views/common/navbar.jsp" %>
		
		<%@include file="./views/components/content/login.jsp" %>

		<%@include file="./views/common/footer.jsp" %>
		
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<c:if test="${not empty status}">
			    <c:set var="status" value="${status}" />
			    <c:choose>
			        <c:when test="${status eq 'error wrong info'}">
			        	<c:set var="title" value="Sorry" />
			            <c:set var="message" value="Sai mật khẩu hoặc email" />
			            <c:set var="alertType" value="error" />
			        </c:when>
			        <c:when test="${status eq 'registration success'}">
			        	<c:set var="title" value="Chúc mừng" />
			            <c:set var="message" value="Đăng kí tài khoản thành công" />
			            <c:set var="alertType" value="success" />
			        </c:when>
			        <c:when test="${status eq 'success deleted user'}">
			        	<c:set var="title" value="Chúc mừng" />
			            <c:set var="message" value="Xoá tài khoản thành công" />
			            <c:set var="alertType" value="success" />
			        </c:when>
			        <c:when test="${status eq 'success logout'}">
			        <c:set var="title" value="Chúc mừng" />
			            <c:set var="message" value="Đăng xuất thành công" />
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

		<script>
			document.addEventListener("DOMContentLoaded", function() {
			    var emailInput = document.getElementById("email");
			    emailInput.focus();
			});
		</script>
		
	</body>

	</html>