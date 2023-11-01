<!-- Content -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	
	<head>		
		<link rel="stylesheet" href="./resources/css/confirm-delete.css">
		<link rel="stylesheet" href="./resources/css/forum-styles.css">
	</head>
	<div id="content" class="content-confirm-delete">
		<div class="deleteUser">
			<p>Bạn có chắc chắn muốn xóa blog này không?</p>
			<form action="deleteBlog" method="POST">
				<input type="submit" name="delete" value="Có">
				<input type="submit" name="cancel" value="Không">
			</form>
		</div>
	</div>