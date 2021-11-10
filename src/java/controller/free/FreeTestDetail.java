/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.free;

import dal.QuestionDAO;
import dal.QuizDAO;
import dal.SettingDAO;
import dal.SubjectDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Question;
import model.Quizzes;
import model.Setting;
import model.Subject;

/**
 *
 * @author INSPIRON 15-7559
 */
public class FreeTestDetail extends HttpServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       SubjectDAO sdao = new SubjectDAO();
        String id = request.getParameter("id");
        SettingDAO stdao = new SettingDAO();
        QuizDAO quizd = new QuizDAO();
        QuestionDAO qdao = new QuestionDAO();
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
        QuizDAO dao = new QuizDAO();
        SettingDAO setdao = new SettingDAO();
        Quizzes quiz = quizd.getQuizByID(id);
        List<Setting> listCategories = setdao.getListSettingByType("Quiz Category");
        List<Quizzes> listFiveHotFreeTest = dao.getTop5Quiz();
        Subject sub = sdao.getSubject(quiz.getSubject_id(), "Published");
        
        request.setAttribute("listCategories", listCategories);
        
        request.setAttribute("listFiveHotFreeTest", listFiveHotFreeTest);
       
        request.setAttribute("array", array);
        request.setAttribute("quiz", quiz);
        request.setAttribute("sub", sub);
        request.setAttribute("listCategory", listCategory);
        request.getRequestDispatcher("FreeQuizDetail.jsp").forward(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

   
}