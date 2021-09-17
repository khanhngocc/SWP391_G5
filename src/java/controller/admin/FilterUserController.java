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
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Roll;
import model.User;

/**
 *
 * @author zzpho
 */
public class FilterUserController extends BaseRequiredLoginController {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int rid = Integer.parseInt(request.getParameter("rid"));
        ArrayList<User> list;
        UserDAO udao = new UserDAO();
        RollDAO rdao = new RollDAO();
        if (rid == -1) {
            list = udao.getAllUser();
        } else {
            list = udao.getAllUserByrollid(rid);
        }
        List<Roll> listRoll = rdao.getAllRoll();
        request.setAttribute("listUser", list);
        request.setAttribute("listRoll", listRoll);
        request.setAttribute("rid", rid);
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
