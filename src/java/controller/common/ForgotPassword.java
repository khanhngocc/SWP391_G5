/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.common;

import dal.AccountForgotDAO;
import dal.UserDAO;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.AccountForgot;
import model.User;
import utilities.GmailHelper;
import utilities.MD5Helper;
import utilities.ValidationField;

/**
 *
 * @author dell
 */
public class ForgotPassword extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("ForgotPassword.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        boolean isValid = true;

        String message = "recover successfully, please check your emai!";

        String email = request.getParameter("email");

        request.setAttribute("emailCover", email);
        UserDAO dao = new UserDAO();

        // valid email
        if (email.length() > 100) {
            message = "email comes over 100 characters";
            isValid = false;
            dispatch(request, message, response);
        } else if (ValidationField.validateEmailFormat(email) == false) {
            message = "wrong format of email";
            isValid = false;
            dispatch(request, message, response);
        } else if (dao.getUser(email) == null) {
            message = "this email isn't signed up in the system";
            isValid = false;
            dispatch(request, message, response);
        }

        if (isValid == true) {

            UserDAO userDAO = new UserDAO();
            User current_user = userDAO.getUser(email);

            // mark this account have permisson to reset password
            Calendar cal = Calendar.getInstance();
            SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");

            AccountForgotDAO accDAO = new AccountForgotDAO();

            AccountForgot acc = new AccountForgot();

            // set attribute
            acc.setUser_id(current_user.getId());
            acc.setTimeStarted(sdf.format(cal.getTime()));
            cal.add(Calendar.SECOND, 85);
            acc.setTimeEnded(sdf.format(cal.getTime()));
            acc.setAllowedReset("1");
            acc.setDateCreated(java.time.LocalDate.now().toString());

            // create accountforgot
            accDAO.createAccountForgot(acc);

            String max_id = accDAO.getMaxID();

            String tail = "id=" + max_id;

            MD5Helper md5Helper = new MD5Helper();

            String encodedTail = "";

            try {
                encodedTail = md5Helper.encryptString(tail);
            } catch (NoSuchAlgorithmException ex) {
                Logger.getLogger(ForgotPassword.class.getName()).log(Level.SEVERE, null, ex);
            }

           

            String url = "http://localhost:8080/SWP391_G5/ResetPassword?" + encodedTail;

            // send link to reset password to email
            GmailHelper gm = new GmailHelper();
            String[] rep = {email};
            String subject = "[Reset your password at MegaDeal system]";
            String body = "Hi you,\n\n\n"
                    + "Please click this link to get new password :" + url
                    + "\n"
                    + "/* Don't share this link for someone because of your account's privacy.*/"
                    + "\n\n"
                    + "Regard,\n"
                    + "Mega Deal Support Team";
            try {
                gm.sendFromGMail(gm.getUSER_NAME(), gm.getPASSWORD(), rep, subject, body);
                message = "Check your email to get link to reset password";
                dispatch(request, message, response);
            } catch (MessagingException ex) {
                System.out.println(ex.getMessage());
            }

        }

    }

    private void dispatch(HttpServletRequest request, String message, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("mess", message);
        request.getRequestDispatcher("ForgotPassword.jsp").forward(request, response);
    }

}
