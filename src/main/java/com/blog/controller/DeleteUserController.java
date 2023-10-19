package com.blog.controller;

import jakarta.servlet.RequestDispatcher;
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

		RequestDispatcher dispatcher = null;
		
		UserDAO userDAO = new UserDAO();
		
		int userId = (int) session.getAttribute("userId");
		
		String deleteButton = request.getParameter("delete");
	    String cancelButton = request.getParameter("cancel");
	    
	    if (deleteButton != null) {
	        if (userDAO.delete(userId)) {
	            request.setAttribute("status", "deleted");
	            session.invalidate();
	            dispatcher = request.getRequestDispatcher("login.jsp");
	        } else {
	            request.setAttribute("status", "failed delete");
	            dispatcher = request.getRequestDispatcher("setting.jsp");
	        }
	    } else if (cancelButton != null) {
	    	request.setAttribute("status", "delete cancel");
	        dispatcher = request.getRequestDispatcher("setting.jsp");
	    }
	    System.out.println(request.getAttribute("status"));
		dispatcher.forward(request, response);
	}

}
