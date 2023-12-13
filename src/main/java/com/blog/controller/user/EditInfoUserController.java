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
import com.blog.service.UserService;


@WebServlet("/editProfile")
public class EditInfoUserController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;
    
    public void init() {
        userDAO = new UserDAO();
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
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
       
                    String fullname = newName;
                    session.setAttribute("fullname", fullname);
        			session.setAttribute("userEmail", newEmail);
        			session.setAttribute("userPhone", newMobile);
        			session.setAttribute("userPassword",confirmPass);
        			session.setAttribute("name", fullname.substring(fullname.lastIndexOf(" ") + 1));	
        			
                    session.setAttribute("status", "success edit info");
                    System.out.println("status editInfo: " + session.getAttribute("status"));
                    response.sendRedirect(response.encodeURL(request.getContextPath() + "/setting.jsp"));
                // Không tìm thấy hàng nào trùng email của user đang login
                } else {
                	System.out.println("Lỗi 1");
                    session.setAttribute("status", "warning email already");
                    System.out.println("status editInfo: " + session.getAttribute("status"));
                    response.sendRedirect(response.encodeURL(request.getContextPath() + "/editProfile.jsp"));
                }
            } else {
            	System.out.println("Lỗi 2");
            	session.setAttribute("status", "error wrong password");
                System.out.println("status editInfo: " + session.getAttribute("status"));
                response.sendRedirect(response.encodeURL(request.getContextPath() + "/editProfile.jsp"));
            }
        } else {
        	System.out.println("Lỗi 3");
        	session.setAttribute("status", "error get info");
            System.out.println("status editInfo: " + session.getAttribute("status"));
            response.sendRedirect(response.encodeURL(request.getContextPath() + "/editProfile.jsp"));
        }
    }
}
