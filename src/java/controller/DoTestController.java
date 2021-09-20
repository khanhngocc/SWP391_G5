/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.History_Answer_DAO;
import dal.Test_Quiz_DAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.DecimalFormat;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Answer;
import model.History;
import model.Quiz;
import model.Test;
import model.User;

/**
 *
 * @author Admin
 */
public class DoTestController extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int test_id = Integer.parseInt(request.getParameter("testId"));
        Test_Quiz_DAO tqdao = new Test_Quiz_DAO();
        Test test = tqdao.getTestById(test_id);
        ArrayList<Quiz> quiz = tqdao.getQuizByTestId(test_id);
        request.setAttribute("quiz", quiz);
        request.setAttribute("test", test);
        request.getRequestDispatcher("DoTest.jsp").forward(request, response);    
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession ses = request.getSession();
        int test_id = Integer.parseInt(request.getParameter("test_id"));
        Test_Quiz_DAO tqdao = new Test_Quiz_DAO();
        Test test = tqdao.getTestById(test_id);
        ArrayList<Quiz> quiz = tqdao.getQuizByTestId(test_id);
        String [] answer = new String[quiz.size()];
        for (int i = 0; i < quiz.size(); i++) {            
            answer[i] = request.getParameter(""+quiz.get(i).getId());   
            if(answer[i]==null) answer[i]=""; 
            switch(answer[i]){
                case "1": answer[i] = quiz.get(i).getAnswer1();break;
                case "2": answer[i] = quiz.get(i).getAnswer2();break;
                case "3": answer[i] = quiz.get(i).getAnswer3();break;
                case "4": answer[i] = quiz.get(i).getAnswer4();break;
                default: answer[i] = " ";
            }
        }
        History_Answer_DAO hadao = new History_Answer_DAO();
        hadao.addHistory(new History(test_id,((User) ses.getAttribute("user")).getId() , Date.valueOf(java.time.LocalDate.now())));
        for (int i = 0; i <quiz.size(); i++) {
            hadao.addAnswer(new Answer(0, hadao.getAllHistory().get(hadao.getAllHistory().size()-1).getId(), quiz.get(i).getId(), answer[i]));
        }
        int grade = 0;
        for (int i = 0; i < quiz.size(); i++) {
            if(quiz.get(i).getCorrect().equals(answer[i])) grade+=1;
        }
        double mark = (double)grade*10/quiz.size();
        DecimalFormat f = new DecimalFormat("##0.00");
        request.setAttribute("test", test);
        request.setAttribute("quiz", quiz);
        request.setAttribute("anwser", answer);
        request.setAttribute("mark", f.format(mark));
        request.getRequestDispatcher("ReviewTest.jsp").forward(request, response);
    }

}
