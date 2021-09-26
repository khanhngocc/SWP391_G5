/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.oreilly.servlet.MultipartRequest;
import static controller.RegisterServ.validate;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author Admin
 */
public class AddUserAdminControl extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("AddUserAdmin.jsp");
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String webPath = getServletContext().getRealPath("/");
        StringBuilder sb = new StringBuilder(webPath.replace("\\build", "").replace("\\", "/"));
        sb.append("images/avatar");

        // get file name of img uploaded
        MultipartRequest m = new MultipartRequest(request, sb.toString());
        String fileNameImgPath = m.getFile("fname").toString();
        int indexOflast = fileNameImgPath.lastIndexOf("\\");
        String fileNameImg = fileNameImgPath.substring(indexOflast + 1, fileNameImgPath.length());
        String email = m.getParameter("email");
        String name = m.getParameter("name");
        String title = m.getParameter("title");
        String phone = m.getParameter("phone");
        String pass = m.getParameter("password");
        int role = Integer.parseInt(m.getParameter("role"));
        String status = m.getParameter("status");
        if (status.equals("1")) {
            status = "Active";
        }
        if (status.equals("2")) {
            status = "Deactive";
        }
        UserDAO udao = new UserDAO();
        String message = "";
        String mess = "";
        boolean checkuser = true;
        if (udao.getUser(email) != null) {
            mess = "This email has been used, Click Sign-up again!";
            checkuser = false;
        }
        if (validate(email) == false) {
            mess = "This email has wrong format!";
            checkuser = false;
        }
        if (pass.length() < 8) {
            mess = "PassWord must be more than 8 characters, Click Sign-up again!";
            checkuser = false;
        }
        if (checkuser) {
            mess = "Sign-up success, login now!!";
            udao.addUser(new User(name, title, email, phone, pass, Date.valueOf(java.time.LocalDate.now()), "images/avatar"+fileNameImg, status, role));
            request.setAttribute("mess", mess);
            //send mail//
            String recover_password = pass;        
        RECIPIENT = email;
        String from = USER_NAME;
        String Xpass = PASSWORD;
        String[] to = {RECIPIENT}; // list of recipient email addresses
        String subject = "Welcom to our website!";
        String body = "Hi you," + "\nYour new password is: " + recover_password  + "\n" + "Best regard," + "\nMegaDeal Technical Support";

        try {
            sendFromGMail(from, Xpass, to, subject, body);
            request.setAttribute("mess", message);
            request.getRequestDispatcher("ForgotPassword.jsp").forward(request, response);
        } catch (MessagingException ex) {
            Logger.getLogger(ForgotPassword.class.getName()).log(Level.SEVERE, null, ex);
        }
            //send mail//
            dispath(request, response, "/AddUserAdmin.jsp");
        } else {
            
            request.setAttribute("mess", mess);
            dispath(request, response, "/AddUserAdmin.jsp");
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

    private static void sendFromGMail(String from, String pass, String[] to, String subject, String body) throws NoSuchProviderException, MessagingException {
        Properties props = System.getProperties();
        String host = "smtp.gmail.com";
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.user", from);
        props.put("mail.smtp.password", pass);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");

        Session session = Session.getDefaultInstance(props);
        MimeMessage message = new MimeMessage(session);

        try {
            message.setFrom(new InternetAddress(from));
            InternetAddress[] toAddress = new InternetAddress[to.length];

            // To get the array of addresses
            for (int i = 0; i < to.length; i++) {
                toAddress[i] = new InternetAddress(to[i]);
            }

            for (int i = 0; i < toAddress.length; i++) {
                message.addRecipient(Message.RecipientType.TO, toAddress[i]);
            }

            message.setSubject(subject);
            message.setText(body);
            Transport transport = session.getTransport("smtp");
            transport.connect(host, from, pass);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
        } catch (AddressException ae) {
            ae.printStackTrace();
        } catch (MessagingException me) {
            me.printStackTrace();
        }
    }
}
