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
import java.sql.SQLException;

import com.general.DatabaseUtil;

/**
 * Servlet implementation class CreatePost
 */
@WebServlet("/createBlogPost")
public class CreatePost extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String title = request.getParameter("title-blog");
		String content = request.getParameter("content");
		
		content = content.replaceAll("\n", "<br>");
		
		RequestDispatcher rd = null;
		
		try (Connection connection = DatabaseUtil.getConnection()) {
			int userId = (int) request.getSession().getAttribute("userId");
			
			
			String insertBlogQuery = "INSERT INTO blog_posts (user_id, title, content) VALUES (?, ?, ?)";
			
			PreparedStatement pS = connection.prepareStatement(insertBlogQuery);
			pS.setInt(1, userId);
			pS.setString(2, title);
			pS.setString(3, content);
			
			int rowCount = pS.executeUpdate();
			
			if (rowCount > 0) {
				
				System.out.println("A new post has been inserted");
				request.setAttribute("status", "success");
			} else {
				System.out.println("A new post has not been inserted");
				request.setAttribute("status", "error when create post");
			}
			
			System.out.println("Connect database success in create post page");
			rd = request.getRequestDispatcher("profile.jsp");
			rd.forward(request, response);
			
		} catch (SQLException e) {
			System.out.println("Error in connecting to Postgresql server");
			e.printStackTrace();
		}
	}

}
