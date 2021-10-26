/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.customer;

import controller.base.BaseRequiredLoginController;
import dal.QuestionDAO;
import dal.QuizDAO;
import dal.SettingDAO;
import dal.SubjectDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Question;
import model.Quizzes;
import model.Setting;
import model.Subject;
import model.User;

/**
 *
 * @author Admin
 */
public class PracticeDetailController extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        String id = request.getParameter("id");
        SubjectDAO sdao = new SubjectDAO();
        QuizDAO qqdao = new QuizDAO();
        SettingDAO stdao = new SettingDAO();
        QuestionDAO qdao = new QuestionDAO();
        Quizzes quiz = qqdao.getQuizByID(id);
        ArrayList<Question> question = qdao.getQuestionInQuiz(Integer.parseInt(id));
        ArrayList<Setting> listCategory = stdao.getListSettingByType("Question Category");
        int[] array = new int[listCategory.size()];
        for (int i : array) {
            i = 0;
        }
        for (Question i : question) {
            for (int j = 0; j < listCategory.size(); j++) {
                if(i.getCategory().equals(listCategory.get(j).getValue())) array[j]++;
            }
        }
        Subject sub = sdao.getSubject(quiz.getSubject_id(), "Published");
        request.setAttribute("array", array);
        request.setAttribute("quiz", quiz);
        request.setAttribute("sub", sub);
        request.setAttribute("listCategory", listCategory);
        request.getRequestDispatcher("PracticeDetail.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    

}
