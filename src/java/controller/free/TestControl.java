/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.free;

import dal.QuizDAO;
import dal.SettingDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Quizzes;
import model.Setting;

public class TestControl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        QuizDAO dao = new QuizDAO();

        int pageSize = 6;

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
        String category = request.getParameter("category");

        // case default: don't search and don't filter
        if (searchName == null && category == null) {

            searchName = "";
            category = "";
            rowCount = dao.getRowCountAllFreeTest();

        } else { // case specific: search or filter

            rowCount = dao.getRowCountForFilterFreeTest(searchName, category);

        }

        int pageCount;

        if (rowCount % pageSize == 0) {
            pageCount = rowCount / pageSize;
        } else {
            pageCount = rowCount / pageSize + 1;
        }

        int gap = 1;

        ArrayList<Quizzes> listAllFreeQuizzes = dao.listAllFreeQuizes(pageIndex, pageSize, searchName, category);

        SettingDAO setdao = new SettingDAO();
        List<Setting> listCategories = setdao.getListSettingByType("Quiz Category");
        List<Quizzes> listFourFeaturedTest = dao.getFourFeaturedQuiz();

        request.setAttribute("listAllFreeQuizzes", listAllFreeQuizzes);
        request.setAttribute("listCategories", listCategories);
        request.setAttribute("listFourFeaturedTest", listFourFeaturedTest);

        request.setAttribute("searchName", searchName);

        request.setAttribute("category", category);

        request.setAttribute("pagecount", pageCount);
        request.setAttribute("pageindex", pageIndex);
        request.setAttribute("gap", gap);

        request.getRequestDispatcher("TestHome.jsp").forward(request, response);

    }

}
