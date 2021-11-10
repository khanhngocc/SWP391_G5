/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.common;

import dal.UserDAO;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;
import utilities.MD5Helper;

/**
 *
 * @author LEGION
 */
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String documentId = request.getParameter("documentId");

        if (id != null) {
            request.setAttribute("id", Integer.parseInt(id));
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }

        if (documentId != null) {
            request.setAttribute("documentId", documentId);
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }

        if (id == null && documentId == null) {
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String username = request.getParameter("Email");
        String password = request.getParameter("Password");
        String id = request.getParameter("id");
        String documentId = request.getParameter("documentId");

        MD5Helper md5 = new MD5Helper();
        String encodedPassword = null;
        try {
            encodedPassword = md5.encryptString(password);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
        }

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

            if (id.isEmpty() && documentId.isEmpty()) {
                response.sendRedirect("Home");
            } else {
                if (!id.isEmpty()) {
                    response.sendRedirect("QuizHandle?id=" + Integer.parseInt(id));
                }

                if (!documentId.isEmpty()) {
                    response.sendRedirect("DocumentDetailed?id=" + documentId);
                }
            }
        }
    }

}
