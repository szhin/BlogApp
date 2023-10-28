<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<div id="content" class="gap-profile-content">
		<div id="blog-content">
			<div class="setting">
				<h1 style="margin-bottom: 20px;">Thông tin tài khoản</h1>
				<div class="setting-info">
					<p>Họ và tên: <span>${fullname }</span>
					</p>
					<p>Email: <span>${userEmail }</span>
					</p>
					<p>Mật khẩu: <span>************</span></p>
					<p>Số điện thoại: <span>${userPhone }</span>
					</p>

				</div>
				<a class="edit" href="editProfile.jsp">Sửa thông tin</a>

				<a class="delete" href="confirmDelete.jsp" style="color: red;">Xóa tài khoản</a>
			</div>
		</div>
	</div>