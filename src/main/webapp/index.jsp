<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <% if (session.getAttribute("name")==null) { response.sendRedirect("login.jsp"); } %> --%>

      <!DOCTYPE html>
      <html lang="en">

      <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>AnhBang Blog</title>
            <link rel="stylesheet" href="./css/general.css">
            <link rel="stylesheet" href="./css/main-styles.css">

      </head>

      <body>
            <header class="header">
                  <div class="container navbar">
                        <a class="brand" href="#"><small>A</small>B
                              <small> B</small>log
                              <span>We are one</span>
                        </a>
                        <nav>
                              <ul class="nav-items">
                                    <li class="nav-item">
                                          <a class="nav-link html-active" href="#">Trang chủ</a>
                                    </li>
                                    <li class="nav-item">
                                          <a class="nav-link" href="forum.jsp">Diễn đàn</a>
                                    </li>
                                    <li class="nav-item">
                                          <a class="nav-link" href="<%= session.getAttribute("name")==null
                                                ? "login.jsp" : "profile.jsp" %>">
                                                <%= session.getAttribute("name")==null ? "Đăng nhập" :
                                                      "Hồ sơ" %>
                                          </a>
                                    </li>
                                    <li class="nav-item">
                                          <a class="nav-link" href="logout">
                                                <%= session.getAttribute("name")==null ? "" : "Đăng xuất" %>
                                          </a>
                                    </li>
                              </ul>
                        </nav>
                  </div>
            </header>
            <section class="index-hero section-hero" style="background-image: url(./images/background-index.jpeg);">
                  <div class="overlay"></div>
                  <div class="container hero">
                        <h1 class="heading-primary">
                              Xin chào <%= session.getAttribute("name")==null ? "" :
                                    session.getAttribute("name") %>
                        </h1>
                  </div>
            </section>
            <section class="section-1">
                  <div class="container welcome">
                        <div class="welcome-left">
                              <img class="welcome-img" src="./images/index-1.jpeg" alt="Image Index">
                        </div>
                        <div class="welcome-right">
                              <span class="subheading">Lời mở đầu</span>
                              <h2 class="heading-secondary">
                                    Xin chào
                              </h2>
                              <p class="welcome-description">
                                    AB Blog là một nơi tuyệt vời để bạn chia sẻ những suy nghĩ, trải nghiệm và kiến thức
                                    của mình với cộng đồng. Tận hưởng sự sáng tạo và kết nối với những người khác bằng
                                    cách tạo tài khoản và đăng nhập, sau đó thể hiện chính mình thông qua các bài viết
                                    thú vị.
                              </p>
                              <p class="welcome-description">
                                    Tại diễn đàn, bạn có thể đọc và đăng tải bài viết của mình, chia sẻ nó tới với
                                     tất cả mọi người. Đừng ngần ngại mà hãy sống thật với chính mình.
                                 	
                              </p>
                        </div>
                  </div>
            </section>

            <section class="section-2 hero-wrap" style="background-image: url(./images/background-index.jpeg);">
                  <div class="overlay"></div>
                  <div class="container">
                        <span class="subheading">Choose us</span>
                        <h2 class="heading-secondary">
                              eeee
                        </h2>
                        <div class="col-3">
                              <div class="item">
                                    <a href="" class="img-item"
                                          style="background-image: url(./images/background-index.jpeg);">
                                          <span>Series 1</span>
                                    </a>
                                    <div class="item-description">
                                          <h3>dddd</h3>
                                          <p class="description">
                                                kkkk
                                          </p>
                                    </div>
                              </div>
                              <div class="item">
                                    <a href="" class="img-item"
                                          style="background-image: url(./images/background-index.jpeg);">
                                          <span>Series 2</span>
                                    </a>
                                    <div class="item-description">
                                          <h3>kkkk</h3>
                                          <p class="description">
                                                Lorem ipsum dolor, sit amet consectetur adipisicing elit. Veniam,
                                                repellendus.
                                                lit. Veniam,
                                                repellendus.
                                          </p>
                                    </div>
                              </div>
                              <div class="item">
                                    <a href="" class="img-item"
                                          style="background-image: url(./images/background-index.jpeg);">
                                          <span>Series 3</span>
                                    </a>
                                    <div class="item-description">
                                          <h3>kkkk</h3>
                                          <p class="description">
                                                Lorem ipsum dolor, sit amet consectetur adipisicing elit. Veniam,
                                                repellendus.
                                                lit. Veniam,
                                                repellendus.
                                          </p>
                                    </div>
                              </div>
                        </div>
                        <div class="progress">
                              <div class="progress-wrap">
                                    <div class="progress-bar">
                                    </div>
                              </div>
                        </div>


                  </div>
            </section>
      </body>

      </html>