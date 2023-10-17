package com.bang;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.general.DatabaseUtil;

/**
 * Servlet implementation class Blog
 */
@WebServlet("/blog")
public class Blog extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fullname = (String) request.getSession().getAttribute("fullname");
	    request.setAttribute("fullname", fullname);
		
		int blogId = Integer.parseInt(request.getParameter("id")); // Lấy ID của blog từ tham số truyền lên
	
		RequestDispatcher dispatcher = null;
	

		try (Connection connection = DatabaseUtil.getConnection()) {
			
			String sql = "SELECT users.id, users.uname, blog_posts.id AS id_blog, "
					+ "blog_posts.title, blog_posts.creation_date, blog_posts.content "
					+ "FROM users INNER JOIN blog_posts "
					+ "ON users.id = blog_posts.user_id "
					+ "WHERE blog_posts.id = ? "
					+ "GROUP BY users.id, id_blog";
			
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, blogId);
			
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				
				request.setAttribute("status", "success select your blog");
			
				request.setAttribute("blogTitle", rs.getString("title"));
				request.setAttribute("blogContent", rs.getString("content"));
				request.setAttribute("blogTime", rs.getString("creation_date").split(" ")[0]);
				request.setAttribute("blogCreator", rs.getString("uname"));
				
				dispatcher = request.getRequestDispatcher("blog.jsp");
			} else {
				request.setAttribute("status", "error when show blog");
				dispatcher = request.getRequestDispatcher("profile.jsp");
				System.out.println("Cannot find this blog");
			}
			
			dispatcher.forward(request, response);
			
		} catch (SQLException e) {
			e.printStackTrace();
			request.setAttribute("status", "error");
			dispatcher = request.getRequestDispatcher("profile.jsp");
		}			
    }
}
