/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.marketing;

import com.oreilly.servlet.MultipartRequest;
import controller.BaseRequiredLoginController;
import dal.BlogDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Blog;
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
        request.getRequestDispatcher("UpdateBlog.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    // get path to save img
        String webPath = getServletContext().getRealPath("/");
        StringBuilder sb = new StringBuilder(webPath.replace("\\build", "").replace("\\", "/"));
        sb.append("images/blog");

        String fileNameImg = "";

        // get file name of img uploaded
        MultipartRequest m = new MultipartRequest(request, sb.toString());

        if (m.getFile("fname") != null) {
            String fileNameImgPath = m.getFile("fname").toString();
            int indexOflast = fileNameImgPath.lastIndexOf("\\");
            fileNameImg = fileNameImgPath.substring(indexOflast + 1, fileNameImgPath.length());
        }

        String message = "";
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
        request.setAttribute("blog", temp);

        if (category.length() > 50) {
            message = "category comes over 50 characters";
            request.setAttribute("messUpdateBlog", message);
            request.getRequestDispatcher("UpdateBlog.jsp").forward(request, response);
        }

        if (title.length() > 100) {
            message = "title comes over 100 characters";
            request.setAttribute("messUpdateBlog", message);
            request.getRequestDispatcher("UpdateBlog.jsp").forward(request, response);
        }

        if (desc.length() > 3500) {
            message = "description comes over 3500 characters";
            request.setAttribute("messUpdateBlog", message);
            request.getRequestDispatcher("UpdateBlog.jsp").forward(request, response);
        }

        if (m.getFile("fname") != null) {
            temp.setImg_url("images/blog/" + fileNameImg);
        }

        temp.setDate(Date.valueOf(java.time.LocalDate.now()));

        Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");

        temp.setTime(sdf.format(cal.getTime()));

        BlogDAO dao = new BlogDAO();
        dao.updateBlog(temp);

       
        request.removeAttribute("blog");
        
        response.sendRedirect("BlogList");
    }

}
