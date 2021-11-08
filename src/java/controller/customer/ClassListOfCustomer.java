/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.customer;

import controller.base.BaseRequiredLoginController;
import dal.ClassDAO;
import java.io.IOException;
import java.io.PrintWriter;
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
public class ClassListOfCustomer extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       ClassDAO cd = new ClassDAO();
       String id = request.getParameter("id");
        List<Classes> list = cd.GetAllClassByUserID(Integer.parseInt(id));
        request.setAttribute("listclass", list);
        request.getRequestDispatcher("ListClasses.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
