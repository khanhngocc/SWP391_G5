/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.expert;

import controller.base.BaseRequiredLoginController;
import dal.QuizDAO;
import dal.SettingDAO;
import dal.SubjectDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Quizzes;
import model.Setting;
import model.Subject;

/**
 *
 * @author Admin
 */
public class QuizListController extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        QuizDAO dao = new QuizDAO();

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
        String type = request.getParameter("type");

        // case default: don't search and don't filter
        if (searchName == null && subject == null && category == null && type == null) {
            searchName = "";
            subject = "";
            category = "";
            type = "";
            rowCount = dao.getRowCount();
        } else { // case specific: search or filter

            rowCount = dao.getRowCountForSearch(searchName, subject, category, type);

        }

        int pageCount;

        if (rowCount % pageSize == 0) {
            pageCount = rowCount / pageSize;
        } else {
            pageCount = rowCount / pageSize + 1;
        }

        int gap = 1;

        ArrayList<Quizzes> listAllQuizzes = dao.listAllQuizes(pageIndex, pageSize, searchName, subject, category, type);

        SubjectDAO subjectDAO = new SubjectDAO();
        ArrayList<Subject> subjectList = subjectDAO.listAllSubject("Published");

        SettingDAO settingDAO = new SettingDAO();
        ArrayList<Setting> listCategory = settingDAO.getListSettingByType("Quiz Category");
        ArrayList<Setting> listType = settingDAO.getListSettingByType("Exam type");
        
        request.setAttribute("listAllQuizzes", listAllQuizzes);
        request.setAttribute("subjectList", subjectList);
        request.setAttribute("listCategory", listCategory);
        request.setAttribute("listType", listType);
        
        request.setAttribute("searchName", searchName);
        request.setAttribute("subject", subject);
        request.setAttribute("category", category);
        request.setAttribute("type", type);
        request.setAttribute("sdao",new SubjectDAO());
        
        request.setAttribute("pagecount", pageCount);
        request.setAttribute("pageindex", pageIndex);
        request.setAttribute("gap", gap);
        request.getRequestDispatcher("QuizList.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
