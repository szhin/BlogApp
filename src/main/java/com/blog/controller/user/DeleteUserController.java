package com.blog.controller.user;

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
	    	session.setAttribute("status", "success deleted user");
	    	System.out.println("status deleteUser: " + session.getAttribute("status"));
		    session.invalidate();
		    response.sendRedirect(response.encodeURL(request.getContextPath() + "/login.jsp"));

	    } else if (cancelButton != null) {
	    	session.setAttribute("status", "warning delete cancel");
	    	System.out.println("status deleteUser: " + session.getAttribute("status"));
	    	response.sendRedirect(response.encodeURL(request.getContextPath() + "/setting.jsp"));
	    }
	}

}
