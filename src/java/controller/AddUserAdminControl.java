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
import utilities.GmailHelper;

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
        String mess = "";
        boolean checkuser = true;
        if (udao.getUser(email) != null) {
            mess = "This email has been used, re-enter!";
            checkuser = false;
        }
        if (validate(email) == false) {
            mess = "This email has wrong format!";
            checkuser = false;
        }
        if (pass.length() < 8) {
            mess = "PassWord must be more than 8 characters, re-enter!";
            checkuser = false;
        }
        if (checkuser) {
            mess = "Sign-up success!!";
            udao.addUser(new User(name, title, email, phone, pass, Date.valueOf(java.time.LocalDate.now()), "images/avatar/"+fileNameImg, status, role));
            //send mail//
            GmailHelper gm = new GmailHelper();
            String[] rep = {email};
            String subject = "Request to sign-in our web";
            String body = "Your password to our web:\n" + pass;
            try {
                gm.sendFromGMail(gm.getUSER_NAME(), gm.getPASSWORD(), rep, subject, body);
                request.setAttribute("mess", mess);
                request.getRequestDispatcher("AddUserAdmin.jsp").forward(request, response);
            } catch (MessagingException ex) {
                Logger.getLogger(AddUserAdminControl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}