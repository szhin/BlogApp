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
import com.blog.service.UserService;


@WebServlet("/editProfile")
public class EditInfoUserController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;
    
    public void init() {
        userDAO = new UserDAO();
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = (int) request.getSession().getAttribute("userId");
        User userLogin = userDAO.get(userId);
        
        String newName = request.getParameter("name");    
        String newEmail = request.getParameter("email");
        String newMobile = request.getParameter("contact");
        String confirmPass = request.getParameter("password");
        
        UserService userService = new UserService();
        
        if (userLogin != null) {
            // Kiểm tra mật khẩu
            if (userLogin.getUpw().equals(confirmPass)) {
            	
                // Kiểm tra xem email đã tồn tại chưa (ngoại trừ email của user đang login)
            	// Chưa thì false, ngc lại thì true
                if (!userService.checkEmailEditProfile(newEmail, userId)) {
                    User updatedUser = new User(newName, newEmail, confirmPass, newMobile, userId);
                    userDAO.update(updatedUser);
                    HttpSession session = request.getSession();
                    String fullname = newName;
                    session.setAttribute("fullname", fullname);
        			session.setAttribute("userEmail", newEmail);
        			session.setAttribute("userPhone", newMobile);
        			session.setAttribute("userPassword",confirmPass);
        			session.setAttribute("name", fullname.substring(fullname.lastIndexOf(" ") + 1));	
        			
                    request.setAttribute("status", "success edit info");
                    response.sendRedirect("setting.jsp?status=" + request.getAttribute("status"));
                // Không tìm thấy hàng nào trùng email của user đang login
                } else {
                	System.out.println("Lỗi 1");
                    request.setAttribute("status", "warning email already");
                    response.sendRedirect("editProfile.jsp?status=" + request.getAttribute("status"));
                }
            } else {
            	System.out.println("Lỗi 2");
                request.setAttribute("status", "error wrong password");
                response.sendRedirect("editProfile.jsp?status=" + request.getAttribute("status"));
            }
        } else {
        	System.out.println("Lỗi 3");
            request.setAttribute("status", "error get info");
            response.sendRedirect("editProfile.jsp?status=" + request.getAttribute("status"));
        }
    }
}
