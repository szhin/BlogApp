package com.blog.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.blog.dao.BlogDAO;
import com.blog.model.Blog;

@WebServlet("/editBlog")
public class EditBlogController extends HttpServlet {
    private static final long serialVersionUID = 1L;
	private BlogDAO blogDAO;
    
    public void init() {
        blogDAO = new BlogDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int blogId = Integer.parseInt(request.getParameter("id"));
    	Blog blog = blogDAO.get(blogId);
    	
    	String content = blog.getContent();
    	content = content.replaceAll("<br>", "\n");
    	
    	HttpSession session = request.getSession();
    	session.setAttribute("blogId", blogId);
    	session.setAttribute("blogTitle", blog.getTitle());
        session.setAttribute("blogContent", content);
        response.sendRedirect("editBlog.jsp");
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession();
    	int blogId = (int) session.getAttribute("blogId");
    	Blog newBlog = blogDAO.get(blogId);
        System.out.println(newBlog.getUserId());
        
        String newTitle = request.getParameter("title-blog");
        String newContent = request.getParameter("content");
        newContent = newContent.replaceAll("\n", "<br>");
        
         newBlog.setTitle(newTitle);
         newBlog.setContent(newContent);
        
        try { 	
            blogDAO.update(newBlog);	
            session.setAttribute("blogId", blogId);
            session.setAttribute("blogTitle", newTitle);
            session.setAttribute("blogContent", newContent);
            
            System.out.println("Edit successful");
            request.setAttribute("status", "Success edit blog");
            response.sendRedirect("profile.jsp?status=" + request.getAttribute("status"));
            
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("status", "Error edit blog");
	        response.sendRedirect("editBlog.jsp?status=" + request.getAttribute("status"));
		}
        
    }
    

}
