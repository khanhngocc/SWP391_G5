/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.expert;

import controller.base.BaseRequiredLoginController;
import dal.QuestionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Question;

/**
 *
 * @author Admin
 */
public class QuestionListController extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        QuestionDAO qdao = new QuestionDAO();
        ArrayList<Question> question = qdao.getQuestions();
        int pageSize = question.size() % 10 == 0 ? question.size() / 10 : question.size() / 10 + 1;
        int currentPage;
        try {
            currentPage = Integer.parseInt(request.getParameter("page"));
        } catch (Exception e) {
            currentPage = 1;
        }
        request.setAttribute("question", question.subList(10 * (currentPage - 1), 10 * currentPage > question.size() ? question.size() : 10 * currentPage));
        request.setAttribute("pagesize", pageSize);
        request.setAttribute("page", currentPage);
        request.getRequestDispatcher("QuestionList.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
}
