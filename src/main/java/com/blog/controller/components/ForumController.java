package com.blog.controller.components;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.blog.dao.BlogDAO;
import com.blog.model.Blog;

@WebServlet(name="forum", value="/forum")
public class ForumController extends HttpServlet {
	private static final long serialVersionUID = 1L;	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BlogDAO blogDAO = new BlogDAO();
		List<Blog> blogList = blogDAO.getAll();
		
		request.setAttribute("blogList", blogList);
		
		HttpSession session = request.getSession();
		session.setAttribute("status", null);
		System.out.println("status forum: " + session.getAttribute("status"));
		
		request.getRequestDispatcher("forum.jsp").forward(request, response);
	}

}
