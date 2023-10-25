package com.blog.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.blog.dao.UserDAO;
import com.blog.model.User;

@WebServlet("/changePassword")
public class ChangePasswordController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;
    
    public void init() {
        userDAO = new UserDAO();
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = (int) request.getSession().getAttribute("userId");
        User userLogin = userDAO.get(userId);
        
        String fullname = userLogin.getUname();
        String userEmail = userLogin.getUemail();
        String userPhone = userLogin.getUname();
        
        String password = request.getParameter("password");    
        String newPassword = request.getParameter("new-password");  
        String reNewPassword = request.getParameter("renew-password");  

        // Kiểm tra mật khẩu
		if (userLogin.getUpw().equals(password)) {
			if (newPassword.equals(reNewPassword)) {
				 User updatedUser = new User(fullname, userEmail, newPassword, userPhone, userId);
		         userDAO.update(updatedUser);
		         
		         HttpSession session = request.getSession();
		         session.setAttribute("fullname", fullname);
				 session.setAttribute("userEmail", userEmail);
				 session.setAttribute("userPhone", userPhone);
				 session.setAttribute("userPassword", newPassword);
				 session.setAttribute("name", fullname.substring(fullname.lastIndexOf(" ") + 1));	
				
		         request.setAttribute("status", "success change password");
		         response.sendRedirect("setting.jsp?status=" + request.getAttribute("status"));
			} else {
				 request.setAttribute("status", "error wrong re-password");
		         response.sendRedirect("changePassword.jsp?status=" + request.getAttribute("status"));
			}
		} else {
		    request.setAttribute("status", "error wrong password");
		    response.sendRedirect("changePassword.jsp?status=" + request.getAttribute("status"));
		} 
    }
}
