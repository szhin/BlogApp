<!-- Content -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<head>
		<link rel="stylesheet" href="./resources/css/general.css">
		<link rel="stylesheet" href="./resources/css/form-styles.css">
	</head>
	<section class="section-hero" style="background-image: url(./resources/images/background-login.jpeg);">
		<div class="overlay"></div>
		<div class="container hero">
			<!-- Sign in  Form -->
			<section class="login-form">
				<h2 class="form-title">Đăng nhập</h2>
				<form method="POST" action="login" id="login-form">
					<div class="form-group">
						<img src="./resources/images/icons/email.png">
						<input type="email" name="email" id="email" placeholder="Your Email" required />
					</div>
					<div class="form-group">
						<img src="./resources/images/icons/password.png">
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