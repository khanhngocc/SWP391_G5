/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.customer;

import com.oreilly.servlet.MultipartRequest;
import controller.base.BaseRequiredLoginController;
import dal.QuizDAO;
import dal.SettingDAO;
import dal.SubjectDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Quizzes;
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
        request.getRequestDispatcher("AddPractice.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        String webPath = getServletContext().getRealPath("/");
        StringBuilder sb = new StringBuilder(webPath.replace("\\build", "").replace("\\", "/"));
        sb.append("images/thumbnail");

        MultipartRequest m = new MultipartRequest(request, sb.toString());
        String fileNameImgPath = m.getFile("fname").toString();

        int indexOflast = fileNameImgPath.lastIndexOf("\\");
        String fileNameImg = fileNameImgPath.substring(indexOflast + 1, fileNameImgPath.length());
        String title = m.getParameter("title");
        String description = m.getParameter("description");
        int subject_id = Integer.parseInt(m.getParameter("subject"));
        String category = m.getParameter("category");
        String level = m.getParameter("level");
        String type = m.getParameter("type");
        int duration = Integer.parseInt(m.getParameter("duration"));
        User user = (User) session.getAttribute("user");

        UserDAO udao = new UserDAO();
        QuizDAO qdao = new QuizDAO();
        qdao.addQuiz(new Quizzes(title, description, subject_id, category, level, "User Practice", udao.getUser(user.getEmail()).getId(), 0, duration, 0.6f, "images/thumbnail/" + fileNameImg));
        ArrayList<Quizzes> temp = qdao.getQuiz();
        Collections.reverse(temp);
        response.sendRedirect("AddQuestionToPractice?id=" + temp.get(0).getId());

    }

}
