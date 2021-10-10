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
import model.Quizzes;

/**
 *
 * @author INSPIRON 15-7559
 */
public class EditQuizController extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        QuizDAO quizd = new QuizDAO();
        Quizzes quiz = quizd.getQuizByID(id);
        request.setAttribute("quiz", quiz);
        request.getRequestDispatcher("EditQuiz.jsp").forward(request, response);
        
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String fileNameImg = "";
        String webPath = getServletContext().getRealPath("/");
        StringBuilder sb = new StringBuilder(webPath.replace("\\build", "").replace("\\", "/"));
        sb.append("images/thumbnail");

        // get file name of img uploaded
        MultipartRequest m = new MultipartRequest(request, sb.toString());

        if (m.getFile("fname") != null) {
            String fileNameImgPath = m.getFile("fname").toString();
            int indexOflast = fileNameImgPath.lastIndexOf("\\");
            fileNameImg = fileNameImgPath.substring(indexOflast + 1, fileNameImgPath.length());
        }
       
        String title = m.getParameter("title");
        String des = m.getParameter("description");
        String subject = m.getParameter("subject");
        String level = m.getParameter("level");
        String type = m.getParameter("type");
        String dur = m.getParameter("duration");
        String rate = m.getParameter("rate");
        QuizDAO qud = new QuizDAO();
        Quizzes quizess = qud.getQuizByID(id);
        Quizzes newq = new Quizzes( Integer.parseInt(id),title, des, Integer.parseInt(subject) , Integer.parseInt(level), type , quizess.getUser_id(), quizess.getNumber_of_question(), Integer.parseInt(dur), Float.parseFloat(rate), "images/thumbnail/" + fileNameImg);
        qud.UpdateQuizzes(newq);
     
 
        
        response.sendRedirect("QuizList");
    }
    }

 