<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% if (session.getAttribute("name")!=null) { response.sendRedirect("forum.jsp"); } %>

	<!DOCTYPE html>
	<html lang="en">

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="ie=edge">
		<title>Đăng kí</title>
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
							<a class="nav-link" href="login.jsp">Đăng nhập</a>
						</li>
						<li class="nav-item">
							<a class="nav-link html-active" href="#">Đăng kí</a>
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
					<h2 class="form-title">Đăng kí</h2>
					<form method="POST" action="register" id="register-form">
						<div class="form-group">
							<img src="./images/icons/user.png">
							<input type="text" name="name" id="name" placeholder="Your full name" required />
						</div>
						<div class="form-group">
							<img src="./images/icons/email.png">
							<input type="email" name="email" id="email" placeholder="Your Email" required />
						</div>
						<div class="form-group">
							<img src="./images/icons/password.png">
							<input type="password" name="pass" id="pass" placeholder="Password" required />
						</div>
						<div class="form-group">
							<img src="./images/icons/re-password.png">
							<input type="password" name="re_pass" id="re_pass" placeholder="Re-password" required />
						</div>
						<div class="form-group">
							<img src="./images/icons/phone.png">
							<input type="text" name="contact" id="contact" placeholder="Phone" required />
						</div>
						<div class="form-group form-button">
							<input type="submit" name="signup" id="signup" class="form-submit" value="Register" />
						</div>
						
						<p>Already have a account? <a href="login.jsp" class="dispatcher">Login here</a></p>
					</form>

				</section>
			</div>
		</section>
		
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		
		<% String status = request.getParameter("status"); %>
		
		<% if (status != null && !status.isEmpty()) { %>
			    <script type="text/javascript">
			        var status = "<%= status %>";
			        if (status === "warning email already") {
			            swal("Sorry", "Email already exists", "warning");
			        } else if (status === "error wrong repass") {
			            swal("Oh no!", "The password when re-entered is incorrect", "error");
			        }
			    </script>
		<% } %>
		
		<%-- Remove the "status" query parameter from the URL --%>
			<script type="text/javascript">
			    if (window.location.search.indexOf('status=') > -1) {
			        window.history.replaceState({}, document.title, window.location.pathname);
			    }
			</script>

		<script>
			document.addEventListener("DOMContentLoaded", function() {
			    var emailInput = document.getElementById("name");
			    emailInput.focus();
			});
		</script>
	</body>

	</html>