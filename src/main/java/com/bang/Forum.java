package com.bang;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.general.DatabaseUtil;

/**
 * Servlet implementation class Forum
 */
@WebServlet("/forum")
public class Forum extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		List<BlogPost> blogPosts = new ArrayList<>();
//
//		try (Connection connection = DatabaseUtil.getConnection()) {
//		    String selectBlogQuery = "SELECT * FROM blog_posts ORDER BY id DESC";
//		    PreparedStatement selectStatement = connection.prepareStatement(selectBlogQuery);
//		    ResultSet rs = selectStatement.executeQuery();
//
//		    while (rs.next()) {
//		        int blogId = rs.getInt("id");
//		        String title = rs.getString("title");
//		        String creationDate = rs.getString("creation_date");
//		        // Các trường dữ liệu khác cũng có thể được lấy tương tự
//
//		        BlogPost blogPost = new BlogPost(blogId, title, creationDate);
//		        blogPosts.add(blogPost);
//		    }
//		} catch (SQLException e) {
//		    e.printStackTrace();
//		}
//
//		request.setAttribute("blogPosts", blogPosts);

	}

}
