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
public class SearchUserController extends BaseRequiredLoginController {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String email= request.getParameter("email");
        UserDAO udao=new UserDAO();
        RollDAO rdao=new RollDAO();
        ArrayList<User>listUser=udao.search(name, email);
        ArrayList<Roll>listRoll=rdao.getAllRoll();
        request.setAttribute("listUser", listUser);
        request.setAttribute("listRoll", listRoll);
        request.getRequestDispatcher("../admin/Home.jsp").forward(request, response);
        
    }
    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    

}
