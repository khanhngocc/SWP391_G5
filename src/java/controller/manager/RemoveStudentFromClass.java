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
public class RemoveStudentFromClass extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int id = Integer.parseInt(request.getParameter("id"));
    int cid = Integer.parseInt(request.getParameter("cid"));
    ClassDAO cd = new ClassDAO();
    UserDAO ud = new UserDAO();
    
    String name = ud.getUser(id).getFullname();
    String mess = "";
    if(cd.DeleteUserFromClass(id, cid)>0){ 
     //send mail//
            GmailHelper gm = new GmailHelper();
            String[] rep = {ud.getUser(id).getEmail()};
            String subject = "[Thank You!!]";
            String body = "Hi you,\n\n"
                    + "You have been Delete from "+cd.GetClassByClassID(cid).getName()
                    + " because of your class rule violation"+"\n"
                    + "Regard,\n"
                    + "Mega Deal Support Team";
            try {
                gm.sendFromGMail(gm.getUSER_NAME(), gm.getPASSWORD(), rep, subject, body);
                response.sendRedirect("ListStudentInClass?id="+cid);
            } catch (MessagingException ex) {
                ex.printStackTrace();
            }
    }
    else{
      
        List<User> ul = cd.GetUsersByClassID(cid);
        request.setAttribute("classid",cid);
        request.setAttribute("ul",ul);
        mess+="Deleted "+name+" out of this class!!";
       
        request.setAttribute("mess", mess);
        request.getRequestDispatcher("ListStudentInClass.jsp").forward(request, response);
        
    }
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
