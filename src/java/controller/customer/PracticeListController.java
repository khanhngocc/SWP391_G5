/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.customer;

import controller.base.BaseRequiredLoginController;
import dal.HistoryDAO;
import dal.QuizDAO;
import dal.SubjectDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.History;
import model.User;

/**
 *
 * @author Admin
 */
public class PracticeListController extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User x = (User)session.getAttribute("user");
        HistoryDAO hdao = new HistoryDAO();
        ArrayList<History> list = hdao.getHistorybyUserID(x.getId());
        Collections.reverse(list);
        int pageSize = list.size() % 10 == 0 ? list.size() / 10 : list.size() / 10 + 1;
        int currentPage;
        try {
            currentPage = Integer.parseInt(request.getParameter("page"));
        } catch (Exception e) {
            currentPage = 1;
        }
        request.setAttribute("list", list.subList(10 * (currentPage - 1), 10 * currentPage > list.size() ? list.size() : 10 * currentPage));
        request.setAttribute("pagesize", pageSize);
        request.setAttribute("page", currentPage);
        request.setAttribute("quizdao", new QuizDAO());
        request.setAttribute("sdao", new SubjectDAO());
        request.getRequestDispatcher("PracticeList.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
 
    
}
