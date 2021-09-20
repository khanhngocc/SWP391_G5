/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.Test_Quiz_DAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Test;

/**
 *
 * @author Admin
 */
public class SearchTestControl extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processPost(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        Test_Quiz_DAO tqdao = new Test_Quiz_DAO();
        List<Test> test = tqdao.getTestByTitle(title);
        int pageSize = test.size()%3==0?test.size()/3:test.size()/3+1;
            int currentPage;
            try {
                currentPage = Integer.parseInt(request.getParameter("page"));
            } catch (Exception e) {
                currentPage = 1;
            }        
        request.setAttribute("title",title);
        request.setAttribute("test", test.subList(3*(currentPage-1), 3*currentPage>test.size() ? test.size() : 3*currentPage));    
        request.setAttribute("pagesize", pageSize);
        request.setAttribute("page", currentPage);
        request.getRequestDispatcher("SearchResult.jsp").forward(request, response);
    }
  
}
