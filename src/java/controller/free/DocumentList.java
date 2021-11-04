/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.free;

import dal.BlogDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dell
 */
public class DocumentList extends HttpServlet {

    private static String searchName;
    private static String local_category;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        BlogDAO dao = new BlogDAO();

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
        String category = request.getParameter("categories");
       
        
        
        if (name_search == null && category == null) {
            searchName = "";
            local_category = "";
            rowCount = dao.getRowCount("1");
        } else {
            searchName = name_search;
            local_category = category;
            rowCount = dao.getRowCountForSearch(searchName,local_category,"1");
           
        }

      
        int pageCount;

        if (rowCount % pageSize == 0) {
            pageCount = rowCount / pageSize;
        } else {
            pageCount = rowCount / pageSize + 1;
        }

        int gap = 1;

        
        ArrayList<model.Blog> listAllBlog = dao.listAllBlog(pageIndex, pageSize, searchName, local_category,"1");
        ArrayList<model.Blog> listFiveBlog = dao.listFiveHotestBlog("1");
        request.setAttribute("list5", listFiveBlog);
        request.setAttribute("list_all_blogs", listAllBlog);
        request.setAttribute("pagecount", pageCount);
        request.setAttribute("pageindex", pageIndex);
        request.setAttribute("gap", gap);
        request.setAttribute("name_search", searchName);
        ArrayList<String> listCategories = dao.listCategories();
        request.setAttribute("listCategories", listCategories);
        request.setAttribute("category", local_category);
        request.getRequestDispatcher("DocumentList.jsp").forward(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    

}
