/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.manager;

import controller.admin.AddUserAdminControl;
import controller.base.BaseRequiredLoginController;
import dal.ClassDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;
import utilities.GmailHelper;

/**
 *
 * @author INSPIRON 15-7559
 */
public class AddStudentToClass extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      ClassDAO cd = new ClassDAO();
      int id  = Integer.parseInt(request.getParameter("id"));
      List<User> l = cd.GetUserOutsideOfClass(id);
      request.setAttribute("los", l);
      request.setAttribute("cid", id);
      request.getRequestDispatcher("AddStudentToClass.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        GmailHelper gm = new GmailHelper();
        String[] uid = request.getParameterValues("add-student");
        String id = request.getParameter("classid");
        UserDAO ud = new UserDAO();
        PrintWriter p = response.getWriter();
        ClassDAO cd = new ClassDAO();
        List<User> lu = new ArrayList<>();
       
        for (String uuid : uid) {
          
           
            String[] rep = {ud.getUser(Integer.parseInt(uuid)).getEmail()};          
            
            String subject = "[Welcome to my class!]";
            String body = "Hi you,\n\n"+
                  "You have add to class" + cd.GetClassByClassID(Integer.parseInt(id)).getName()
                    + "\n\n"
                    + "Regard,\n"
                    + "Mega Deal Support Team";
            cd.InsertUserToClass(Integer.parseInt(uuid), Integer.parseInt(id));
            try {
                gm.sendFromGMail(gm.getUSER_NAME(), gm.getPASSWORD(), rep, subject, body);
                
            
            } catch (MessagingException ex) {
ex.printStackTrace();            }
            
        }
//        for (String string : useremail) {
//            p.print(string);
//        }
//            p.print(cd.GetClassByClassID(Integer.parseInt(id)).getName());
          response.sendRedirect("ListStudentInClass?id="+id);
           
        
       
       
    }

   
}
