/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import controller.BaseRequiredLoginController;
import dal.RollDAO;
import dal.UserDAO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Roll;
import model.User;

/**
 *
 * @author zzpho
 */
public class AddUserController extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RollDAO rdao=new RollDAO();
        ArrayList<Roll>listRoll=rdao.getAllRoll();
        request.setAttribute("listRoll", listRoll);
        request.getRequestDispatcher("../admin/addUser.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String email = request.getParameter("email");
       String fullname = request.getParameter("fullname");
       String phone = request.getParameter("phone");
       boolean gender = request.getParameter("gender").equals("male");
       String password=request.getParameter("password");
       int rid=Integer.parseInt(request.getParameter("rid"));
       Roll r=new Roll();
       r.setId(rid);
       User user=new User();
       user.setEmail(email);
       user.setFullname(fullname);
       user.setPhone(phone);
       user.setGender(gender);
       user.setPassword(password);
       user.setRoll(r);
       UserDAO udao=new UserDAO();
       udao.addUserbyAdmin(user);
       response.sendRedirect(request.getContextPath()+"/admin/list");
    }
}
