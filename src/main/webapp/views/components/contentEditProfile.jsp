<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<div id="content" class="gap-profile-content">
		<div id="blog-content">
			<section class="edit-profile">
				<h1 style="margin-bottom: 2rem;">Sửa thông tin</h1>
				<form method="POST" action="editProfile" id="editProfile-form">
					<div class="form-group">
						<p class="form-item">Họ và tên</p>
						<input type="text" name="name" id="name" value="${fullname }" required />
					</div>
					<div class="form-group">
						<p class="form-item">Email</p>
						<input type="email" name="email" id="email" value="${userEmail }" required />
					</div>
					<div class="form-group">
						<p class="form-item">Số điện thoại</p>
						<input type="text" name="contact" id="contact" value="${userPhone }" required />
					</div>

					<div class="form-group">
						<p class="form-item confirm">Nhập mật khẩu để xác nhận</p>
						<input type="password" name="password" id="password" placeholder="Mật khẩu của bạn" required />
					</div>

					<div class="form-group form-button">
						<input type="submit" name="editProfile" id="editProfile" class="form-submit"
							value="Xác nhận chỉnh sửa" />
					</div>
				</form>
				<a href="changePassword.jsp" class="change-password">Thay đổi mật khẩu</a>
			</section>
		</div>
	</div>