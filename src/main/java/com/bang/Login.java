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
		// 3 thông tin này giúp kết nối với Postgres ở Connection bên dưới nè
		String jdbcURL = "jdbc:postgresql://localhost:5432/blog";
		String usernamePostgres = "postgres";
		String passwordPostgres = "banguchiha1234";
		
		// Lấy thông tin đã nhập ở Browser bằng request
		String uemail = request.getParameter("email");
		String upw = request.getParameter("password");
		
		// HttpSession giúp set lại atribute "name" thành một String bất kì (bên dưới set thành uname)
		// Việc này sẽ giúp điều hướng trang về index.jsp khi đã login
		// Vì index.jsp có 1 lệnh điều hướng sang login.jsp (đó là khi name = null)
		HttpSession session = request.getSession();
		
		// dispatcher sẽ giúp điều hướng trang web .jsp tới .jsp khác
		RequestDispatcher dispatcher = null;
		
		try {		
			Connection connection = DriverManager.getConnection(jdbcURL, usernamePostgres, passwordPostgres);
			
			String sql = "SELECT * FROM users WHERE uemail = ? AND upw = ?";
			
			PreparedStatement preState = connection.prepareStatement(sql);
			// 1, 2 đại diện cho thứ tự dấu "?" ở câu query sql
			preState.setString(1, uemail);
			preState.setString(2, upw);
			
			// Nếu câu select execute thành công thì rs.next() sẽ bằng true
			ResultSet rs = preState.executeQuery();
			
			if (rs.next()) {
				dispatcher = request.getRequestDispatcher("index.jsp");	
				session.setAttribute("name", rs.getString("uname"));				
			} else {
				request.setAttribute("status", "failed");
				dispatcher = request.getRequestDispatcher("login.jsp");
			}

			dispatcher.forward(request, response);
					 
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
