/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.expert;

import controller.base.BaseRequiredLoginController;
import dal.QuestionDAO;
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
public class EditQuestionController extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String quiz = request.getParameter("quiz");
        QuestionDAO qdao = new QuestionDAO();
        Question question = qdao.getQuestionById(id);
        request.setAttribute("quiz", quiz);
        request.setAttribute("question", question);
        request.getRequestDispatcher("EditQuestion.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String quiz = request.getParameter("quiz");
        String cate = request.getParameter("category");
        String lev = request.getParameter("level");
        String question = request.getParameter("question");
        String answer1 = request.getParameter("answer1");
        String answer2 = request.getParameter("answer2");
        String answer3 = request.getParameter("answer3");
        String answer4 = request.getParameter("answer4");
        String correct = request.getParameter("correct");
        String correctAns;
                switch (correct) {
                    case "1":
                        correctAns = answer1;
                        break;
                    case "2":
                        correctAns = answer2;
                        break;
                    case "3":
                        correctAns = answer3;
                        break;
                    case "4":
                        correctAns = answer4;
                        break;
                    default:
                        correctAns = "";
                }
        QuestionDAO qdao = new QuestionDAO();
        qdao.EditQuestion(new Question(Integer.parseInt(id), question, cate, "Show", Integer.parseInt(lev), 
                Integer.parseInt(quiz), answer1, answer2, answer3, answer4, correctAns));
        response.sendRedirect("EditQuiz?id="+quiz);
    }
     
}
