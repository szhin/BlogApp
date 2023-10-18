package com.blog.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.blog.dao.BlogDAO;
import com.blog.model.Blog;


/**
 * Servlet implementation class CreatePost
 */
@WebServlet("/createBlogPost")
public class CreateBlogController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private BlogDAO blogDAO;
	
	public void init() {
		blogDAO = new BlogDAO();
	}
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userId = (int) request.getSession().getAttribute("userId");
		String title = request.getParameter("title-blog");
		String content = request.getParameter("content");	
		content = content.replaceAll("\n", "<br>");
		
		RequestDispatcher dispatcher = null;
		
		// create new blog
		Blog blog = new Blog(userId, title, content);
		
		try {
			
            blogDAO.insert(blog);
            request.setAttribute("status", "success");
            System.out.println("A new post has been inserted");
            
            
        } catch (RuntimeException e) {
        	
            request.setAttribute("status", "error when creating a post");
            System.out.println("An error occurred while inserting a new post: " + e.getMessage());
            
        }
        
		dispatcher = request.getRequestDispatcher("profile.jsp");
		dispatcher.forward(request, response);
		
	}

}