/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.free;

import dal.QuestionDAO;
import dal.QuizDAO;
import dal.SettingDAO;
import dal.SubjectDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Question;
import model.Quizzes;
import model.Setting;
import model.Subject;

/**
 *
 * @author INSPIRON 15-7559
 */
public class FreeTestDetail extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       SubjectDAO sdao = new SubjectDAO();
        String id = request.getParameter("id");
        SettingDAO stdao = new SettingDAO();
        QuizDAO quizd = new QuizDAO();
        QuestionDAO qdao = new QuestionDAO();
        ArrayList<Question> question = qdao.getQuestionInQuiz(Integer.parseInt(id));
        ArrayList<Setting> listCategory = stdao.getListSettingByType("Question Category");
        int[] array = new int[listCategory.size()];
        for (int i : array) {
            i = 0;
        }
        for (Question i : question) {
            for (int j = 0; j < listCategory.size(); j++) {
                if(i.getCategory().equals(listCategory.get(j).getValue())) array[j]++;
            }
        }
        QuizDAO dao = new QuizDAO();
        SettingDAO setdao = new SettingDAO();
        Quizzes quiz = quizd.getQuizByID(id);
        List<Quizzes> list5 = dao.getTop5Quiz();
        List<Setting> lists = setdao.getListSettingByType("Quiz Category");
        Subject sub = sdao.getSubject(quiz.getSubject_id(), "Published");
         request.setAttribute("list5", list5);
        request.setAttribute("lists", lists);
        request.setAttribute("array", array);
        request.setAttribute("quiz", quiz);
        request.setAttribute("sub", sub);
        request.setAttribute("listCategory", listCategory);
        request.getRequestDispatcher("FreeQuizDetail.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
