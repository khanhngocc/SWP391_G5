/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;
import controller.base.BaseRequiredLoginController;
import dal.BlogDAO;
import dal.SettingDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utilities.Constant;

/**
 *
 * @author dell
 */
public class SettingList extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
        SettingDAO dao = new SettingDAO();

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

        String searchName = request.getParameter("searchName");
        String type = request.getParameter("type");
        String status = request.getParameter("status");
       
        
        // case default: don't search and don't filter
        if (searchName == null && type == null && status == null) {
            searchName = "";
            type = "";
            status = "";
            rowCount = dao.getRowCount();
        } else { // case specific: search or filter
            
            rowCount = dao.getRowCountForSearch(searchName,type,status);
           
        }

      
        int pageCount;

        if (rowCount % pageSize == 0) {
            pageCount = rowCount / pageSize;
        } else {
            pageCount = rowCount / pageSize + 1;
        }

        int gap = 1;

        
        ArrayList<model.Setting> listAllSettings = dao.listAllSettings(pageIndex, pageSize, searchName, status,type);
      
        
        request.setAttribute("listAllSettings", listAllSettings);
        request.setAttribute("listAllTypes", Constant.settingType);
        request.setAttribute("listAllStatus", Constant.status);
        
        request.setAttribute("searchName", searchName);
        request.setAttribute("type", type);
        request.setAttribute("status", status);
        
        request.setAttribute("pagecount", pageCount);
        request.setAttribute("pageindex", pageIndex);
        request.setAttribute("gap", gap);
        
        request.getRequestDispatcher("SettingList.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
    }

  

}
