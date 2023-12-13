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
		
		String loginLink= (name==null)? response.encodeURL(request.getContextPath() + "/login.jsp") : response.encodeURL(request.getContextPath() + "/profile"); 
		String loginText=(name==null) ? "Đăng nhập" : "Hồ sơ";
        String registerLink=(name==null) ? response.encodeURL(request.getContextPath() + "/registration.jsp") : response.encodeURL(request.getContextPath() + "/logout"); 
        String registerText=(name==null) ? "Đăng ký" : "Đăng xuất" ;
        String loginName=(name==null) ? "" : name ;

        session.setAttribute("loginLink", loginLink);
        session.setAttribute("loginText", loginText);
        session.setAttribute("registerLink", registerLink);
        session.setAttribute("registerText", registerText);
        session.setAttribute("loginName", loginName);
        
//        request.getRequestDispatcher("index.jsp").forward(request, response);
        response.sendRedirect(response.encodeURL(request.getContextPath() + "/index.jsp"));
	}


}
