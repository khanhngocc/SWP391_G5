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
import utilities.Constant;

/**
 *
 * @author Admin
 */
public class QuestionListController extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        QuestionDAO dao = new QuestionDAO();
        SubjectDAO subjectDAO = new SubjectDAO();
        SettingDAO settingDAO = new SettingDAO();

        int pageSize = 4;

        String raw_pageindex = request.getParameter("page");

        if (raw_pageindex == null) {
            raw_pageindex = "1";
        }

        int pageIndex = 0;
        try {
            pageIndex = Integer.parseInt(raw_pageindex);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        int rowCount = 0;

        String searchName = request.getParameter("searchName");
        String subject = request.getParameter("subject");
        String category = request.getParameter("category");
        String level = request.getParameter("level");
        String status = request.getParameter("status");

        // case default: don't search and don't filter
        if (searchName == null && subject == null && category == null
                && level == null && status == null) {
            searchName = "";
            subject = "";
            category = "";
            level = "";
            status = "";
            rowCount = dao.getRowCount();
        } else { // case specific: search or filter

            rowCount = dao.getRowCountForSearch(searchName, subject, category, level, status);

        }

        int pageCount;

        if (rowCount % pageSize == 0) {
            pageCount = rowCount / pageSize;
        } else {
            pageCount = rowCount / pageSize + 1;
        }

        int gap = 1;

        ArrayList<Question> listQuestions = dao.listAllQuestions(pageIndex, pageSize, searchName, subject, category, level, status);
        ArrayList<Subject> listSubjects = subjectDAO.listAllSubject("Published");

        ArrayList<Setting> listCategory = settingDAO.getListSettingByType("Question Category");
        ArrayList<Setting> listLevel = settingDAO.getListSettingByType("Question Level");
        
        request.setAttribute("searchName", searchName);
        request.setAttribute("subject", subject);
        request.setAttribute("category", category);
        request.setAttribute("level", level);
        request.setAttribute("status", status);
        
        request.setAttribute("listQuestions", listQuestions);
        request.setAttribute("listSubjects", listSubjects);
        request.setAttribute("listCategory", listCategory);
        request.setAttribute("listLevel", listLevel);
        
        request.setAttribute("listStatus", Constant.status);
        request.setAttribute("pagecount", pageCount);
        request.setAttribute("pageindex", pageIndex);
        request.setAttribute("gap", gap);
        
        request.getRequestDispatcher("QuestionList.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
