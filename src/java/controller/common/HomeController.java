/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.common;

import controller.base.BaseRequiredLoginController;
import dal.BlogDAO;
import dal.QuizDAO;
import dal.SettingDAO;
import dal.SlideDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Quizzes;
import model.Setting;
import model.Slide;

/**
 *
 * @author LEGION
 */
public class HomeController extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // load slider
        SlideDAO slideDAO = new SlideDAO();
        ArrayList<Slide> sliderList = slideDAO.listAllSlides("Published");
        int maxId = Integer.valueOf(slideDAO.getMaxID("Published"));

        // load posts
        BlogDAO blogDAO = new BlogDAO();
        ArrayList<model.Blog> listAllBlog = blogDAO.listSixLastestBlog("1");

        // load free test
        SettingDAO setdao = new SettingDAO();
        QuizDAO quizdao = new QuizDAO();

        ArrayList<Quizzes> freetest = quizdao.getQuizByType("Free Test");
        List<Setting> listCategories = setdao.getListSettingByType("Quiz Category");
       List<Quizzes> listFourFeaturedTest = quizdao.getFourFeaturedQuiz();

        request.setAttribute("freetest", freetest);

        request.setAttribute("listCategories", listCategories);
        request.setAttribute("listFourFeaturedTest", listFourFeaturedTest);

        request.setAttribute("sliderList", sliderList);
        request.setAttribute("sliderListSize", sliderList.size());
        request.setAttribute("maxId", maxId);
        request.setAttribute("list_all_blogs", listAllBlog);
        request.getRequestDispatcher("Home.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
   
}
