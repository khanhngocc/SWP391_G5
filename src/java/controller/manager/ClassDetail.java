/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.manager;

import controller.base.BaseRequiredLoginController;
import dal.ClassDAO;
import dal.LessonDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Classes;
import model.Lesson;
import model.User;

/**
 *
 * @author INSPIRON 15-7559
 */
public class ClassDetail extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        HttpSession ses = request.getSession();
        UserDAO ud = new UserDAO();
        User x = ud.getUser(((User)(ses.getAttribute("user"))).getEmail());
        int rid = x.getRollId();
        ClassDAO cd = new ClassDAO();
        List<Classes> lc = cd.GetClassByUserID(Integer.parseInt(id));
        LessonDAO ld = new LessonDAO();
        List<Lesson> ll = ld.GetAllLessonByClassId(Integer.parseInt(id));
       Classes classes = cd.GetClassByClassID(Integer.parseInt(id));
        int pageSize = ll.size() % 4 == 0 ? ll.size() / 4 : ll.size() / 4 + 1;//trang 1 thi no vx phai de day chu 
        int currentPage;
        try {
            currentPage = Integer.parseInt(request.getParameter("page"));
        } catch (Exception e) {
            currentPage = 1;
        }
        request.setAttribute("ll", ll.subList(4 * (currentPage - 1), 4 * currentPage > ll.size() ? ll.size() : 4 * currentPage));
        request.setAttribute("pagesize", pageSize);
        request.setAttribute("page", currentPage);
        request.setAttribute("ll", ll);
        request.setAttribute("cl", classes);
        request.setAttribute("rid", rid);
        request.getRequestDispatcher("ClassDetail.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
    }

    
        
}
