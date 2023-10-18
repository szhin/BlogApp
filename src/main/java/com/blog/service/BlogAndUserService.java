package com.blog.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.blog.connection.DatabaseUtil;

public class BlogAndUserService {
	private DatabaseUtil databaseUtil;
	private final static String TABLE_BLOG = "blog_posts";
	private final static String TABLE_USER = "users";
	private String blogTitle;
	private String blogContent;
	private String blogTime;
	private String blogCreator;
	
	public BlogAndUserService() {
		databaseUtil = new DatabaseUtil();
		databaseUtil.connectDatabase();
	}
		
	public String getBlogTitle() {
		return blogTitle;
	}
	public void setBlogTitle(String blogTitle) {
		this.blogTitle = blogTitle;
	}
	public String getBlogContent() {
		return blogContent;
	}
	public void setBlogContent(String blogContent) {
		this.blogContent = blogContent;
	}
	public String getBlogTime() {
		return blogTime;
	}
	public void setBlogTime(String blogTime) {
		this.blogTime = blogTime;
	}
	public String getBlogCreator() {
		return blogCreator;
	}
	public void setBlogCreator(String blogCreator) {
		this.blogCreator = blogCreator;
	}
	
	public boolean getBlogUserId(int idBlog) {
		
		Connection connection = databaseUtil.getConnection();

		 String sql = "SELECT " + TABLE_USER + ".id, " + TABLE_USER + ".uname, " +
                 TABLE_BLOG + ".id AS id_blog, " + TABLE_BLOG + ".title, " +
                 TABLE_BLOG + ".creation_date, " + TABLE_BLOG + ".content " +
                 "FROM " + TABLE_USER + " INNER JOIN " + TABLE_BLOG + " " +
                 "ON " + TABLE_USER + ".id = " + TABLE_BLOG + ".user_id " +
                 "WHERE " + TABLE_BLOG + ".id = ? " +
                 "GROUP BY " + TABLE_USER + ".id, id_blog";
		
		try {
			PreparedStatement preStatement = connection.prepareStatement(sql);
			preStatement.setInt(1, idBlog);
			
			ResultSet rs = preStatement.executeQuery();
			
			if (rs.next()) {
				setBlogTitle(rs.getString("title"));
				setBlogContent(rs.getString("content"));
				setBlogTime(rs.getString("creation_date").split(" ")[0]);
				setBlogCreator(rs.getString("uname"));
				
				return true;
				
			} else {
				
				return false;
			}
			
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			databaseUtil.disconnectDatabase();
		}
		
	}
	
}
