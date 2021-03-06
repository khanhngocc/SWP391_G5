/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
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

    public static final Pattern VALID_EMAIL_ADDRESS_REGEX = 
    Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$", Pattern.CASE_INSENSITIVE);

     public static boolean validate(String emailStr) {
        Matcher matcher = VALID_EMAIL_ADDRESS_REGEX.matcher(emailStr);
        return matcher.find();
}

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
     
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        boolean gender;
        String gender1 = request.getParameter("gender");
        if(gender1.equals("male")) gender = true; 
        else gender = false;
        String phone = request.getParameter("phone");
        String pass = request.getParameter("pass");
        String repass = request.getParameter("repass");
        UserDAO udao = new UserDAO();
         String mess = "";
                boolean checkuser = true;
                if(udao.getUser(email)!=null){
                     mess = "This email has been used, Click Sign-up again!";
                    checkuser = false;
                }
                if( validate(email)==false){
                    mess = "This email has wrong format!";
                    checkuser= false;
                }
                if(pass.length()<8){
                    mess = "PassWord must be more than 8 characters, Click Sign-up again!";
                    checkuser = false;
                }
                if(!pass.equals(repass)){
                    mess = "PassQord and Re-PassWord doesnot match, Click Sign-up again!";
                    checkuser = false;
                }
                if(checkuser){
                    mess = "Sign-up success, login now!!";
                    udao.addUser(new User(name, gender, email, phone, pass, Date.valueOf(java.time.LocalDate.now()), "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.dreamstime.com%2Fdefault-avatar-profile-icon-vector-social-media-user-portrait-image176256935&psig=AOvVaw2gAeDc-Kuapu122Fr5DERD&ust=1631438027091000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCPjl57PK9vICFQAAAAAdAAAAABAD", 1));
                    request.setAttribute("mess", mess);
                    dispath(request, response, "/Login.jsp");
                }else{
                    request.setAttribute("mess", mess);
                    dispath(request, response, "/Login.jsp");
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
