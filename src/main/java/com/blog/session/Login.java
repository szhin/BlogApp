package com.blog.session;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.blog.service.UserService;

@WebServlet(name = "login", value="/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String uemail = request.getParameter("email");
		String upw = request.getParameter("password");

		HttpSession session = request.getSession();
		session.setAttribute("pageTitle", "Đăng nhập");

		UserService userService = new UserService();
			
		if (userService.login(uemail, upw)) {
			
			int userId = userService.getIdUserLogin();
			session.setAttribute("userId", userId);
			
			String fullname = userService.getUnameLogin();
			
			session.setAttribute("fullname", fullname);
			session.setAttribute("userEmail", userService.getUemailLogin());
			session.setAttribute("userPhone", userService.getUphoneLogin());
			session.setAttribute("userPassword", userService.getUpasswordLogin());
			session.setAttribute("name", fullname.substring(fullname.lastIndexOf(" ") + 1));		
			session.setAttribute("status", "login success");
			System.out.println("status login: " + session.getAttribute("status"));

			response.sendRedirect(request.getContextPath() + "/profile");
			
		} else {
			session.setAttribute("status", "error wrong info");
			System.out.println("status login: " + session.getAttribute("status"));
			response.sendRedirect(request.getContextPath() + "/login.jsp");
		}

	}

}
