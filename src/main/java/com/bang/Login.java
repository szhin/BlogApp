package com.bang;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String jdbcURL = "jdbc:postgresql://localhost:5432/blog";
		String usernamePostgres = "postgres";
		String passwordPostgres = "banguchiha1234";
		
		String uemail = request.getParameter("email");
		String upw = request.getParameter("password");
		
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;
		
		try {
			
			Connection connection = DriverManager.getConnection(jdbcURL, usernamePostgres, passwordPostgres);
			
			String sql = "SELECT * FROM users WHERE uemail = ? AND upw = ?";
			
			PreparedStatement preState = connection.prepareStatement(sql);
			preState.setString(1, uemail);
			preState.setString(2, upw);
			
			ResultSet rs = preState.executeQuery();
			
			if (rs.next()) {
				System.out.println("Login success");
				System.out.println(uemail);
				System.out.println(upw);
				session.setAttribute("name", rs.getString("uname"));
				dispatcher = request.getRequestDispatcher("index.jsp");
			} else {
				System.out.println("Login failed");
				System.out.println(uemail);
				System.out.println(upw);
				request.setAttribute("status", "failed");
				dispatcher = request.getRequestDispatcher("login.jsp");
			}

			dispatcher.forward(request, response);
					 
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
