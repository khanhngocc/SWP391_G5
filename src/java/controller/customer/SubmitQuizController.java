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
import dal.*;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import model.*;

/**
 *
 * @author Admin
 */
public class SubmitQuizController extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        ArrayList<Question> answer = (ArrayList<Question>)session.getAttribute("answer");
        UserDAO udao = new UserDAO();
        User user = (User)session.getAttribute("user");
        User x = udao.getUser(user.getEmail());
        Quizzes quiz = (Quizzes)session.getAttribute("timer");
        QuestionDAO qqdao = new QuestionDAO();
        HistoryDAO hdao = new HistoryDAO();
        Answer_HistoryDAO ahdao = new Answer_HistoryDAO();
        int count=0;
        for (Question question : answer) {
            if(question.getOption_correct().equals(qqdao.getQuestionById(String.valueOf(question.getId())).getOption_correct())) count++;
        }
        hdao.addHistory(new History(x.getId(), quiz.getId(), Date.valueOf(java.time.LocalDate.now()) , 10.0f*count/answer.size(), 10.0f*count/answer.size()>=quiz.getRate()?"Pass":"Fail"));
        int history_id = hdao.getHistorys().get(hdao.getHistorys().size()-1).getId();
        for (Question question : answer) {
            ahdao.addAnswer_History(new Answer_History(history_id, question.getId(), question.getOption_correct()));
        }
        session.removeAttribute("timer");
        session.removeAttribute("answer");
        response.sendRedirect("PracticeList");
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
}
