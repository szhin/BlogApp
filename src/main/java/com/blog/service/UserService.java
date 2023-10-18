package com.blog.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.blog.connection.DatabaseUtil;

public class UserService {
	private DatabaseUtil databaseUtil;
	private static final String TABLE_NAME = "users";
	private int idUserLogin;
	private String unameLogin;
	
	public UserService() {
		databaseUtil = new DatabaseUtil();
		databaseUtil.connectDatabase();
	}
	
	public int getIdUserLogin() {
		return idUserLogin;
	}

	public void setIdUserLogin(int idUserLogin) {
		this.idUserLogin = idUserLogin;
	}

	public String getUnameLogin() {
		return unameLogin;
	}

	public void setUnameLogin(String unameLogin) {
		this.unameLogin = unameLogin;
	}

	public boolean userAlreadyExists(String email) {
	    Connection connection = databaseUtil.getConnection();
	    
	    String sql = "SELECT * FROM " + TABLE_NAME + " WHERE uemail = ?";
	    
	    try {
	    	PreparedStatement preStatement = connection.prepareStatement(sql);
	    	
	    	preStatement.setString(1, email);
	        ResultSet rs = preStatement.executeQuery();
	        
	        return rs.next(); // Trả về true nếu người dùng đã tồn tại, ngược lại trả về false
	    
	    } catch (SQLException e) {
	        throw new RuntimeException(e);
	    }
	}
	
	public boolean login(String email, String password) {
		Connection connection = databaseUtil.getConnection();
		
		String sql = "SELECT * FROM " + TABLE_NAME + " WHERE uemail = ? AND upw = ?";
		
		try {
			PreparedStatement preState = connection.prepareStatement(sql);

			preState.setString(1, email);
			preState.setString(2, password);
			
			// Nếu câu select execute thành công thì rs.next() sẽ bằng true
			ResultSet rs = preState.executeQuery();
			
			if (rs.next()) {
				idUserLogin = rs.getInt("id");
				unameLogin = rs.getString("uname");
				return true;
			} else {
				return false;
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
