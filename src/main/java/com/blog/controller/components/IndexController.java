package com.blog.controller.components;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Servlet implementation class IndexController
 */
@WebServlet(name="index", value="/index")
public class IndexController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String name=(String) session.getAttribute("name"); 
		
		String loginLink= (name==null)? "login.jsp" : request.getContextPath() + "/profile"; 
		String loginText=(name==null) ? "Đăng nhập" : "Hồ sơ";
        String registerLink=(name==null) ? "registration.jsp" : "logout"; 
        String registerText=(name==null) ? "Đăng ký" : "Đăng xuất" ;
        String loginName=(name==null) ? "" : name ;
        String imagePath = request.getContextPath() + "/resources/images/index-1.jpeg";
        String imageHeroPath = request.getContextPath() + "/resources/images/background-index.jpeg";

        request.setAttribute("loginLink", loginLink);
        request.setAttribute("loginText", loginText);
        request.setAttribute("registerLink", registerLink);
        request.setAttribute("registerText", registerText);
        request.setAttribute("loginName", loginName);
        request.setAttribute("imagePath", imagePath);
        request.setAttribute("imageHeroPath", imageHeroPath);
        
        request.getRequestDispatcher("index.jsp").forward(request, response);
	}


}
