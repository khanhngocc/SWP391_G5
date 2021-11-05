/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.common;

import dal.AccountForgotDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;

import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.AccountForgot;
import utilities.MD5Helper;

/**
 *
 * @author dell
 */
public class ResetPassword extends HttpServlet {

    private AccountForgotDAO accDAO = new AccountForgotDAO();
    private int idReset;

    private void excuteGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int iduser_reset = accDAO.getUserID(idReset);
        UserDAO userDAO = new UserDAO();
        request.setAttribute("emailReset", userDAO.getUser(iduser_reset).getEmail());

        String timeEnded = accDAO.getExpiredTime(idReset);
        String[] parts = timeEnded.split(":");
        request.setAttribute("hour", parts[0]);
        request.setAttribute("minus", parts[1]);
        request.setAttribute("second", parts[2]);

        String dateCreated = accDAO.getDateCreated(idReset);
        parts = dateCreated.split("-");
        request.setAttribute("year", parts[0]);
        request.setAttribute("month", Integer.valueOf(parts[1]) - 1);
        request.setAttribute("day", parts[2]);

        request.getRequestDispatcher("ResetPassword.jsp").forward(request, response);
    }

    private void excutePost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String password = request.getParameter("newpass");
        String email = request.getParameter("email");

        UserDAO userDAO = new UserDAO();
        MD5Helper md5 = new MD5Helper();
        String encodedPassword = null;
        try {
            encodedPassword = md5.encryptString(password);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(ResetPassword.class.getName()).log(Level.SEVERE, null, ex);
        }
        userDAO.changePassword(email, encodedPassword);

        AccountForgot acc = new AccountForgot();
        acc.setId(idReset);
        acc.setAllowedReset("0");

        request.setAttribute("messLogin", "reset password successfully, now you are able to login");
        request.getRequestDispatcher("Login.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (isExpiredLink(request.getQueryString()) == true) {
            response.sendRedirect("ErrorPage");
        } else {
            excuteGet(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (isExpiredLink(request.getParameter("idEncoded")) == true) {
            response.sendRedirect("ErrorPage");
        } else {
            excutePost(request, response);
        }

    }

    private boolean isExpiredLink(String idEncoded) {

        idReset = accDAO.getIDByEncryptId(idEncoded);

        if(idReset == -1)
             return true;
        
        SimpleDateFormat formatdate = new SimpleDateFormat("yyyy-MM-dd");
        // check date
        try {
            Date current_date = formatdate.parse(java.time.LocalDate.now().toString());
            Date created_date = formatdate.parse(accDAO.getDateCreated(idReset));

            if (current_date.after(created_date)) {
                return true;
            }

        } catch (ParseException ex) {
            Logger.getLogger(ResetPassword.class.getName()).log(Level.SEVERE, null, ex);
        }

        // check time
        Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");

        String current_time = sdf.format(cal.getTime());
        String ended_time = accDAO.getExpiredTime(idReset);

        String[] parts = current_time.split(":");
        Calendar cal_current_time = Calendar.getInstance();
        cal_current_time.set(Calendar.HOUR_OF_DAY, Integer.parseInt(parts[0]));
        cal_current_time.set(Calendar.MINUTE, Integer.parseInt(parts[1]));
        cal_current_time.set(Calendar.SECOND, Integer.parseInt(parts[2]));
        if (parts[0].equals("0")) {
            cal_current_time.add(Calendar.DATE, 1);
        }

        parts = ended_time.split(":");
        Calendar cal_ended_time = Calendar.getInstance();
        cal_ended_time.set(Calendar.HOUR_OF_DAY, Integer.parseInt(parts[0]));
        cal_ended_time.set(Calendar.MINUTE, Integer.parseInt(parts[1]));
        cal_ended_time.set(Calendar.SECOND, Integer.parseInt(parts[2]));
        //check if 24h
        if (parts[0].equals("0")) {
            cal_ended_time.add(Calendar.DATE, 1);
        }

        if (cal_current_time.after(cal_ended_time)) {
            return true;
        } else if (cal_current_time.equals(cal_ended_time)) {
            return true;
        } else {
            return false;
        }

    }

}
