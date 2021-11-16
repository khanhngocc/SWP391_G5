/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.manager;

import controller.base.BaseRequiredLoginController;
import dal.ClassDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Classes;

/**
 *
 * @author INSPIRON 15-7559
 */
public class ClassManager extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ClassDAO cd = new ClassDAO();
     
        List<Classes> lc5 = cd.GetTop5RecentClass();
        List<Classes> lc = cd.GetAllClass();
          int pageSize = lc.size() % 6 == 0 ? lc.size() / 6 : lc.size() / 6 + 1;
        int currentPage;
        try {
            currentPage = Integer.parseInt(request.getParameter("page"));
        } catch (Exception e) {
            currentPage = 1;
        }
        request.setAttribute("lc", lc.subList(6 * (currentPage - 1), 6 * currentPage > lc.size() ? lc.size() : 6 * currentPage));
        request.setAttribute("pagesize", pageSize);
        request.setAttribute("page", currentPage);
          request.setAttribute("lc5", lc5);
          
        
        request.getRequestDispatcher("ClassInfo.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

   
}
