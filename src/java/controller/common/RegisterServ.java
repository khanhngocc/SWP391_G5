/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.common;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
import model.User;
import utilities.GmailHelper;

/**
 *
 * @author Admin
 */
public class RegisterServ extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

        }
    }

    public static final Pattern VALID_EMAIL_ADDRESS_REGEX
            = Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$", Pattern.CASE_INSENSITIVE);

    public static boolean validate(String emailStr) {
        Matcher matcher = VALID_EMAIL_ADDRESS_REGEX.matcher(emailStr);
        return matcher.find();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
        if (udao.getUser(email) != null) {
            mess = "This email has been used";
            checkuser = false;
        }
        if (validate(email) == false) {
            mess = "This email has wrong format";
            checkuser = false;
        }
        if (phone.chars().allMatch(Character::isDigit) == false) {
            mess = "Phone is not digit";
            checkuser = false;
        }
        if (phone.length() > 12) {
            mess = "Length of phone must be less than 12 characters";
            checkuser = false;
        }
        if (!pass.matches("^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])([a-zA-Z0-9]{8,})$")) {
            mess = "password must contain number,lowercase,uppercase and length more than 8";
            checkuser = false;
        }
        if (!pass.equals(repass)) {
            mess = "PassWord and Re-PassWord doesnot match";
            checkuser = false;
        }
        if (checkuser) {
            mess = "Please check your email to verify your account!";
            String encodedPassword = Base64.getUrlEncoder().encodeToString(pass.getBytes());
            udao.addUser(new User(name, title, email, phone, encodedPassword, Date.valueOf(java.time.LocalDate.now()), "images/avatar/user_circle.png", "Deactive", 1));
            String maxId = udao.getMaxID();
            GmailHelper gmailHelper = new GmailHelper();
            String[] mailTo = {email};
            try {
                gmailHelper.sendFromGMail(gmailHelper.getUSER_NAME(), gmailHelper.getPASSWORD(),
                        mailTo, "[Activate your account in Mega Deal]",
                        "Hi you,\n\n" + "Click this link to activate your account, then you are able to access the system.\n"
                        + "http://localhost:8080/SWP391_G5/ActivateAccount?id=" + maxId
                        + "\n\n"
                        + "Regard,\n"
                        + "Mega Deal Support Team");
            } catch (MessagingException ex) {
                Logger.getLogger(RegisterServ.class.getName()).log(Level.SEVERE, null, ex);
            }
            request.setAttribute("messLogin", mess);
            dispath(request, response, "Login.jsp");
        } else {
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
