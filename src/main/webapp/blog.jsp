<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<!DOCTYPE html>
		<html lang="en">

		<head>
			<%@include file="./views/common/meta.jsp" %>
			<title>Blog</title>
			<link rel="stylesheet" href="alert/dist/sweetalert.css">
		</head>

		<body>

			<div id="forum">

				<%@include file="./views/common/leftSideBar.jsp" %>

				<%@include file="./views/components/content/blog.jsp" %>
			
				<%@include file="./views/common/rightSideBar.jsp" %>
			
			</div>
			
			<%@include file="./views/common/footer.jsp" %>
			
			<c:if test="${not empty status }">
				<c:set var="status" value="${status }" />
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