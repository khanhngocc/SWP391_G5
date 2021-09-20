/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.Test_Quiz_DAO;
import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Quiz;
import model.Test;
import model.User;

/**
 *
 * @author Admin
 */
public class CreateTestControl extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("CreateTest.jsp");
    }

    @Override 
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String title = request.getParameter("title");
        int duration = Integer.parseInt(request.getParameter("duration"));
        String []question = request.getParameterValues("question");
        String []answer1 = request.getParameterValues("answer1");
        String []answer2 = request.getParameterValues("answer2");
        String []answer3 = request.getParameterValues("answer3");
        String []answer4 = request.getParameterValues("answer4");
        String []correct = request.getParameterValues("correct");
        Test_Quiz_DAO tqdao = new Test_Quiz_DAO();
        tqdao.addTest(new Test(title, "none", Date.valueOf(java.time.LocalDate.now()), user.getId(), duration));
        for (int i = 0; i < question.length; i++) {
            if(!question[i].isEmpty()&&!answer1[i].isEmpty()&&!answer2[i].isEmpty()&&!answer3[i].isEmpty()&&!answer4[i].isEmpty()&&!correct[i].isEmpty()){
                String correctAns;
                switch(correct[i]){
                    case "1": correctAns=answer1[i]; break;
                    case "2": correctAns=answer2[i]; break;
                    case "3": correctAns=answer3[i]; break;
                    case "4": correctAns=answer4[i]; break;
                    default: correctAns="";
                }
                tqdao.addQuiz(new Quiz(question[i], answer1[i], answer2[i], answer3[i], answer4[i], correctAns,tqdao.getTestByUser(user).get(tqdao.getTestByUser(user).size()-1).getId()));
            }
        }
        response.sendRedirect("TeacherHome");
    }

}
