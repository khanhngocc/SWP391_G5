/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.common;

import controller.base.BaseRequiredLoginController;
import dal.QuestionDAO;
import dal.QuizDAO;
import dal.SubjectDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Question;
import model.User;

/**
 *
 * @author dell
 */
public class DataStatistic extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        DateTimeFormatter format
                = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        String dateFrom = request.getParameter("dateFrom");
        String dateTo = request.getParameter("dateTo");

        if (dateFrom == null && dateTo == null) {

            LocalDateTime currentDate = LocalDateTime.now();

            dateTo = currentDate.format(format);

            LocalDateTime sevenDateBefore = currentDate.minusDays(7);

            dateFrom = sevenDateBefore.format(format);
        }

        SubjectDAO subjectDAO = new SubjectDAO();
        QuizDAO quizDAO = new QuizDAO();
        QuestionDAO questionDAO = new QuestionDAO();

        int newSubjectAmount = subjectDAO.getNewRowCount();
        int allSubjectAmount = subjectDAO.getAllRowCountInRange(dateFrom, dateTo);

        request.setAttribute("newSubjectAmount", newSubjectAmount);
        request.setAttribute("allSubjectAmount", allSubjectAmount);

        User session_user = (User) request.getSession(false).getAttribute("user");
        UserDAO userDAO = new UserDAO();
        User current_user = userDAO.getUser(session_user.getEmail());

        if (current_user.getId() != 4) {
            
            int newPracticeAmount = quizDAO.getNewQuizRowCount("User Practice");
            int allPracticeAmount = quizDAO.getAllQuizRowCountInRange(dateFrom, dateTo, "User Practice");

            int newFreeTestAmount = quizDAO.getNewQuizRowCount("Free Test");
            int allFreeTestAmount = quizDAO.getAllQuizRowCountInRange(dateFrom, dateTo, "Free Test");

            int newQuestionAmount = questionDAO.getNewRowCount();
            int allQuestionAmount = questionDAO.getAllRowCountInRange(dateFrom, dateTo);

            request.setAttribute("newPracticeAmount", newPracticeAmount);
            request.setAttribute("allPracticeAmount", allPracticeAmount);

            request.setAttribute("newFreeTestAmount", newFreeTestAmount);
            request.setAttribute("allFreeTestAmount", allFreeTestAmount);

            request.setAttribute("newQuestionAmount", newQuestionAmount);
            request.setAttribute("allQuestionAmount", allQuestionAmount);
        }

        request.setAttribute("dateFrom", dateFrom);
        request.setAttribute("dateTo", dateTo);

        request.getRequestDispatcher("DataStatistic.jsp").forward(request, response);

    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
