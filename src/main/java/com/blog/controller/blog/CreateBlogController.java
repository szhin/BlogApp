package com.blog.controller.blog;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.blog.dao.BlogDAO;
import com.blog.model.Blog;

@WebServlet("/createBlogPost")
public class CreateBlogController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BlogDAO blogDAO;

    public void init() {
        blogDAO = new BlogDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
    	
    	int userId = (int) request.getSession().getAttribute("userId");
        String title = request.getParameter("title-blog");
        String content = request.getParameter("content");
        content = content.replaceAll("\n", "<br>");
        
        // Create a new blog
        Blog blog = new Blog(userId, title, content);

        try {
            blogDAO.insert(blog);
            session.setAttribute("status", "success creating a post");
            System.out.println("status createBlog: " + session.getAttribute("status"));
        } catch (RuntimeException e) {
        	session.setAttribute("status", "error when creating a post");
        	System.out.println("status createBlog: " + session.getAttribute("status"));
        }

        // Redirect to profile.jsp with status as a query parameter
        response.sendRedirect(response.encodeURL(request.getContextPath() + "/profile"));
        
    }
}
