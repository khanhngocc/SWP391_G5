/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.customer;

import com.oreilly.servlet.MultipartRequest;
import controller.base.BaseRequiredLoginController;
import dal.QuestionDAO;
import dal.QuizDAO;
import dal.Quizzes_QuestionDAO;
import dal.SettingDAO;
import dal.SubjectDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Question;
import model.Quizzes;
import model.Quizzes_Question;
import model.Setting;
import model.Subject;
import model.User;

/**
 *
 * @author Admin
 */
public class AddPracticeController extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SettingDAO settingDAO = new SettingDAO();
        ArrayList<Setting> listLevel = settingDAO.getListSettingByType("Question Level");
        ArrayList<Setting> listType = settingDAO.getListSettingByType("Exam type");
        ArrayList<Setting> listCategory = settingDAO.getListSettingByType("Quiz Category");
        request.setAttribute("listLevel", listLevel);
        request.setAttribute("listType", listType);
        SubjectDAO subjectDAO = new SubjectDAO();
        ArrayList<Subject> listSubject = subjectDAO.listAllSubject("Published");
        request.setAttribute("listSubject", listSubject);
        request.setAttribute("listCategory", listCategory);
        request.setAttribute("qdao", new QuestionDAO());
        request.getRequestDispatcher("AddPractice.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        int subject_id = Integer.parseInt(request.getParameter("subject"));
        String category = request.getParameter("category");
        int duration = Integer.parseInt(request.getParameter("duration"));
        int number = Integer.parseInt(request.getParameter("number"));
        User user = (User) session.getAttribute("user");
        
        UserDAO udao = new UserDAO();
        QuizDAO qdao = new QuizDAO();
        SubjectDAO sdao = new SubjectDAO();
        QuestionDAO qqdao = new QuestionDAO();
        Quizzes_QuestionDAO qqqdao = new Quizzes_QuestionDAO();
        qdao.addQuiz(new Quizzes(title, description, subject_id, category, "3", "User Practice", udao.getUser(user.getEmail()).getId(), 0, duration, 0.6f,"",Date.valueOf(LocalDate.now()),false));
        ArrayList<Quizzes> temp = qdao.getQuiz();
        Collections.reverse(temp);
        ArrayList<Question> question = qqdao.getQuestionsBySubject(sdao.getSubject(subject_id, "Published").getTitle());
        Collections.shuffle(question);
        for (int i = 0; i < number; i++) {
             qqqdao.addQuizzes_Question(new Quizzes_Question(temp.get(0).getId(), question.get(i).getId()));       
        }
        Quizzes q = temp.get(0);
        q.setNumber_of_question(number);
        qdao.UpdateQuizzes(q);
        response.sendRedirect("QuizHandle?id="+ temp.get(0).getId());

    }

}
