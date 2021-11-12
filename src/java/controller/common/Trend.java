/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.common;

import controller.base.BaseRequiredLoginController;
import dal.QuizDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;
import java.time.temporal.ChronoField;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DataTrend;

/**
 *
 * @author dell
 */
public class Trend extends BaseRequiredLoginController {

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
        
        ArrayList<DataTrend> listDataTrend = new ArrayList<>();
        QuizDAO quizDAO = new QuizDAO();

        // load daily statistic for each day
        for (int i = daysBetween ; i > 0; i--) {

            LocalDateTime tempDate = dateTo.minusDays(i);
            DataTrend dt = new DataTrend();
            dt.setDate(tempDate.format(format));
            dt.setStatisticFreeTest(quizDAO.getAllNumberQuizTaken("Free Test", tempDate.format(formatTypeDateSQL)));
            dt.setStatisticUserPractice(quizDAO.getAllNumberQuizTaken("User Practice", tempDate.format(formatTypeDateSQL)));
            listDataTrend.add(dt);
        }

        request.setAttribute("dateFrom", dateFrom.format(formatTypeDateSQL));
        request.setAttribute("dateTo", dateTo.format(formatTypeDateSQL));
        request.setAttribute("listDataTrend", listDataTrend);

        request.getRequestDispatcher("Trend.jsp").forward(request, response);

    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
