/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.customer;

import controller.base.BaseRequiredLoginController;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dal.*;
import java.util.ArrayList;
import model.*;

/**
 *
 * @author Admin
 */
public class SaveQuizHandleController extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pre = Integer.parseInt(request.getParameter("pre"));
        int next = Integer.parseInt(request.getParameter("next"));        
        String id = request.getParameter("id");
        String select = request.getParameter("select");
        String timer = request.getParameter("timer"); //<b>03m : 16s</b>
        int minute = Integer.parseInt(timer.substring(3, 5));
        int second = Integer.parseInt(timer.substring(9, 11));
        HttpSession session = request.getSession();
        ArrayList<Question> answer = (ArrayList<Question>)session.getAttribute("answer");
        Quizzes q = (Quizzes)session.getAttribute("timer");
        q.setDuration(60*minute+second);
        if(!select.isEmpty()){
            answer.get(pre-1).setStatus("Answered");
            answer.get(pre-1).setOption_correct(select);
            session.setAttribute("answer", answer);
        }
        if(next<0) {
            System.out.println("");
            response.sendRedirect("SubmitQuiz");  
        }      
        else response.sendRedirect("QuizHandle?id="+id+"&page="+next);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
     
}