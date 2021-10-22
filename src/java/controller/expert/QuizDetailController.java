/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.expert;

import controller.base.BaseRequiredLoginController;
import dal.QuestionDAO;
import dal.QuizDAO;
import dal.SubjectDAO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Question;
import model.Quizzes;
import model.Subject;

/**
 *
 * @author Admin
 */
public class QuizDetailController extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SubjectDAO sdao = new SubjectDAO();
        String id = request.getParameter("id");
        
        QuizDAO quizd = new QuizDAO();
        QuestionDAO qdao = new QuestionDAO();
        ArrayList<Question> question = qdao.getQuestionByQuizId(id);
        Quizzes quiz = quizd.getQuizByID(id);
        Subject sub = sdao.getSubject(quiz.getSubject_id(), "Published");
        request.setAttribute("question", question);
        request.setAttribute("quiz", quiz);
        request.setAttribute("sub", sub);
        request.getRequestDispatcher("QuizDetail.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}