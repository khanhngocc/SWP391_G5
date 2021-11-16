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
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;
import java.time.temporal.ChronoField;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DataOverView;
import model.User;

/**
 *
 * @author dell
 */
public class DataStatistic extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        DateTimeFormatter customizeFormat = new DateTimeFormatterBuilder()
                .appendPattern("yyyy-MM-dd[ HH:mm:ss]")
                .parseDefaulting(ChronoField.HOUR_OF_DAY, 0)
                .parseDefaulting(ChronoField.MINUTE_OF_HOUR, 0)
                .parseDefaulting(ChronoField.SECOND_OF_MINUTE, 0)
                .toFormatter();

        DateTimeFormatter format
                = DateTimeFormatter.ofPattern("dd/MM/yyyy");

        DateTimeFormatter formatTypeDateSQL
                = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        String textDateFrom = request.getParameter("dateFrom");
        String textDateTo = request.getParameter("dateTo");

        LocalDateTime dateFrom = null;
        LocalDateTime dateTo = null;

        // default : is last 7 days since today back
        if (textDateFrom == null && textDateTo == null) {

            dateTo = LocalDateTime.now();

            dateFrom = dateTo.minusDays(7);

        } else { // date from and date to by user input
            try {
                dateFrom = LocalDateTime.parse(textDateFrom, customizeFormat);
                dateTo = LocalDateTime.parse(textDateTo, customizeFormat);
            } catch (Exception e) {
                System.out.println(e);
            }
        }

        int daysBetween = (int) ChronoUnit.DAYS.between(dateFrom, dateTo);

        SubjectDAO subjectDAO = new SubjectDAO();
        QuizDAO quizDAO = new QuizDAO();
        QuestionDAO questionDAO = new QuestionDAO();

        ArrayList<DataOverView> listSubject = new ArrayList<>();

        for (int i = daysBetween; i > 0; i--) {

            DataOverView dataOverView = new DataOverView();
            LocalDateTime tempDate = dateTo.minusDays(i);
            int newSubjectAmount = subjectDAO.getNewRowCount(tempDate.format(formatTypeDateSQL));
            int allSubjectAmount = subjectDAO.getAllRowCountInRange(tempDate.format(formatTypeDateSQL));
            dataOverView.setDate(tempDate.format(format));
            dataOverView.setNewRecords(newSubjectAmount);
            dataOverView.setAllRecords(allSubjectAmount);
            listSubject.add(dataOverView);
        }

        User session_user = (User) request.getSession(false).getAttribute("user");
        UserDAO userDAO = new UserDAO();
        User current_user = userDAO.getUser(session_user.getEmail());

        ArrayList<DataOverView> listUserPractice = new ArrayList<>();
        ArrayList<DataOverView> listFreeTest = new ArrayList<>();
        ArrayList<DataOverView> listQuestion = new ArrayList<>();

        if (current_user.getId() != 4) {
            for (int i = daysBetween; i > 0; i--) {

                LocalDateTime tempDate = dateTo.minusDays(i);

                // user practice
                int newPracticeAmount = quizDAO.getNewQuizRowCount("User Practice", tempDate.format(formatTypeDateSQL));
                int allPracticeAmount = quizDAO.getAllQuizRowCountInRange(tempDate.format(formatTypeDateSQL), "User Practice");

                DataOverView doPractice = new DataOverView();
                doPractice.setDate(tempDate.format(format));
                doPractice.setNewRecords(newPracticeAmount);
                doPractice.setAllRecords(allPracticeAmount);

                listUserPractice.add(doPractice);

                // free test
                int newFreeTestAmount = quizDAO.getNewQuizRowCount("Free Test", tempDate.format(formatTypeDateSQL));
                int allFreeTestAmount = quizDAO.getAllQuizRowCountInRange(tempDate.format(formatTypeDateSQL), "Free Test");

                DataOverView doTest = new DataOverView();
                doTest.setDate(tempDate.format(format));
                doTest.setNewRecords(newFreeTestAmount);
                doTest.setAllRecords(allFreeTestAmount);

                listFreeTest.add(doTest);

                // question
                int newQuestionAmount = questionDAO.getNewRowCount(tempDate.format(formatTypeDateSQL));
                int allQuestionAmount = questionDAO.getAllRowCountInRange(tempDate.format(formatTypeDateSQL));

                DataOverView doQuestion = new DataOverView();
                doQuestion.setDate(tempDate.format(format));
                doQuestion.setNewRecords(newQuestionAmount);
                doQuestion.setAllRecords(allQuestionAmount);

                listQuestion.add(doQuestion);

            }

        }

        request.setAttribute("dateFrom", dateFrom.format(formatTypeDateSQL));
        request.setAttribute("dateTo", dateTo.format(formatTypeDateSQL));
        request.setAttribute("listFreeTest", listFreeTest);
        request.setAttribute("listsizeFreeTest", listFreeTest.size());
        request.setAttribute("listSubject", listSubject);
        request.setAttribute("listsizeSubject", listSubject.size());
        request.setAttribute("listUserPractice", listUserPractice);
        request.setAttribute("listsizeUserPractice", listUserPractice.size());
        request.setAttribute("listQuestion", listQuestion);
        request.setAttribute("listsizeQuestion", listQuestion.size());

        request.getRequestDispatcher("DataStatistic.jsp").forward(request, response);

    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
