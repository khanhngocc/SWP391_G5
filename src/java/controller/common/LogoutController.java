/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.common;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dell
 */
public class LogoutController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getSession().setAttribute("user", null);
        Cookie c_user = new Cookie("username", "");
        Cookie c_pass = new Cookie("password", "");
        c_user.setMaxAge(-1);
        c_pass.setMaxAge(-1);
        response.addCookie(c_pass);
        response.addCookie(c_user);
        response.sendRedirect("Landing.jsp");
    }

}
