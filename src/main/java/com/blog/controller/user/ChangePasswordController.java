package com.blog.controller.user;

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
        HttpSession session = request.getSession();
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
		         
		         session.setAttribute("fullname", fullname);
				 session.setAttribute("userEmail", userEmail);
				 session.setAttribute("userPhone", userPhone);
				 session.setAttribute("userPassword", newPassword);
				 session.setAttribute("name", fullname.substring(fullname.lastIndexOf(" ") + 1));	
				
				 session.setAttribute("status", "success change password");
		         System.out.println("status changePassword: " + session.getAttribute("status"));
		         response.sendRedirect(request.getContextPath() + "/setting.jsp");
			} else {
				 session.setAttribute("status", "error wrong re-password");
				 System.out.println("status changePassword: " + session.getAttribute("status"));
		         response.sendRedirect(request.getContextPath() + "/changePassword.jsp");
			}
		} else {
			session.setAttribute("status", "error wrong password");
		    System.out.println("status changePassword: " + session.getAttribute("status"));
		    response.sendRedirect(request.getContextPath() + "/changePassword.jsp");
		} 
    }
}
