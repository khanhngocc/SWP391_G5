/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.manager;

import controller.base.BaseRequiredLoginController;
import dal.SubjectDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Subject;
import model.User;

/**
 *
 * @author dell
 */
public class UpdateSubject extends BaseRequiredLoginController {

  
    
    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        SubjectDAO dao = new SubjectDAO();
        Subject subject = dao.getSubject(Integer.valueOf(id), "");
        request.setAttribute("subject", subject);
        request.getRequestDispatcher("UpdateSubject.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        
     
        String id = request.getParameter("id");
        String status = request.getParameter("status");
        String title = request.getParameter("title");
        String price = request.getParameter("price");
        
        String salePrice = request.getParameter("salePrice");
        
        if (salePrice.equals("")) {
            salePrice="0";
        }
        
        
        float num_price = 0;
        float num_sale = 0;

       
        try {
            num_price = Float.parseFloat(price);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        try {
            num_sale = Float.parseFloat(salePrice);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        Subject subject = new Subject();
        subject.setId(Integer.valueOf(id));
        subject.setStatus(status);
        subject.setTitle(title);
        subject.setPrice(num_price);
        subject.setSalePrice(num_sale);

       
        SubjectDAO dao = new SubjectDAO();
        dao.updateSubject(subject);

        response.sendRedirect("SubjectList");
    }

}