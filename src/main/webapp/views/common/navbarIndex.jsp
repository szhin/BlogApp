<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

      <head>
            <link rel="stylesheet" href="./resources/css/navbar-styles.css">
      </head>

      <header class="header">
            <div class="container navbar">
                  <div>
                        <a class="brand" href="index"><small>A</small>B
                              <small> B</small>log
                              <span>We are one</span>
                        </a>
                  </div>
                  <nav>
                        <ul class="nav-items">
                              <li class="nav-item">
                                    <a class="nav-link" href="index">Trang chủ</a>
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