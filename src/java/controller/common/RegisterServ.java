/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.common;

import dal.SettingDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.mail.MessagingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Setting;
import model.User;
import utilities.GmailHelper;
import utilities.MD5Helper;
import utilities.ValidationField;

/**
 *
 * @author Admin
 */
public class RegisterServ extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        SettingDAO settingDAO = new SettingDAO();
        ArrayList<Setting> listTitle = settingDAO.getListSettingByType("Title User");
        request.setAttribute("listTitle", listTitle);
        request.getRequestDispatcher("Registration.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String title = request.getParameter("title");
        String phone = request.getParameter("phone");
        String pass = request.getParameter("pass");
        String repass = request.getParameter("repass");
        UserDAO udao = new UserDAO();
        String mess = "";

        boolean checkuser = true;

        if (email.length() > 100) {
            mess = "email comes over 100 characters";
            checkuser = false;
        } else if (name.length() > 100) {
            mess = "fullname comes over 100 characters";
            checkuser = false;
        } else if (phone.length() > 10) {
            mess = "phone comes over 10 characters";
            checkuser = false;
        } else if (pass.length() > 25) {
            mess = "password comes over 25 characters";
            checkuser = false;
        } else if (repass.length() > 25) {
            mess = "re-password comes over 25 characters";
            checkuser = false;
        } else if (ValidationField.validateEmailFormat(email) == false) {
            mess = "email has wrong format";
            checkuser = false;
        } else if (udao.getUser(email) != null) {
            mess = "email existed in the system";
            checkuser = false;
        } else if (!phone.matches(ValidationField.VALID_PHONE_NUMBER.toString())) {
            mess = "phone number wrong format of phone";
            checkuser = false;
        } else if (!pass.matches(ValidationField.VALID_PASSWORD.toString())) {
            mess = "password must contain at least 1 number,at least 1 lowercase,at least 1 uppercase, length more than 8 and no special characters";
            checkuser = false;
        } else if (!pass.equals(repass)) {
            mess = "password and re-password does not match";
            checkuser = false;
        }

        User user = new User(name, title, email, phone, pass, Date.valueOf(java.time.LocalDate.now()), "images/avatar/user_circle.png", "Deactive", 1);
        user.setRepassword(repass);

        if (checkuser) {
            mess = "Please check your email to verify your account!";
            MD5Helper md5 = new MD5Helper();
            String encodedPassword = null;
            try {
                encodedPassword = md5.encryptString(pass);
            } catch (NoSuchAlgorithmException ex) {
                Logger.getLogger(RegisterServ.class.getName()).log(Level.SEVERE, null, ex);
            }

            user.setPassword(encodedPassword);

            udao.addUser(user);

            GmailHelper gmailHelper = new GmailHelper();

            String maxId = udao.getMaxID();

            String tail = "id=" + maxId;

            MD5Helper md5Helper = new MD5Helper();

            String encodedTail = "";

            try {
                encodedTail = md5Helper.encryptString(tail);
            } catch (NoSuchAlgorithmException ex) {
                Logger.getLogger(ForgotPassword.class.getName()).log(Level.SEVERE, null, ex);
            }

            udao.updateIdEncrypt(maxId, encodedTail);

            String[] mailTo = {email};
            try {
                gmailHelper.sendFromGMail(gmailHelper.getUSER_NAME(), gmailHelper.getPASSWORD(),
                        mailTo, "[Activate your account in Mega Deal]",
                        "Hi you,\n\n" + "Click this link to activate your account, then you are able to access the system.\n"
                        + "http://localhost:8080/SWP391_G5/ActivateAccount?" + encodedTail
                        + "\n\n"
                        + "Regard,\n"
                        + "Mega Deal Support Team");
            } catch (MessagingException ex) {
                Logger.getLogger(RegisterServ.class.getName()).log(Level.SEVERE, null, ex);
            }
            request.setAttribute("messLogin", mess);
            dispath(request, response, "Login.jsp");
        } else {
            SettingDAO settingDAO = new SettingDAO();
            ArrayList<Setting> listTitle = settingDAO.getListSettingByType("Title User");
            request.setAttribute("listTitle", listTitle);
            request.setAttribute("userDrap", user);
            request.setAttribute("mess", mess);
            dispath(request, response, "Registration.jsp");
        }

    }

    private void dispath(HttpServletRequest request,
            HttpServletResponse response,
            String URL) {
        RequestDispatcher dis
                = request.getRequestDispatcher(URL);
        try {
            dis.forward(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(RegisterServ.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(RegisterServ.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
