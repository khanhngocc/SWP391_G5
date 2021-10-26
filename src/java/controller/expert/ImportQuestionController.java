/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.expert;

import com.oreilly.servlet.MultipartRequest;
import controller.base.BaseRequiredLoginController;
import dal.QuestionDAO;
import dal.QuizDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.Question;
import model.Quizzes;
import utilities.ExcelHelper;

/**
 *
 * @author Admin
 */

public class ImportQuestionController extends BaseRequiredLoginController{

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("ImportQuestion.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fileNameImg = "";
        String webPath = getServletContext().getRealPath("/");
        StringBuilder sb = new StringBuilder(webPath.replace("\\build", "").replace("\\", "/"));
        sb.append("sheet/");

        // get file name of img uploaded
        MultipartRequest m = new MultipartRequest(request, sb.toString());

        if (m.getFile("fname") != null) {
            String fileNameImgPath = m.getFile("fname").toString();
            int indexOflast = fileNameImgPath.lastIndexOf("\\");
            fileNameImg = fileNameImgPath.substring(indexOflast + 1, fileNameImgPath.length());
        }
        
        ExcelHelper eh = new ExcelHelper();
        try {
            eh.importQuestion(sb.append("/"+fileNameImg).toString());
            response.sendRedirect("QuestionList");
        } catch (Exception ex) {
            Logger.getLogger(ImportQuestionController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    
}