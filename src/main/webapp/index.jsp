<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                        <div>
                              <a class="brand" href="#"><small>A</small>B
                                    <small> B</small>log
                                    <span>We are one</span>
                              </a>
                        </div>
                      
                              <nav>
                                    <ul class="nav-items">
                                          <li class="nav-item">
                                                <a class="nav-link" href="#">Trang chủ</a>
                                          </li>
                                          <li class="nav-item">
                                                <a class="nav-link" href="forum">Diễn đàn</a>
                                          </li>

                                          <li class="nav-item">
                                                <a class="nav-link" href="${loginLink }">
                                                      ${loginText }
                                                </a>
                                          </li>
                                          <li class="nav-item">
                                                <a class="nav-link" href="${registerLink }">
                                                      ${registerText }
                                                </a>
                                          </li>
                                    </ul>
                              </nav>
                  </div>
            </header>

            <section class="index-hero section-hero" style="background-image: url(./images/background-index.jpeg);">
                  <div class="container hero">
                        <h1 class="heading-primary">
                              Xin chào ${loginName }
                        </h1>
                  </div>
                  <div class="overlay"></div>
            </section>
            
            <section class="section-1">
                  <div class="container welcome">
                        <div class="welcome-left">
                              <img class="welcome-img" src="${imagePath }" alt="Image Index">
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