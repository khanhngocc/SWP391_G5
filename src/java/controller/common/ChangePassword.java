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
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;
import utilities.MD5Helper;
import utilities.ValidationField;

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

        MD5Helper md5 = new MD5Helper();
        
        boolean isRightOldPassword = false;
        try {
            isRightOldPassword = md5.verify(oldpass, user.getPassword());
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(ChangePassword.class.getName()).log(Level.SEVERE, null, ex);
        }

        if (oldpass.length() > 25) {
            message = "old password comes over 25 characters";
            isValid = false;
            dispatch(request, message, response);
        } else if (newpass.length() > 25) {
            message = "new password comes over 25 characters";
            isValid = false;
            dispatch(request, message, response);
        } else if (repass.length() > 25) {
            message = "re-password comes over 25 characters";
            isValid = false;
            dispatch(request, message, response);
        } else if (isRightOldPassword == false) {
            message = "old password is wrong";
            isValid = false;
            dispatch(request, message, response);
        } else if (oldpass.equals(newpass) == true) {
            message = "new password is same as old password";
            isValid = false;
            dispatch(request, message, response);
        } else if (!newpass.matches(ValidationField.VALID_PASSWORD.toString())) {
            message = "new password must contain at least 1 number,at least 1 lowercase,at least 1 uppercase, length more than 8 and no special characters";
            isValid = false;
            dispatch(request, message, response);
        } else if (newpass.equals(repass) == false) {
            message = "re-password is different from new password";
            isValid = false;
            dispatch(request, message, response);
        }

        if (isValid == true) {
            String encodedPassword = null;
            try {
                encodedPassword = md5.encryptString(newpass);
            } catch (NoSuchAlgorithmException ex) {
                Logger.getLogger(ChangePassword.class.getName()).log(Level.SEVERE, null, ex);
            }
            dao.changePassword(email, encodedPassword);
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
