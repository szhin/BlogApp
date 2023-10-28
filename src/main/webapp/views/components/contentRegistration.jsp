<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<section class="section-hero" style="background-image: url(./resources/images/background-login.jpeg);">
		<div class="overlay"></div>
		<div class="container hero">
			<!-- Sign in  Form -->
			<section class="login-form">
				<h2 class="form-title">Đăng kí</h2>
				<form method="POST" action="register" id="register-form">
					<div class="form-group">
						<img src="./resources/images/icons/user.png">
						<input type="text" name="name" id="name" placeholder="Your full name" required />
					</div>
					<div class="form-group">
						<img src="./resources/images/icons/email.png">
						<input type="email" name="email" id="email" placeholder="Your Email" required />
					</div>
					<div class="form-group">
						<img src="./resources/images/icons/password.png">
						<input type="password" name="pass" id="pass" placeholder="Password" required />
					</div>
					<div class="form-group">
						<img src="./resources/images/icons/re-password.png">
						<input type="password" name="re_pass" id="re_pass" placeholder="Re-password" required />
					</div>
					<div class="form-group">
						<img src="./resources/images/icons/phone.png">
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