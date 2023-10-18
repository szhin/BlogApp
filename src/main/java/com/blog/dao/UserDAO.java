package com.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import com.blog.connection.DatabaseUtil;
import com.blog.model.User;

public class UserDAO implements IDAO<User> {
	
	private DatabaseUtil databaseUtil;
	private static final String TABLE_NAME = "users";
	
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
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(User user) {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public User get(int id) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<User> getAll() {
		// TODO Auto-generated method stub
		return null;
	}


}
