<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% if (session.getAttribute("name")==null) { response.sendRedirect("forum.jsp"); } %>
      <!DOCTYPE html>
      <html lang="en">

      <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Hồ sơ</title>
            <link rel="stylesheet" href="./css/forum-styles.css">
      </head>

      <body>
            <input type="hidden" id="status" value="<%= request.getAttribute("status") %>">

            <div id="forum">
                  <div id="sidebar">
                        <div id="profile-image" style="background-image: url(./images/default-img-profile.jpeg)">
                        </div>
                        <div id="profile-name">	                      
	                        	<%= session.getAttribute("name") == null ? "Chưa Login" : session.getAttribute("fullname") %>
	                    </div>
                        <div id="profile-description">Always learning, always innovating!</div>
                        <div id="social-icons">
                              <a href="https://github.com/" target="_blank" id="sidebar-icon"><img
                                          src="./images/icons/github.png"></a>
                              <a href="https://facebook.com/" target="_blank" id="sidebar-icon"><img
                                          src="./images/icons/fb.png"></a>
                        </div>
                        <a href="index.jsp" id="sidebar-items">
                              <span id="sidebar-icon"><img src="./images/icons/home.png"></span>
                              <span id="home-text">Trang chủ</span>
                        </a>
                        <a href="forum.jsp" id="sidebar-items">
                              <span id="sidebar-icon"><img src="./images/icons/forum.png"></span>
                              <span id="home-text">Diễn đàn</span>
                        </a>
                        <a href="profile.jsp" id="sidebar-items">
                              <span id="sidebar-icon"><img src="./images/icons/create-post.png"></span>
                              <span id="home-text" class="active-forum">Đăng bài</span>
                        </a>
                        
                  </div>
                  <div id="content" class="gap-profile-content">
                        <section class="create-blog-form">
                              	<button id="show-create-post"><img class="create-icon" src="./images/icons/create-post.png">Tạo bài viết</button>
                              
                              	<div id="overlay" onclick="closeCreatePost()"></div>
                             	 <div id="create-post">
                                   <div class="size-form">
                                   	 <img onClick="closeCreatePost()" src="./images/icons/close.png">
                                    <form method="POST" action="createBlogPost">
                                    	<h2>Create Post</h2>
                                    	<input type="text" name="title-blog" placeholder="Tiêu đề bài viết" required>
                                    	<textarea name="content" placeholder="Nội dung" required></textarea>
                                    	<button type="submit" name="submit-create-post">Post</button>
                                    </form>
                                   </div>
                              </div>
                        </section>
						
						<h2 class="collection-blog">Bài viết của bạn</h2>
						
                        <div class="your-blog-container">
                              <a class="your-blog-title">Hành trình học lập trình của tôi</a>
                              <span class="your-blog-time">13/10/2023</span>
                        </div>
                        <div class="your-blog-container">
                              <a class="your-blog-title">Hành trình học lập trình của tôi</a>
                              <span class="your-blog-time">13/10/2023</span>
                        </div>
                        <div class="your-blog-container">
                              <a class="your-blog-title">Hành trình học lập trình của tôi</a>
                              <span class="your-blog-time">13/10/2023</span>
                        </div>
                        <div class="your-blog-container">
                              <a class="your-blog-title">Hành trình học lập trình của tôi</a>
                              <span class="your-blog-time">13/10/2023</span>
                        </div>
                        <div class="your-blog-container">
                              <a class="your-blog-title">Hành trình học lập trình của tôi</a>
                              <span class="your-blog-time">13/10/2023</span>
                        </div>



                  </div>
                  <div id="right-sidebar">
                        aaaa
                  </div>
            </div>
            <script>
                  const createPostButton = document.getElementById('show-create-post');
                  const overlay = document.getElementById('overlay');
                  const createPostForm = document.getElementById('create-post');

                  createPostButton.addEventListener('click', () => {
                        overlay.style.display = 'block';
                        createPostForm.style.display = 'block';
                  });

                  function closeCreatePost() {
                        overlay.style.display = 'none';
                        createPostForm.style.display = 'none';
                  }

                  /* function submitPost() {
                        // Add your code to submit the post data to the server/database here
                        closeCreatePost();
                  } */
            </script>

      </body>

      </html>