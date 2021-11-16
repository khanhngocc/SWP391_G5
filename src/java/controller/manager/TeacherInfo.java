/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.manager;

import controller.base.BaseRequiredLoginController;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.EndpointReference;
import model.User;

/**
 *
 * @author INSPIRON 15-7559
 */
public class TeacherInfo extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession ses  = request.getSession(); 
    UserDAO ud = new UserDAO();
    String id = request.getParameter("id");
    String email = ((User)(ses.getAttribute("user"))).getEmail();
    request.setAttribute("user", ud.getUser(email));
    request.setAttribute("id", id);
    
    request.getRequestDispatcher("TeacherInfo.jsp").forward(request, response);
      
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }


}
