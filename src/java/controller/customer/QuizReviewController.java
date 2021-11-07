/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.customer;

import controller.base.BaseRequiredLoginController;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.*;
import dal.*;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class QuizReviewController extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        QuizDAO qdao = new QuizDAO();
        QuestionDAO qqdao = new QuestionDAO();
        Answer_HistoryDAO ahdao = new Answer_HistoryDAO();
        HistoryDAO hdao = new HistoryDAO();
        History history = hdao.getHistorybyID(Integer.parseInt(id));
        Quizzes x = qdao.getQuizByID(String.valueOf(history.getQuiz_id()));
        ArrayList<Answer_History> listCheckAnswer = ahdao.getAnswerHistory(history.getId(), 0);
        ArrayList<Question> question = qqdao.getQuestionInQuiz(x.getId());
        int currentPage = 0;
        try {
            currentPage = Integer.parseInt(request.getParameter("page"));
        } catch (Exception e) {
            currentPage = 1;
        }
        ArrayList<Answer_History> correct = new ArrayList<>();
        ArrayList<Answer_History> unCorrect = new ArrayList<>();
        for (Answer_History ah : listCheckAnswer) {
            if(!ah.getAnswer().isEmpty()){
                if(ah.getAnswer().equals(qqdao.getQuestionById(String.valueOf(ah.getQuestion_id())).getOption_correct())){
                    correct.add(ah);
                } else {
                    unCorrect.add(ah);
                }
            }
        }
        Question q = qqdao.getQuestionById(String.valueOf(listCheckAnswer.get(currentPage-1).getQuestion_id()));
        request.setAttribute("history", history);
        request.setAttribute("x", x);
        request.setAttribute("CheckAnswer", listCheckAnswer.get(currentPage-1));
        request.setAttribute("listCheckAnswer", listCheckAnswer);
        request.setAttribute("quest", q);
        request.setAttribute("page", currentPage);
        request.setAttribute("id", id);
        request.setAttribute("qq", new QuestionDAO());
        request.getRequestDispatcher("QuizReview.jsp").forward(request, response);
        
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}