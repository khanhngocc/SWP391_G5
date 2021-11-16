/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.manager;

import com.oreilly.servlet.MultipartRequest;
import controller.base.BaseRequiredLoginController;
import dal.ClassDAO;
import dal.LessonDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Classes;

/**
 *
 * @author INSPIRON 15-7559
 */
public class AddLesson extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        ClassDAO cd = new ClassDAO();
        Classes cl = cd.GetClassByClassID(Integer.parseInt(id));
        request.setAttribute("cid", id);
        request.setAttribute("cl", cl);
        request.getRequestDispatcher("AddLesson.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
        String cid = request.getParameter("cid");
        String mess ="";
        LessonDAO ld = new LessonDAO();
        String name = request.getParameter("name");
        String exdate = request.getParameter("exdate");
        String id = request.getParameter("cid");
        String content = request.getParameter("content");
        if(ld.AddLessonToClass(name, content,Integer.parseInt(id) , exdate)>0) response.sendRedirect("ClassDetail?id="+cid);
        else{
            mess+="Add error @@";
            request.setAttribute("cid", cid);
            request.setAttribute("mess", mess);
            request.getRequestDispatcher("AddLesson.jsp").forward(request, response);
        }
    }

   
}
