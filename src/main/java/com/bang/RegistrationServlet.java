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

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String jdbcURL = "jdbc:postgresql://localhost:5432/blog";
		String usernamePostgres = "postgres";
		String passwordPostgres = "banguchiha1234";
				
		String uname = request.getParameter("name");
		String uemail = request.getParameter("email");
		String upw = request.getParameter("pass");
		String umobile = request.getParameter("contact");
		
		RequestDispatcher dispatcher = null; // dispatcher: điều phối
		
		try {

			Connection connection = DriverManager.getConnection(jdbcURL, usernamePostgres, passwordPostgres);
			
			String sql = "INSERT INTO users (uname, uemail, upw, umobile) VALUES (?, ?, ?, ?)";
			
			PreparedStatement preState = connection.prepareStatement(sql);
			
			preState.setString(1, uname);
			preState.setString(2, uemail);
			preState.setString(3, upw);
			preState.setString(4, umobile);
			
			dispatcher = request.getRequestDispatcher("registration.jsp");
			
			int rowCount = preState.executeUpdate();
			
			if (rowCount > 0) {
				System.out.println("A user has been inserted");
				request.setAttribute("status", "success");
			} else {
				request.setAttribute("status", "failed");
			}
			System.out.println("Connected to Postgresql server");
	
			dispatcher.forward(request, response);
			
			connection.close();
			
		} catch (SQLException e) {
			System.out.println("Error in connecting to Postgresql server");
			e.printStackTrace();
		} 
	}

}
