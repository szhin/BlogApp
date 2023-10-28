package com.blog.controller.components;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.blog.model.Blog;
import com.blog.service.BlogService;

@WebServlet(name="profile", value = "/profile")
public class ProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String status = (String) session.getAttribute("status");
		
		BlogService blogService = new BlogService();
		int userId = (int) session.getAttribute("userId");
		boolean isHaveBlog = blogService.isHaveBlog(userId);
		List<Blog> blogList = blogService.getListUserBlogs();

		String fullName = "";
		
		if (session.getAttribute("name") != null) {
			fullName = (String) session.getAttribute("fullname");
		} 
		
		session.setAttribute("status", status);
		System.out.println("status profile: " + session.getAttribute("status"));
		session.setAttribute("fullName", fullName);
		request.setAttribute("isHaveBlog", isHaveBlog);
		request.setAttribute("blogList", blogList);
		
		request.getRequestDispatcher("profile.jsp").forward(request, response);
	}

	
}
