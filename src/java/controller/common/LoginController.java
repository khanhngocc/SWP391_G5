/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.common;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author LEGION
 */
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("Login.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        String username = request.getParameter("Email");
        String password = request.getParameter("Password");
        
        
        String encodedPassword = Base64.getUrlEncoder().encodeToString(password.getBytes());
        
        UserDAO db = new UserDAO();
        User user = db.getAccount(username, encodedPassword);
       
        String mess = "";
        if (user == null) {
            mess = "Username/ Password is invalid!";
            session.setAttribute("messLogin", mess);
            session.setAttribute("usernameLogin", username);
            session.setAttribute("passwordLogin", password);
            response.sendRedirect("Login");

        } else {
            String remember = request.getParameter("remember");
            if (remember != null) {
                Cookie c_user = new Cookie("username", username);
                Cookie c_pass = new Cookie("password", password);
                c_user.setMaxAge(3600 * 24 * 7);
                c_pass.setMaxAge(3600 * 24 * 7);
                response.addCookie(c_pass);
                response.addCookie(c_user);
            }

            request.getSession().removeAttribute("messLogin");
            request.getSession().removeAttribute("usernameLogin");
            request.getSession().removeAttribute("passwordLogin");
 
            request.getSession().setAttribute("user", user);
            
            response.sendRedirect("Home");

        }
    }
    
   

}
