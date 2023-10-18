package com.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.blog.model.Blog;
import com.blog.connection.DatabaseUtil;

public class BlogDAO implements IDAO<Blog> {
	
	private DatabaseUtil databaseUtil;
	private static final String TABLE_NAME = "blog_posts";
	
	public BlogDAO() {
		databaseUtil = new DatabaseUtil();
		databaseUtil.connectDatabase();
	}

	@Override
	public void insert(Blog blog) {
		
		Connection connection = databaseUtil.getConnection();
		String query = "INSERT INTO " + TABLE_NAME +  " (user_id, title, content) VALUES (?, ?, ?)";
		
		try {
			
			PreparedStatement preStatement = connection.prepareStatement(query);
			preStatement.setInt(1, blog.getUserId());
			preStatement.setString(2, blog.getTitle());
			preStatement.setString(3, blog.getContent());	
			preStatement.executeUpdate();
			
		} catch (SQLException e) {
			throw new RuntimeException(e);
			
		} 
		
	}

	@Override
	public void update(Blog blog) {
		
		Connection connection = databaseUtil.getConnection();
        String query = "UPDATE " + TABLE_NAME + " SET title = ?, content = ? WHERE id = ?";
        
        try {
            PreparedStatement preStatement = connection.prepareStatement(query);
            preStatement.setString(1, blog.getTitle());
            preStatement.setString(2, blog.getContent());
            preStatement.setInt(3, blog.getId());
            preStatement.executeUpdate(); // Sử dụng `executeUpdate` thay vì `execute`
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
		
	}

	@Override
	public void delete(Blog blog) {
		Connection connection = databaseUtil.getConnection();
        String query = "DELETE FROM " + TABLE_NAME + " WHERE id = ?";
        
        try {
            PreparedStatement preStatement = connection.prepareStatement(query);
            preStatement.setInt(1, blog.getId());
            preStatement.executeUpdate(); 
            
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }	
	}

	// Lấy blog theo id
	@Override
	public Blog get(int id) {
		
		Connection connection = databaseUtil.getConnection();
        String query = "SELECT * FROM " + TABLE_NAME + " WHERE id = ?";
        
        try {
        	
            PreparedStatement preStatement = connection.prepareStatement(query);
            preStatement.setInt(1, id);
            ResultSet rs = preStatement.executeQuery();
            
            if (rs.next()) {
                Blog blog = new Blog();
                blog.setId(rs.getInt("id"));
                blog.setUserId(rs.getInt("user_id"));
                blog.setTitle(rs.getString("title"));
                blog.setContent(rs.getString("content"));
                blog.setCreationDate(rs.getTimestamp("creation_date"));
                
                return blog;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } 
        
        return null;
	}

	// Lấy toàn bộ blog trong database
	@Override
	public List<Blog> getAll() {
		
		Connection connection = databaseUtil.getConnection();
        String query = "SELECT * FROM " + TABLE_NAME;
        List<Blog> blogs = new ArrayList<>();
        
        try {
            PreparedStatement preStatement = connection.prepareStatement(query);
            ResultSet rs = preStatement.executeQuery();
            
            while (rs.next()) {
                Blog blog = new Blog();
                blog.setId(rs.getInt("id"));
                blog.setUserId(rs.getInt("user_id"));
                blog.setTitle(rs.getString("title"));
                blog.setContent(rs.getString("content"));
                blog.setCreationDate(rs.getTimestamp("creation_date"));
                blogs.add(blog);
                
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } 
        
        return blogs;
	}
	
	
}
