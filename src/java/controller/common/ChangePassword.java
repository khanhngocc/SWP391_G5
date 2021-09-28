/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.common;

import controller.base.BaseRequiredLoginController;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author dell
 */
public class ChangePassword extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String message = "Update successfully!";

        String email = request.getParameter("email");

        UserDAO dao = new UserDAO();

        User user = dao.getUser(email);

        String oldpass = request.getParameter("oldpass");
        String newpass = request.getParameter("newpass");
        String repass = request.getParameter("repass");

        if (oldpass.equals(user.getPassword()) == false) {
            message = "old password is wrong";
            request.setAttribute("mess1", message);
            request.getRequestDispatcher("UpdateInformation.jsp").forward(request, response);
        }

        if (newpass.length() < 8) {
            message = "length of password must be greater than 8";
            request.setAttribute("mess1", message);
            request.getRequestDispatcher("UpdateInformation.jsp").forward(request, response);
        }

        if (newpass.equals(repass) == false) {
            message = "new password is different from re-password";
            request.setAttribute("mess1", message);
            request.getRequestDispatcher("UpdateInformation.jsp").forward(request, response);
        }

        
        int n = dao.changePassword(email, newpass);
        request.setAttribute("mess1", message);
        request.getRequestDispatcher("UpdateInformation.jsp").forward(request, response);

    }

}
