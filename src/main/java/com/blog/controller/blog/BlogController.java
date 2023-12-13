package com.blog.controller.blog;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.blog.service.BlogAndUserService;

/**
 * Servlet implementation class Blog
 */
@WebServlet("/blog")
public class BlogController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String fullname = (String) session.getAttribute("fullname");
		session.setAttribute("fullname", fullname);
		
		int blogId = Integer.parseInt(request.getParameter("id")); // Lấy ID của blog từ tham số truyền lên
		System.out.println(blogId);
	
		RequestDispatcher dispatcher = null;
			
		BlogAndUserService blogAndUserService = new BlogAndUserService();
			
		if (blogAndUserService.getBlogUserId(blogId)) {
				
			session.setAttribute("status", null);
			System.out.println("status blog: " + session.getAttribute("status"));
			request.setAttribute("blogTitle", blogAndUserService.getBlogTitle());
			request.setAttribute("blogContent", blogAndUserService.getBlogContent());
			request.setAttribute("blogTime", blogAndUserService.getBlogTime());
			request.setAttribute("blogCreator", blogAndUserService.getBlogCreator());
				
//			dispatcher = request.getRequestDispatcher(response.encodeURL(request.getContextPath() + "/blog.jsp"));
			dispatcher = request.getRequestDispatcher("blog.jsp");
		} else {
			session.setAttribute("status", "error when show blog");
			System.out.println("status blog: " + session.getAttribute("status"));
			dispatcher = request.getRequestDispatcher(response.encodeURL(request.getContextPath() + "/profile"));
		
			System.out.println("Cannot find this blog");
		}
			
		dispatcher.forward(request, response);
		
    }
}
