/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.free;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dell
 */
public class ActivateAccount extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idEncrypt = request.getQueryString();

        UserDAO dao = new UserDAO();

        int id = dao.getIDByEncryptId(idEncrypt);

        if (id == -1) {
            response.sendRedirect("ErrorPage");
        } else {
            dao.activateAccount("" + id);
            request.getRequestDispatcher("ActivateAccount.jsp").forward(request, response);
        }

    }

}
