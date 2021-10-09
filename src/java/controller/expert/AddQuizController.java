/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.expert;

import com.oreilly.servlet.MultipartRequest;
import controller.base.BaseRequiredLoginController;
import dal.QuizDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Quizzes;
import model.User;

/**
 *
 * @author Admin
 */
public class AddQuizController extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {       
        response.sendRedirect("AddQuiz.jsp");
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String webPath = getServletContext().getRealPath("/");
        StringBuilder sb = new StringBuilder(webPath.replace("\\build", "").replace("\\", "/"));
        sb.append("images/thumbnail");
        
        MultipartRequest m = new MultipartRequest(request, sb.toString());
        String fileNameImgPath = m.getFile("fname").toString();
        try{
        int indexOflast = fileNameImgPath.lastIndexOf("\\");
        String fileNameImg = fileNameImgPath.substring(indexOflast + 1, fileNameImgPath.length());
        String title = m.getParameter("title");
        String description = m.getParameter("description");
        int subject_id = Integer.parseInt(m.getParameter("subject"));
        int level = Integer.parseInt(m.getParameter("level"));
        String type = m.getParameter("type");
        int duration = Integer.parseInt(m.getParameter("duration"));
        User user = (User) session.getAttribute("user");
        
        UserDAO udao = new UserDAO();
        QuizDAO qdao = new QuizDAO();
        qdao.addQuiz(new Quizzes(title, description, subject_id, level, type, udao.getUser(user.getEmail()).getId(), 0, duration, 0.6f, "images/thumbnail/" + fileNameImg));
        request.setAttribute(title, "title");
        request.getRequestDispatcher("AddQuestion").forward(request, response);
        }
        catch(Exception e){
            String mess="Cannot convert string to integer!";
            request.setAttribute(mess, "mess");
            request.getRequestDispatcher("AddQuiz.jsp").forward(request, response);
        }
               
    }

}
