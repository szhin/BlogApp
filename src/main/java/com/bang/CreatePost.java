package com.bang;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class CreatePost
 */
@WebServlet("/createBlogPost")
public class CreatePost extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String jdbcURL = "jdbc:postgresql://localhost:5432/blog";
		String usernamePostgres = "postgres";
		String passwordPostgres = "banguchiha1234";
		
		String title = request.getParameter("title-blog");
		String content = request.getParameter("content");
		
		RequestDispatcher rd = null;
		
		try {
			Connection connection = DriverManager.getConnection(jdbcURL, usernamePostgres, passwordPostgres);
			
			String insertBlogQuery = "INSERT INTO blog_posts (user_id, title, content) VALUES (?, ?, ?)";
			
			PreparedStatement pS = connection.prepareStatement(insertBlogQuery);
//			pS.setString(1, user_id);
			pS.setString(2, title);
			pS.setString(3, content);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
