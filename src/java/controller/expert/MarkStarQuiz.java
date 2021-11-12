/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.expert;
import controller.base.BaseRequiredLoginController;
import dal.QuizDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dell
 */
public class MarkStarQuiz extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String id = request.getParameter("id");
        String status = request.getParameter("status");
        
        QuizDAO quizDAO = new QuizDAO();
        quizDAO.changeQuizFeature(Integer.valueOf(id), status);
        PrintWriter writer = response.getWriter();
        
        writer.print(quizDAO.getQuizByID(id).isIsFeatured());
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    }

    

}
