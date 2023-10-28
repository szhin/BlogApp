package com.blog.controller.blog;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.blog.dao.BlogDAO;

/**
 * Servlet implementation class Forum
 */
@WebServlet("/deleteBlog")
public class DeleteBlogController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		int blogId = (int) session.getAttribute("blogId");
		
		BlogDAO blogDAO = new BlogDAO();
		
		String deleteButton = request.getParameter("delete");
	    String cancelButton = request.getParameter("cancel");
	    session.setAttribute("status", null);
	    
	    if (deleteButton != null && blogDAO.delete(blogId)) {          	
	    	session.setAttribute("status", "success deleted blog");
	    	System.out.println("status deleteBlog: " + session.getAttribute("status"));
		    response.sendRedirect(request.getContextPath() + "/profile");

	    } else if (cancelButton != null) {
	    	session.setAttribute("status", "warning delete cancel");
	    	System.out.println("status deleteBlog: " + session.getAttribute("status"));
	    	response.sendRedirect(request.getContextPath() + "/profile");
	    }
	}

}
