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

import com.general.DatabaseUtil;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String uemail = request.getParameter("email");
		String upw = request.getParameter("password");
		
		HttpSession session = request.getSession();
		
		// dispatcher sẽ giúp điều hướng trang web .jsp tới .jsp khác
		RequestDispatcher dispatcher = null;
		
		try (Connection connection = DatabaseUtil.getConnection()) {		
	
			String sql = "SELECT * FROM users WHERE uemail = ? AND upw = ?";
			
			PreparedStatement preState = connection.prepareStatement(sql);

			preState.setString(1, uemail);
			preState.setString(2, upw);
			
			// Nếu câu select execute thành công thì rs.next() sẽ bằng true
			ResultSet rs = preState.executeQuery();
			
			if (rs.next()) {
				dispatcher = request.getRequestDispatcher("forum.jsp");
				
				int userId = rs.getInt("id");
				session.setAttribute("userId", userId);
				
				String firstName = rs.getString("uname");
				session.setAttribute("fullname", firstName);
				session.setAttribute("name", firstName.substring(firstName.lastIndexOf(" ") + 1));				
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
