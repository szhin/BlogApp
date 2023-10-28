package com.blog.controller.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.blog.dao.UserDAO;
import com.blog.model.User;
import com.blog.service.UserService;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/register")
public class RegisterUserController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;
	
	public void init() {
		userDAO = new UserDAO();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();	
		
		String uname = request.getParameter("name");
		String upw = request.getParameter("pass");
		String uemail = request.getParameter("email");
		String reupw = request.getParameter("re_pass");
		String umobile = request.getParameter("contact");
		
		// Check wrong re password
		if (!upw.equals(reupw)) {
			session.setAttribute("status", "error wrong repass");
			System.out.println("status register: " + session.getAttribute("status"));
			response.sendRedirect("registration.jsp?status=" + session.getAttribute("status"));
			return;
		}
		
		// Create new user
		User user = new User(uname, uemail, upw, umobile);
		
		try {			
			UserService userService = new UserService();
			// Check email already exists
			if (!userService.userAlreadyExists(uemail)) {
				userDAO.insert(user);			
				session.setAttribute("status", "registration success");
				System.out.println("status register: " + session.getAttribute("status"));
				response.sendRedirect("login.jsp?status=" + session.getAttribute("status"));
	            System.out.println("A user has been inserted");
			} else {
				session.setAttribute("status", "warning email already");
				System.out.println("status register: " + session.getAttribute("status"));
				response.sendRedirect("registration.jsp?status=" + session.getAttribute("status"));
			}
			
		} catch (RuntimeException e) {
			System.out.println("Error in connecting to Postgresql server");
			e.printStackTrace();
		} 
		
	}

}

