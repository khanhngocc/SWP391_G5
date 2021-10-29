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

/**
 *
 * @author INSPIRON 15-7559
 */
public class TestControl extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String res = request.getParameter("search");
        QuizDAO dao = new QuizDAO();
        SettingDAO setdao = new SettingDAO();
        List<Quizzes> list = dao.getQuizByName(res);
        List<Setting> lists = setdao.getListSettingByType("Quiz Category");
         List<Quizzes> list5 = dao.getTop5Quiz();
        request.setAttribute("list5", list5);
        request.setAttribute("lists", lists);
        request.setAttribute("lq", list);
        request.getRequestDispatcher("TestHome.jsp").forward(request, response);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        QuizDAO qdao = new QuizDAO();
        ArrayList<Quizzes> lq = qdao.getQuizByType("Free Test");

        int pageSize = lq.size() % 12 == 0 ? lq.size() / 12 : lq.size() / 12 + 1;
        int currentPage;
        try {
            currentPage = Integer.parseInt(request.getParameter("page"));
        } catch (Exception e) {
            currentPage = 1;
        }
        request.setAttribute("lq", lq.subList(12 * (currentPage - 1), 12 * currentPage > lq.size() ? lq.size() : 12 * currentPage));
        request.setAttribute("pagesize", pageSize);
        request.setAttribute("page", currentPage);
        SettingDAO setdao = new SettingDAO();
        List<Setting> lists = setdao.getListSettingByType("Quiz Category");
        QuizDAO dao = new QuizDAO();
        List<Quizzes> list5 = dao.getTop5Quiz();
        request.setAttribute("list5", list5);
        request.setAttribute("lists", lists);
        request.getRequestDispatcher("TestHome.jsp").forward(request, response);

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
