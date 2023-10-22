package com.blog.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.blog.dao.UserDAO;

/**
 * Servlet implementation class Forum
 */
@WebServlet("/deleteUser")
public class DeleteUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		UserDAO userDAO = new UserDAO();
		
		int userId = (int) session.getAttribute("userId");
		
		String deleteButton = request.getParameter("delete");
	    String cancelButton = request.getParameter("cancel");
	    
	    if (deleteButton != null && userDAO.delete(userId)) {          	
	    	request.setAttribute("status", "success deleted user");
		    session.invalidate();
		    response.sendRedirect("login.jsp?status=" + request.getAttribute("status"));

	    } else if (cancelButton != null) {
	    	request.setAttribute("status", "warning delete cancel");
	    	response.sendRedirect("setting.jsp?status=" + request.getAttribute("status"));
	    }
	}

}
