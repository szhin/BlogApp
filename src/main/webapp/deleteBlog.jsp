<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<% if (session.getAttribute("name")==null) { response.sendRedirect(request.getContextPath() + "/forum" ); } %>

			<!DOCTYPE html>
			<html lang="en">

			<head>
				<%@include file="./views/common/meta.jsp" %>		
				<title>Xoá blog</title>
				<link rel="stylesheet" href="./resources/css/forum-styles.css">
			</head>

			<body>

				<div id="forum">
					
					<%@include file="./views/common/leftSideBar.jsp" %>
								
					<%@include file="./views/components/contentDeleteBlog.jsp" %>
			
					<%@include file="./views/common/rightSideBar.jsp" %>
				
				</div>
				
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