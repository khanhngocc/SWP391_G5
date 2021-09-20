/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.Test_Quiz_DAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class LinkToTest extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("FormTest.jsp");
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int test_id = Integer.parseInt(request.getParameter("testId"));
        String mess;
        Test_Quiz_DAO tqdao = new Test_Quiz_DAO();
        if(tqdao.getTestById(test_id)==null){ 
            mess="Test Not Found";
            request.setAttribute("mess", mess);
            request.getRequestDispatcher("FormTest.jsp").forward(request, response);
        } else {
            response.sendRedirect("DoTest?testId="+test_id);
        }
    }

}
