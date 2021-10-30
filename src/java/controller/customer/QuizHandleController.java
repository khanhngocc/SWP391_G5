/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.customer;

import controller.base.BaseRequiredLoginController;
import model.*;
import dal.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class QuizHandleController extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String id = request.getParameter("id");
        QuizDAO qdao = new QuizDAO();
        QuestionDAO qqdao = new QuestionDAO();
        Quizzes quiz = qdao.getQuizByID(id);

        ArrayList<Question> questions = qqdao.getQuestionByQuizId(Integer.parseInt(id));
        int pageSize = questions.size();
        int currentPage;
        try {
            currentPage = Integer.parseInt(request.getParameter("page"));
        } catch (Exception e) {
            currentPage = 1;
            ArrayList<Question> answer = new ArrayList<>();
            for (Question question : questions) {
                answer.add(new Question(question.getId(), "Not yet answer", ""));
            }
            session.setAttribute("answer", answer);
            Quizzes q = new Quizzes();
            q.setId(quiz.getId());
            q.setTitle(quiz.getTitle());
            q.setDuration(quiz.getDuration());
            q.setRate(quiz.getRate());
            session.setAttribute("timer", q);
        }
        request.setAttribute("quiz", quiz);
        request.setAttribute("question", questions.get(currentPage - 1));
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("page", currentPage);
        request.getRequestDispatcher("DoQuiz.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}