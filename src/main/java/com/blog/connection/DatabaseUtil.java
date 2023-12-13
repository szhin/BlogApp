package com.blog.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseUtil {
	
	private Connection connection = null;
    private static final String jdbcURL = "jdbc:postgresql://localhost:5432/blog";
    private static final String usernamePostgres = "postgres";
    private static final String passwordPostgres = "banguchiha1234";

    public boolean connectDatabase() {
        try {      	
        	connection = DriverManager.getConnection(jdbcURL, usernamePostgres, passwordPostgres);        	
        	if (connection != null) {        		
				System.out.println("Connect successfully");
				return true;				
			}		
		} catch (SQLException e) {		
			e.printStackTrace();			
		}       
        return false;
    }
    
    public void disconnectDatabase() {
        try {     	
        	if (connection != null) {          	
                connection.close();         
            }
        } catch (SQLException e) {       	
            e.printStackTrace();         
        }
    }

    public Connection getConnection() {
        return connection;   
    }
    
}
