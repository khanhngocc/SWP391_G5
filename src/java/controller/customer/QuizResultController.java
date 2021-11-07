/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.customer;

import controller.base.BaseRequiredLoginController;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServlet;
import dal.*;
import java.util.ArrayList;
import model.*;

/**
 *
 * @author Admin
 */
public class QuizResultController extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        HistoryDAO hdao = new HistoryDAO();
        Answer_HistoryDAO ahdao = new Answer_HistoryDAO();
        QuizDAO qdao = new QuizDAO();
        SettingDAO stdao = new SettingDAO();
        QuestionDAO qqdao = new QuestionDAO();
        History history = hdao.getHistorybyID(Integer.parseInt(id));
        Quizzes x = qdao.getQuizByID(String.valueOf(history.getQuiz_id()));
        ArrayList<Answer_History> listAnswer = ahdao.getAnswerHistory(history.getId(), 1);
        ArrayList<Answer_History> listUnanswer = ahdao.getAnswerHistory(history.getId(), -1);
        ArrayList<Answer_History> listCheckAnswer = ahdao.getAnswerHistory(history.getId(), 0);
        ArrayList<Question> question = qqdao.getQuestionInQuiz(x.getId());
        ArrayList<Setting> listCategory = stdao.getListSettingByType("Question Category");
        int[] array = new int[listCategory.size()];
        int[] arrayCorrect = new int[listCategory.size()];
        for (int i = 0; i < question.size(); i++) {
            for (int j = 0; j < listCategory.size(); j++) {
                if(question.get(i).getCategory().equals(listCategory.get(j).getValue())){
                    array[j]++;
                    if(question.get(i).getOption_correct().equals(listCheckAnswer.get(i).getAnswer())){
                        arrayCorrect[j]++;
                    }
                }
            }
        }
        int count = 0;
        for (int i = 0; i < listCheckAnswer.size(); i++) {
            if(listCheckAnswer.get(i).getAnswer().equals(question.get(i).getOption_correct())){
                count++;
            }           
        }
        request.setAttribute("history", history);
        request.setAttribute("x", x);
        request.setAttribute("id", id);
        request.setAttribute("listAnswer", listAnswer);
        request.setAttribute("listUnanswer", listUnanswer);
        request.setAttribute("listCheckAnswer", listCheckAnswer);
        request.setAttribute("count", count);
        request.setAttribute("listCategory", listCategory);
        request.setAttribute("array", array);
        request.setAttribute("arrayCorrect", arrayCorrect);        
        request.getRequestDispatcher("QuizResult.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
