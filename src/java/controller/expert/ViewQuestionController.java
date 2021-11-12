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
public class ViewQuestionController extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        QuestionDAO qdao = new QuestionDAO();
        Question question = qdao.getQuestionById(id);
        request.setAttribute("question", question);
        SettingDAO settingDAO = new SettingDAO();
        SubjectDAO subjectDAO = new SubjectDAO();
        ArrayList<Subject> listSubject = subjectDAO.listAllSubject("Published");
        ArrayList<Setting> listLevel = settingDAO.getListSettingByType("Question Level");
        ArrayList<Setting> listCategory = settingDAO.getListSettingByType("Question Category");
        request.setAttribute("listLevel", listLevel);
        request.setAttribute("listCategory", listCategory);
        request.setAttribute("listSubject", listSubject);
        request.getRequestDispatcher("ViewQuestion.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}