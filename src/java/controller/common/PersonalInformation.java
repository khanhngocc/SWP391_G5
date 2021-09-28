/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.common;

import controller.base.BaseRequiredLoginController;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author LEGION
 */
public class PersonalInformation extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        UserDAO dao = new UserDAO();
        User user = dao.getUser(email);
        request.setAttribute("user",user);
        PrintWriter out = response.getWriter();
        
        request.getRequestDispatcher("UpdateInformation.jsp").forward(request, response);

    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         String email = request.getParameter("email");
         String fullname = request.getParameter("name");
         String phone = request.getParameter("phone");
         String gender = request.getParameter("gender");
         boolean gen = gender.equals("male")?true:false;
         UserDAO dao = new UserDAO();
         String mess;
        int n=  dao.UpdateUser(email, fullname, phone, gen);
        if(n>0){
            mess = "Update Susssfully!";
        }else{
            mess = "Fail to update information";
        }
        request.setAttribute("mess", mess);
         User user = dao.getUser(email);
        request.setAttribute("user",user);
         
         request.getRequestDispatcher("UpdateInformation.jsp").forward(request, response);
        
    }

}
