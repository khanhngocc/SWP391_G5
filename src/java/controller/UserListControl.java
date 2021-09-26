/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.UserDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author Admin
 */
public class UserListControl extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDAO udao = new UserDAO();
        List<User> userlist = udao.getAllUser();
        int pageSize = userlist.size() % 10 == 0 ? userlist.size() / 10 : userlist.size() / 10 + 1;
        int currentPage;
        try {
            currentPage = Integer.parseInt(request.getParameter("page"));
        } catch (Exception e) {
            currentPage = 1;
        }
        request.setAttribute("list", userlist.subList(10 * (currentPage - 1), 10 * currentPage > userlist.size() ? userlist.size() : 10 * currentPage));
        request.setAttribute("pagesize", pageSize);
        request.setAttribute("page", currentPage);
        request.getRequestDispatcher("UserList.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
