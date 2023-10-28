<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% if (session.getAttribute("name")==null) { response.sendRedirect(request.getContextPath() + "/forum"); } %>
    
      <!DOCTYPE html>
      <html lang="en">

      <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Xoá blog</title>
            <link rel="stylesheet" href="./css/forum-styles.css">
      </head>

      <body>

            <div id="forum">
                  <div id="sidebar">
                        <div style="position: fixed; top: 50px;">
                        	<div id="profile-image" style="background-image: url(./images/default-img-profile.jpeg)"></div>
	                        <div id="profile-name">${fullname }</div>
	                        <div id="profile-description">Always learning, always <br>innovating!</div>
	                        <div id="social-icons">
	                              <a href="https://github.com/" target="_blank" id="sidebar-icon"><img
	                                          src="./images/icons/github.png"></a>
	                              <a href="https://facebook.com/" target="_blank" id="sidebar-icon"><img
	                                          src="./images/icons/fb.png"></a>
	                        </div>
	                        <a href="index" id="sidebar-items">
	                              <span id="sidebar-icon"><img src="./images/icons/home.png"></span>
	                              <span id="home-text">Trang chủ</span>
	                        </a>
	                        <a href="forum" id="sidebar-items">
	                              <span id="sidebar-icon"><img src="./images/icons/forum.png"></span>
	                              <span id="home-text">Diễn đàn</span>
	                        </a>
	                        
	             
	                        <a href="profile" id="sidebar-items">
	                              <span id="sidebar-icon"><img src="./images/icons/create-post.png"></span>
	                              <span id="home-text">Đăng bài</span>
	                        </a>
	                        
	                        <a href="setting.jsp" id="sidebar-items" style="position: fixed; bottom: 60px;">
	                              <span id="sidebar-icon"><img src="./images/icons/setting.png"></span>
	                              <span id="home-text" class="sidebar-setting">Cài đặt</span>
	                        </a>
                        </div>

                  </div>
                  <div id="content" class="content-confirm-delete">
                        <div class="deleteUser">
						    <p>Bạn có chắc chắn muốn xóa blog này không?</p>
						    <form action="deleteBlog" method="POST">
						        <input type="submit" name="delete" value="Có">
						        <input type="submit" name="cancel" value="Không">
						    </form>   
	                    </div>
                  </div>
                  <div id="right-sidebar">
                       <a href="index" class="brand" style="position: fixed; top: 50px;" href="#"><small>A</small>B
                              <small> B</small>log
                              <span>We are one</span>
                        </a>
                  </div>
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