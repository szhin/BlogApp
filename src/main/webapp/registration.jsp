<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% if (session.getAttribute("name")!=null) { response.sendRedirect("forum"); } %>

	<!DOCTYPE html>
	<html lang="en">

	<head>
		<%@include file="./views/common/meta.jsp" %>
		<title>Đăng kí</title>
		<link rel="stylesheet" href="alert/dist/sweetalert.css">
	</head>

	<body>

		<input type="hidden" id="status" value="${status }">

		<%@include file="./views/common/navbar.jsp" %>
		
		<%@include file="./views/components/content/registration.jsp" %>
		
		<%@include file="./views/common/footer.jsp" %>
		
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		
		<c:if test="${not empty status}">
			    <c:set var="status" value="${status}" />
			    <c:choose>
			        <c:when test="${status eq 'warning email already'}">
			        	<c:set var="title" value="Lỗi email" />
			            <c:set var="message" value="Email đã tồn tại" />
			            <c:set var="alertType" value="warning" />
			        </c:when>
			        <c:when test="${status eq 'error wrong repass'}">
			        	<c:set var="title" value="Oh no!" />
			            <c:set var="message" value="Nhập mật khẩu không trùng khớp" />
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

		<script>
			document.addEventListener("DOMContentLoaded", function() {
			    var emailInput = document.getElementById("name");
			    emailInput.focus();
			});
		</script>
	</body>

	</html>