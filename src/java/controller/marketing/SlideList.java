/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.marketing;

import controller.base.BaseRequiredLoginController;
import dal.BlogDAO;
import dal.SlideDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Slide;

/**
 *
 * @author dell
 */
public class SlideList extends BaseRequiredLoginController {

    private static String searchName;
    private static String local_status;

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        SlideDAO dao = new SlideDAO();

        int pageSize = 4;

        String raw_pageindex = request.getParameter("page");

        if (raw_pageindex == null) {
            raw_pageindex = "1";
        }

        int pageIndex = 0;
        try {
            pageIndex = Integer.parseInt(raw_pageindex);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        int rowCount = 0;

        String name_search = request.getParameter("searchName");
        String status = request.getParameter("status");

        if (name_search == null && status == null) {
            searchName = "";
            local_status = "";
            rowCount = dao.getRowCount(local_status);
        } else {
            searchName = name_search;
            local_status = status;
            rowCount = dao.getRowCountForSearch(searchName, local_status);

        }

        int pageCount;

        if (rowCount % pageSize == 0) {
            pageCount = rowCount / pageSize;
        } else {
            pageCount = rowCount / pageSize + 1;
        }

        int gap = 1;

        
        
        ArrayList<Slide> listAllSlide = dao.listAllSlides(pageIndex, pageSize, searchName, local_status);
        
        System.out.println(listAllSlide.size());
        
        request.setAttribute("list_all_slides", listAllSlide);
        request.setAttribute("pagecount", pageCount);
        request.setAttribute("pageindex", pageIndex);
        request.setAttribute("gap", gap);
        request.setAttribute("name_search", searchName);
        request.setAttribute("status", local_status);
        request.getRequestDispatcher("SlideList.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
