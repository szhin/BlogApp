package com.blog.controller;

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
	    
	    if (deleteButton != null && blogDAO.delete(blogId)) {          	
	    	request.setAttribute("status", "success deleted blog");
		    response.sendRedirect("profile.jsp?status=" + request.getAttribute("status"));

	    } else if (cancelButton != null) {
	    	request.setAttribute("status", "warning delete cancel");
	    	response.sendRedirect("editBlog.jsp?status=" + request.getAttribute("status"));
	    }
	}

}
