<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% if (session.getAttribute("name")!=null) { response.sendRedirect("forum.jsp"); } %>

	<!DOCTYPE html>
	<html lang="en">

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="ie=edge">
		<title>Đăng nhập</title>
		<link rel="stylesheet" href="alert/dist/sweetalert.css">
		<link rel="stylesheet" href="./css/general.css">
		<link rel="stylesheet" href="./css/main-styles.css">
		<link rel="stylesheet" href="./css/form-styles.css">
	</head>

	<body>

		<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">

		<header class="header">
			<div class="container navbar">
				<a class="brand" href="index.jsp"><small>A</small>B
					<small> B</small>log
					<span>We are one</span>
				</a>
				<nav>
					<ul class="nav-items">
						<li class="nav-item">
							<a class="nav-link" href="index.jsp">Trang chủ</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="forum.jsp">Diễn đàn</a>
						</li>
						<li class="nav-item">
							<a class="nav-link html-active" href="#">Đăng nhập</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="registration.jsp">Đăng kí</a>
						</li>
					</ul>
				</nav>
			</div>
		</header>
		<section class="section-hero" style="background-image: url(./images/background-login.jpeg);">
			<div class="overlay"></div>
			<div class="container hero">
				<!-- Sign in  Form -->
				<section class="login-form">
					<h2 class="form-title">Đăng nhập</h2>
					<form method="POST" action="login" id="login-form">
						<div class="form-group">
							<img src="./images/icons/email.png">
							<input type="email" name="email" id="email" placeholder="Your Email" required />
						</div>
						<div class="form-group">
							<img src="./images/icons/password.png">
							<input type="password" name="password" id="password" placeholder="Password" required />
						</div>
						<div class="form-group form-button">
							<input type="submit" name="signin" id="signin" class="form-submit" value="Login" />
						</div>
						<p>Don't have an account? <a href="registration.jsp" class="dispatcher">Sign up</a></p>
					</form>

				</section>
			</div>
		</section>

		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		
		<% String status = request.getParameter("status"); %>
			
		<% if (status != null && !status.isEmpty()) { %>
			    <script type="text/javascript">
			        var status = "<%= status %>";
			        
			        if (status == "error wrong info") {
			        	swal("Sorry", "Sai mật khẩu hoặc email", "error");
			        } else if (status === "registration success") {
			        	swal("Congrats", "Đăng kí tài khoản thành công", "success");
			        } else if (status == "success deleted user") {
						swal("Success", "Xoá tài khoản thành công", "success");
			        }
			    </script>
		<% } %>
			
		<%-- Remove the "status" query parameter from the URL --%>
		<script type="text/javascript">
			if ((window.location.search.indexOf('status=') > -1)) {
			 	window.history.replaceState({}, document.title, window.location.pathname);
			}
		</script>

		<script>
			document.addEventListener("DOMContentLoaded", function() {
			    var emailInput = document.getElementById("email");
			    emailInput.focus();
			});
		</script>
		
	</body>

	</html>