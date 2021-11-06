/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.marketing;

import com.oreilly.servlet.MultipartRequest;
import controller.base.BaseRequiredLoginController;
import dal.BlogDAO;
import dal.SettingDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Blog;
import model.Setting;
import model.User;

/**
 *
 * @author dell
 */
public class UpdateBlog extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        BlogDAO blogDAO = new BlogDAO();
        model.Blog b = blogDAO.getBlog(Integer.valueOf(id), "");
        request.setAttribute("blog", b);
        SettingDAO settingDAO = new SettingDAO();
        ArrayList<Setting> categoriesList = settingDAO.getListSettingByType("Post Category");
        request.setAttribute("categoriesList", categoriesList);
        request.getRequestDispatcher("UpdateBlog.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // get path to save img
        String webPath = getServletContext().getRealPath("/");
        StringBuilder sb = new StringBuilder(webPath.replace("\\build", "").replace("\\", "/"));
        sb.append("blog");

        String fileNameImg = "";

        // get file name of img uploaded
        MultipartRequest m = new MultipartRequest(request, sb.toString());

        if (m.getFile("fname") != null) {
            String fileNameImgPath = m.getFile("fname").toString();
            int indexOflast = fileNameImgPath.lastIndexOf("\\");
            fileNameImg = fileNameImgPath.substring(indexOflast + 1, fileNameImgPath.length());
        }

        // get file name of attach file uploaded
        String fileNameAttach = "";
        if (m.getFile("attach") != null) {
            String fileNameAttachPath = m.getFile("attach").toString();
            int indexOflastAttach = fileNameAttachPath.lastIndexOf("\\");
            fileNameAttach = fileNameAttachPath.substring(indexOflastAttach + 1, fileNameAttachPath.length());
        }

      
        String id = request.getParameter("id");
        String title = m.getParameter("title");
        String desc = m.getParameter("desc");
        String category = m.getParameter("category");

        Blog temp = new Blog();
        temp.setId(Integer.valueOf(id));
        temp.setTitle(title);
        temp.setDescription(desc);
        temp.setCategory(category);
        temp.setImg_url(m.getParameter("imgURL"));
        temp.setAttach_url(m.getParameter("attachURL"));
        request.setAttribute("blog", temp);

     
        if (m.getFile("fname") != null) {
            temp.setImg_url("blog/" + fileNameImg);
        }

        if (m.getFile("attach") != null) {
            temp.setAttach_url("blog/" + fileNameAttach);
        }

        temp.setDate(Date.valueOf(java.time.LocalDate.now()));

        Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");

        temp.setTime(sdf.format(cal.getTime()));

        BlogDAO dao = new BlogDAO();
        dao.updateBlog(temp);

        response.sendRedirect("BlogList");
    }

}
