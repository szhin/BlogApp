<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<div id="content" class="gap-profile-content">
		<div id="blog-content">
			<section class="edit-profile">
				<h1 style="margin-bottom: 2rem;">Thay đổi mật khẩu</h1>
				<form method="POST" action="changePassword" id="changePassword-form">
					<div class="form-group">
						<p class="form-item">Nhập mật khẩu cũ</p>
						<input type="password" name="password" id="password" placeholder="Password" required />
					</div>
					<div class="form-group">
						<p class="form-item">Nhập mật khẩu mới</p>
						<input type="password" name="new-password" id="password" placeholder="New password" required />
					</div>
					<div class="form-group">
						<p class="form-item">Xác nhận mật khẩu mới</p>
						<input type="password" name="renew-password" id="password" placeholder="Re-new Password" required />
					</div>
					<div class="form-group form-button">
						<input type="submit" name="changePassword" id="changePassword" class="form-submit"
							value="Xác nhận chỉnh sửa" />
					</div>
				</form>
				<a href="editProfile.jsp" class="back-editProfile">Chỉnh sửa thông tin khác</a>
			</section>
		</div>
	</div>