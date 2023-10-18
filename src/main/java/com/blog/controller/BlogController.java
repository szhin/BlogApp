package com.blog.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.blog.service.BlogAndUserService;

/**
 * Servlet implementation class Blog
 */
@WebServlet("/blog")
public class BlogController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fullname = (String) request.getSession().getAttribute("fullname");
	    request.setAttribute("fullname", fullname);
		
		int blogId = Integer.parseInt(request.getParameter("id")); // Lấy ID của blog từ tham số truyền lên
	
		RequestDispatcher dispatcher = null;
			
		BlogAndUserService blogAndUserService = new BlogAndUserService();
			
		if (blogAndUserService.getBlogUserId(blogId)) {
				
			request.setAttribute("status", "success select your blog");
			
			request.setAttribute("blogTitle", blogAndUserService.getBlogTitle());
			request.setAttribute("blogContent", blogAndUserService.getBlogContent());
			request.setAttribute("blogTime", blogAndUserService.getBlogTime());
			request.setAttribute("blogCreator", blogAndUserService.getBlogCreator());
				
			dispatcher = request.getRequestDispatcher("blog.jsp");
		} else {
			request.setAttribute("status", "error when show blog");
			dispatcher = request.getRequestDispatcher("profile.jsp");
			System.out.println("Cannot find this blog");
		}
			
		dispatcher.forward(request, response);
    }
}
