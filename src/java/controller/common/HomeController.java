/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.common;

import controller.base.BaseRequiredLoginController;
import dal.SlideDAO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Slide;

/**
 *
 * @author LEGION
 */
public class HomeController extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SlideDAO slideDAO = new SlideDAO();
        ArrayList<Slide> sliderList = slideDAO.listAllSlides("Published");
        request.setAttribute("sliderList", sliderList);
        request.setAttribute("sliderListSize", sliderList.size());
        request.getRequestDispatcher("Home.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
