<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

      <!DOCTYPE html>
      <html lang="en">

      <head>
           	<%@include file="./views/common/meta.jsp" %>
            <title>AnhBang Blog</title>
            <link rel="stylesheet" href="./resources/css/general.css">
            <link rel="stylesheet" href="./resources/css/main-styles.css">
      </head>

      <body>

            <%@include file="./views/components/indexNavbar.jsp" %>
            
            <%@include file="./views/components/contentIndex.jsp" %>

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