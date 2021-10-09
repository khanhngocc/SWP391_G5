/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.expert;

import controller.base.BaseRequiredLoginController;
import dal.QuizDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Quizzes;

/**
 *
 * @author Admin
 */
public class QuizListController extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        QuizDAO qdao = new QuizDAO();
        List<Quizzes> quizlist = qdao.getQuiz();
        int pageSize = quizlist.size() % 10 == 0 ? quizlist.size() / 10 : quizlist.size() / 10 + 1;
        int currentPage;
        try {
            currentPage = Integer.parseInt(request.getParameter("page"));
        } catch (Exception e) {
            currentPage = 1;
        }
        request.setAttribute("list", quizlist.subList(10 * (currentPage - 1), 10 * currentPage > quizlist.size() ? quizlist.size() : 10 * currentPage));
        request.setAttribute("pagesize", pageSize);
        request.setAttribute("page", currentPage);
        request.getRequestDispatcher("QuizList.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
