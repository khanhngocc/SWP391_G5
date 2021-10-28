/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.customer;

import controller.base.BaseRequiredLoginController;
import dal.QuestionDAO;
import dal.QuizDAO;
import dal.Quizzes_QuestionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Question;
import model.Quizzes;
import model.Quizzes_Question;

/**
 *
 * @author Admin
 */
public class AddQuestionToPracticeController extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        QuestionDAO qdao = new QuestionDAO();
        ArrayList<Question> question = qdao.getQuestions();
        request.setAttribute("qqdao", new Quizzes_QuestionDAO());
        request.setAttribute("id", id);
        request.setAttribute("question", question);
        request.getRequestDispatcher("QuestionListToPractice.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String checkbox[] = request.getParameterValues("checkbox");
        QuizDAO qdao = new QuizDAO();
        Quizzes_QuestionDAO qqdao = new Quizzes_QuestionDAO();
        qqdao.removeQQ(id);
        for (int i = 0; i < checkbox.length; i++) {
            qqdao.addQuizzes_Question(new Quizzes_Question(id, Integer.parseInt(checkbox[i])));
        }
        Quizzes q = qdao.getQuizByID(request.getParameter("id"));
        q.setNumber_of_question(checkbox.length);
        qdao.UpdateQuizzes(q);
        response.sendRedirect(""+id);
    }


}