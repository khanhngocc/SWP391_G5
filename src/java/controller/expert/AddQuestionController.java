/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.expert;

import controller.base.BaseRequiredLoginController;
import dal.QuestionDAO;
import dal.QuizDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Question;

/**
 *
 * @author Admin
 */
public class AddQuestionController extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] cate = request.getParameterValues("category");
        String[] lev = request.getParameterValues("level");
        String[] question = request.getParameterValues("question");
        String[] answer1 = request.getParameterValues("answer1");
        String[] answer2 = request.getParameterValues("answer2");
        String[] answer3 = request.getParameterValues("answer3");
        String[] answer4 = request.getParameterValues("answer4");
        String[] correct = request.getParameterValues("correct");
           QuestionDAO qd = new QuestionDAO();
           QuizDAO qizd = new QuizDAO();    
          int quizId = qizd.getQuiz().get(qizd.getQuiz().size()-1).getId();
        for (int i = 0; i < question.length; i++) {
            if (!question[i].isEmpty() && !answer1[i].isEmpty() && !answer2[i].isEmpty() && !answer3[i].isEmpty() && !answer4[i].isEmpty() && !correct[i].isEmpty()) {
                String correctAns;
                switch (correct[i]) {
                    case "1":
                        correctAns = answer1[i];
                        break;
                    case "2":
                        correctAns = answer2[i];
                        break;
                    case "3":
                        correctAns = answer3[i];
                        break;
                    case "4":
                        correctAns = answer4[i];
                        break;
                    default:
                        correctAns = "";
                }
                qd.insertQuestion(new Question(question[i], cate[i], "Show", Integer.parseInt(lev[i]), quizId, answer1[i],answer2[i],answer3[i],answer4[i],correctAns));
            }
        }
        response.sendRedirect("QuizList");
    }

}
