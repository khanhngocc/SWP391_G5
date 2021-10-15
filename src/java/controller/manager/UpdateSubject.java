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

    private String patternFloat ="^([+-]?\\d*\\.?\\d*)$";
    
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
        
        
        String message = "create successfully!";
        String id = request.getParameter("id");
        String status = request.getParameter("status");
        String title = request.getParameter("title");
        String price = request.getParameter("price");
        System.out.println("pice: "+price);
        String salePrice = request.getParameter("salePrice");
        float num_price = 0;
        float num_sale = 0;

        if (title.length() > 50) {
            message = "length of title must be less than 50 characters";
            request.setAttribute("messUpdateSubject", message);
            request.getRequestDispatcher("UpdateSubject.jsp").forward(request, response);
        }

        if (price.matches(patternFloat) == false) {
            message = "price is not a number";
            request.setAttribute("messUpdateSubject", message);
            request.getRequestDispatcher("UpdateSubject.jsp").forward(request, response);
        }

        if (salePrice.matches(patternFloat) == false) {
            message = "sale price is not a number";
            request.setAttribute("messUpdateSubject", message);
            request.getRequestDispatcher("UpdateSubject.jsp").forward(request, response);
        }

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