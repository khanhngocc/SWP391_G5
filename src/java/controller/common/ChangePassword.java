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
        request.getRequestDispatcher("ChangePassword.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        boolean isValid = true;

        String message = "";

        String email = request.getParameter("email");

        UserDAO dao = new UserDAO();

        User user = dao.getUser(email);

        String oldpass = request.getParameter("oldpass");
        String newpass = request.getParameter("newpass");
        String repass = request.getParameter("repass");

        request.setAttribute("oldpass", oldpass);
        request.setAttribute("newpass", newpass);
        request.setAttribute("repass", repass);

        if (oldpass.equals(user.getPassword()) == false) {
            message = "old password is wrong";
            isValid = false;
            dispatch(request, message, response);
        }

        if (newpass.length() < 8) {
            message = "length of password must be greater than 8";
            isValid = false;
            dispatch(request, message, response);
        }

        if (newpass.equals(repass) == false) {
            message = "new password is different from re-password";
            isValid = false;
            dispatch(request, message, response);
        }

        if (isValid == true) {
            int n = dao.changePassword(email, newpass);
            message = "Update successfully!";
            clearField(request);
            dispatch(request, message, response);
        }

    }

    private void clearField(HttpServletRequest request) {
        request.removeAttribute("oldpass");
        request.removeAttribute("newpass");
        request.removeAttribute("repass");
    }

    private void dispatch(HttpServletRequest request, String message, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("messChangePass", message);
        request.getRequestDispatcher("ChangePassword.jsp").forward(request, response);
    }

}
