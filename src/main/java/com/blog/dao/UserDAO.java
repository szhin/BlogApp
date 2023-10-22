package com.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.blog.connection.DatabaseUtil;
import com.blog.model.User;

public class UserDAO implements IDAO<User> {
	
	private DatabaseUtil databaseUtil;
	private static final String TABLE_NAME = "users";
	private static final String TABLE_NAME_BLOG = "blog_posts";
	
	public UserDAO() {
		databaseUtil = new DatabaseUtil();
		databaseUtil.connectDatabase();
	}
	@Override
	public void insert(User user) {
		
		Connection connection = databaseUtil.getConnection();
		
		String query = "INSERT INTO " + TABLE_NAME + " (uname, uemail, upw, umobile) VALUES (?, ?, ?, ?)";
		
		try {
			
			PreparedStatement preStatement = connection.prepareStatement(query);
			preStatement.setString(1, user.getUname());
			preStatement.setString(2, user.getUemail());
			preStatement.setString(3, user.getUpw());
			preStatement.setString(4, user.getUmobile());
			preStatement.execute();
			
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} 
	}

	@Override
	public void update(User user) {
		Connection connection = databaseUtil.getConnection();
        String query = "UPDATE " + TABLE_NAME + " SET uname = ?, uemail = ?, upw = ?, umobile = ? WHERE id = ?";

        try {
            PreparedStatement preStatement = connection.prepareStatement(query);
            preStatement.setString(1, user.getUname());
            preStatement.setString(2, user.getUemail());
            preStatement.setString(3, user.getUpw());
            preStatement.setString(4, user.getUmobile());
            preStatement.setInt(5, user.getId());
            preStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
	}

	@Override
	public boolean delete(int id) {
		
	    Connection connection = databaseUtil.getConnection();
	    String deletePostsQuery = "DELETE FROM " + TABLE_NAME_BLOG + " WHERE user_id = ?";
	    String deleteUserQuery = "DELETE FROM " + TABLE_NAME + " WHERE id = ?";
	    boolean success = false;
	    
	    try {
	        connection.setAutoCommit(false); // Bắt đầu transaction
	        
	        // Xóa bài đăng của người dùng
	        PreparedStatement deletePostsStatement = connection.prepareStatement(deletePostsQuery);
	        deletePostsStatement.setInt(1, id);
	        deletePostsStatement.executeUpdate();
	        
	        // Xóa người dùng
	        PreparedStatement deleteUserStatement = connection.prepareStatement(deleteUserQuery);
	        deleteUserStatement.setInt(1, id);
	        int rowsAffected = deleteUserStatement.executeUpdate();
	        
	        if (rowsAffected > 0) {
	            success = true;
	            connection.commit(); // Commit transaction nếu thành công
	        } else {
	            connection.rollback(); // Rollback nếu không có hàng nào bị xóa
	        }
	    } catch (SQLException e) {
	        throw new RuntimeException(e);
	    } finally {
	        try {
	            connection.setAutoCommit(true); // Kết thúc transaction
	        } catch (SQLException e) {
	            throw new RuntimeException(e);
	        }
	    }
	    
	    return success;
	}

	
	@Override
	public User get(int id) {
		Connection connection = databaseUtil.getConnection();
        String query = "SELECT * FROM " + TABLE_NAME + " WHERE id = ?";

        try {
            PreparedStatement preStatement = connection.prepareStatement(query);
            preStatement.setInt(1, id);
            ResultSet rs = preStatement.executeQuery();

            if (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setUname(rs.getString("uname"));
                user.setUemail(rs.getString("uemail"));
                user.setUpw(rs.getString("upw"));
                user.setUmobile(rs.getString("umobile"));

                return user;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return null;
	}
	
	@Override
	public List<User> getAll() {
		Connection connection = databaseUtil.getConnection();
        String query = "SELECT * FROM " + TABLE_NAME;
        List<User> users = new ArrayList<>();

        try {
            PreparedStatement preStatement = connection.prepareStatement(query);
            ResultSet rs = preStatement.executeQuery();

            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setUname(rs.getString("uname"));
                user.setUemail(rs.getString("uemail"));
                user.setUpw(rs.getString("upw"));
                user.setUmobile(rs.getString("umobile"));
                users.add(user);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return users;
	}

}
