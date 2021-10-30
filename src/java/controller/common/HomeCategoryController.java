/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.common;

import controller.base.BaseRequiredLoginController;
import dal.*;
import model.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class HomeCategoryController extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("type");
        SlideDAO slideDAO = new SlideDAO();
        QuizDAO quizdao = new QuizDAO();
        SettingDAO setdao = new SettingDAO();
        ArrayList<Slide> sliderList = slideDAO.listAllSlides("Published");
        int maxId = Integer.valueOf(slideDAO.getMaxID("Published"));
        ArrayList<Quizzes> freetest = quizdao.getQuizByTypeCategory("Free Test", type);
        BlogDAO blogDAO = new BlogDAO();
        ArrayList<model.Blog> listAllBlog = blogDAO.listFiveHotestBlog("1");
        List<Setting> lists = setdao.getListSettingByType("Quiz Category");
        request.setAttribute("freetest", freetest);
        request.setAttribute("lists", lists);
        request.setAttribute("sliderList", sliderList);
        request.setAttribute("sliderListSize", sliderList.size());
        request.setAttribute("maxId", maxId);
        request.setAttribute("list_all_blogs", listAllBlog);
        request.getRequestDispatcher("Home.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("search");
        SlideDAO slideDAO = new SlideDAO();
        QuizDAO quizdao = new QuizDAO();
        SettingDAO setdao = new SettingDAO();
        ArrayList<Slide> sliderList = slideDAO.listAllSlides("Published");
        int maxId = Integer.valueOf(slideDAO.getMaxID("Published"));
        List<Quizzes> freetest = quizdao.getQuizByName(search);
        BlogDAO blogDAO = new BlogDAO();
        ArrayList<model.Blog> listAllBlog = blogDAO.listFiveHotestBlog("1");
        List<Setting> lists = setdao.getListSettingByType("Quiz Category");
        request.setAttribute("freetest", freetest);
        request.setAttribute("lists", lists);
        request.setAttribute("sliderList", sliderList);
        request.setAttribute("sliderListSize", sliderList.size());
        request.setAttribute("maxId", maxId);
        request.setAttribute("list_all_blogs", listAllBlog);
        request.getRequestDispatcher("Home.jsp").forward(request, response);
    }

}