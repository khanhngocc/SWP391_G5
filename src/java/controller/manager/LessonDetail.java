/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.manager;

import controller.base.BaseRequiredLoginController;
import dal.LessonDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Lesson;

/**
 *
 * @author INSPIRON 15-7559
 */
public class LessonDetail extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
String lid = request.getParameter("id");
String cid = request.getParameter("cid");
LessonDAO ld = new LessonDAO();
Lesson les = ld.GetLessonById(Integer.parseInt(lid));
request.setAttribute("les", les);
request.setAttribute("cid", cid);
request.getRequestDispatcher("LessonDetail.jsp").forward(request, response);

        }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

   
}
