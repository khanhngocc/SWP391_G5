/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.manager;

import controller.base.BaseRequiredLoginController;
import dal.ClassDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Classes;
import model.User;

/**
 *
 * @author INSPIRON 15-7559
 */
public class ClassShow extends BaseRequiredLoginController{

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String listtype = request.getParameter("list");
        HttpSession ses = request.getSession();
        UserDAO ud = new UserDAO();
        User x = (User)ses.getAttribute("user");
        int id = ud.getUser(x.getEmail()).getId();
        ClassDAO cd = new ClassDAO();
        List<Classes> lc = new ArrayList<Classes>();
        if(listtype.equals("All")) lc = cd.GetAllClass();
       else lc = cd.GetClassByUserID(id);
          List<Classes> lc5 = cd.GetTop5RecentClass();
        int pageSize = lc.size() % 4 == 0 ? lc.size() / 4 : lc.size() / 4 + 1;
        int currentPage;
        try {
            currentPage = Integer.parseInt(request.getParameter("page"));
        } catch (Exception e) {
            currentPage = 1;
        }
        request.setAttribute("lc", lc.subList(4 * (currentPage - 1), 4 * currentPage > lc.size() ? lc.size() : 4 * currentPage));
        request.setAttribute("pagesize", pageSize);
        request.setAttribute("page", currentPage);
          request.setAttribute("lc5", lc5);
   
        
        request.getRequestDispatcher("ClassInfo.jsp").forward(request, response);
        
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("search");
        ClassDAO cd  = new ClassDAO();
        List<Classes> lc = cd.GetClassByName(search);
        request.setAttribute("lc", lc);
         request.getRequestDispatcher("ClassInfo.jsp").forward(request, response);
    }

    
}
