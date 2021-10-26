/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.expert;

import controller.base.BaseRequiredLoginController;
import dal.QuestionDAO;
import dal.QuizDAO;
import dal.Quizzes_QuestionDAO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Question;
import model.Quizzes;
import model.Quizzes_Question;

/**
 *
 * @author Admin
 */
public class AddQuestionToQuizController extends BaseRequiredLoginController {

//    private boolean isDuplicate(ArrayList<Quizzes_Question> editlist, int question_id){
//        for (Quizzes_Question quizzes_Question : editlist) {
//            if(quizzes_Question.getQuestion_id()==question_id) return true;
//        }
//        return false;
//    }
    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        QuestionDAO qdao = new QuestionDAO();
        ArrayList<Question> question = qdao.getQuestions();
        request.setAttribute("qqdao", new Quizzes_QuestionDAO());
        request.setAttribute("id", id);
        request.setAttribute("question", question);
        request.getRequestDispatcher("QuestionListToQuiz.jsp").forward(request, response);
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
        response.sendRedirect("EditQuiz?id="+id);
    }
    
}