/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.expert;

import controller.base.BaseRequiredLoginController;
import dal.QuestionDAO;
import dal.SettingDAO;
import dal.SubjectDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Question;
import model.Setting;
import model.Subject;

/**
 *
 * @author Admin
 */
public class AddQuestionController extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SettingDAO settingDAO = new SettingDAO();
        SubjectDAO subjectDAO = new SubjectDAO();
        ArrayList<Subject> listSubject = subjectDAO.listAllSubject("Published");
        ArrayList<Setting> listLevel = settingDAO.getListSettingByType("Question Level");
        ArrayList<Setting> listCategory = settingDAO.getListSettingByType("Question Category");
        request.setAttribute("listLevel", listLevel);
        request.setAttribute("listCategory", listCategory);
        request.setAttribute("listSubject", listSubject);
        request.getRequestDispatcher("AddQuestion.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cate = request.getParameter("category");
        String subject = request.getParameter("subject");
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
        qdao.insertQuestion(new Question(question, cate, "Active", lev, answer1, answer2, answer3, answer4, correctAns, subject, Date.valueOf(LocalDate.now())));
        response.sendRedirect("QuestionList");
    }
}