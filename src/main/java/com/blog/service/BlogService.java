package com.blog.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.blog.connection.DatabaseUtil;
import com.blog.model.Blog;

public class BlogService {
	
	private DatabaseUtil databaseUtil;
	private final static String TABLE_NAME = "blog_posts";
	private int blogId;
	private String creationDate;
	private List<Blog> listUserBlogs;
	
	public BlogService() {
		databaseUtil = new DatabaseUtil();
		databaseUtil.connectDatabase();
	}

	public int getBlogId() {
		return blogId;
	}

	public void setBlogId(int idBlog) {
		this.blogId = idBlog;
	}
	
	public String getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(String creationDate) {
		this.creationDate = creationDate;
	}

	public List<Blog> getListUserBlogs() {
		return listUserBlogs;
	}

	public void setListUserBlogs(List<Blog> listUserBlogs) {
		this.listUserBlogs = listUserBlogs;
	}

	public boolean isHaveBlog(int id) {
		
		Connection connection = databaseUtil.getConnection();
		String sql = "SELECT * FROM " + TABLE_NAME 
				+ " WHERE user_id = ?"
				+ " GROUP BY id"
				+ " ORDER BY id DESC";
		
		try {
			
			PreparedStatement preStatement = connection.prepareStatement(sql);
			preStatement.setInt(1, id);		
			ResultSet rs = preStatement.executeQuery();
			
			listUserBlogs = new ArrayList<Blog>();
			
			while (rs.next()) {
				
				Blog blog = new Blog();
				blog.setId(rs.getInt("id"));
				blog.setTitle(rs.getString("title"));
				blog.setContent(rs.getString("content"));
				blog.setCreationDate(rs.getTimestamp("creation_date"));
				
				listUserBlogs.add(blog);
			}
			
			return !listUserBlogs.isEmpty();
			
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			databaseUtil.disconnectDatabase();
		}
	}
	
}
