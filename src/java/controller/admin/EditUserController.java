/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import controller.BaseRequiredLoginController;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author zzpho
 */
public class EditUserController extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        UserDAO dao = new UserDAO();
        User user = dao.getUser(email);
        request.setAttribute("user",user);
        request.getRequestDispatcher("../admin/Edit.jsp").forward(request, response); 
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String email = request.getParameter("email");
       String fullname = request.getParameter("fullname");
       String phone = request.getParameter("phone");
       boolean gender = request.getParameter("gender").equals("male");
       String password=request.getParameter("password");
       User user=new User();
       user.setEmail(email);
       user.setFullname(fullname);
       user.setPhone(phone);
       user.setGender(gender);
       user.setPassword(password);
       String mess;
       UserDAO dao = new UserDAO();
       int n= dao.UpdateUserByAdmin(user);
       if(n>0){
            mess = "Update Susssfully!";
            response.sendRedirect(request.getContextPath()+"/admin/list");
       }else{
            mess = "Fail to update information";
            processGet(request, response);
       }
    }
}
