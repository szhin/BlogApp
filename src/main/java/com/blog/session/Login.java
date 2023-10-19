package com.blog.session;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.blog.service.UserService;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String uemail = request.getParameter("email");
		String upw = request.getParameter("password");
		
		HttpSession session = request.getSession();

		RequestDispatcher dispatcher = null;
		
		UserService userService = new UserService();
			
		if (userService.login(uemail, upw)) {
			
			dispatcher = request.getRequestDispatcher("profile.jsp");
			
			int userId = userService.getIdUserLogin();
			session.setAttribute("userId", userId);
			
			String fullname = userService.getUnameLogin();
			
			session.setAttribute("fullname", fullname);
			session.setAttribute("userEmail", userService.getUemailLogin());
			session.setAttribute("userPhone", userService.getUphoneLogin());
			session.setAttribute("userPassword", userService.getUpasswordLogin());
			session.setAttribute("name", fullname.substring(fullname.lastIndexOf(" ") + 1));				
		} else {
			request.setAttribute("status", "failed");
			dispatcher = request.getRequestDispatcher("login.jsp");
		}

		dispatcher.forward(request, response);

	}

}
