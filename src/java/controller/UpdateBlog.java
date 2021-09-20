/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

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
        model.Blog b = blogDAO.getBlog(Integer.valueOf(id));
        request.setAttribute("blog", b);
        request.getRequestDispatcher("UpdateBlog.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String title = request.getParameter("title");
        String desc = request.getParameter("desc");

        String message = "";

        if (title.length() > 100) {
            message = "title comes over 100 characters";
            request.setAttribute("messCreateBlog", desc);
            request.getRequestDispatcher("AddBlog.jsp").forward(request, response);
        }

        if (desc.length() > 3500) {
            message = "description comes over 3500 characters";
            request.setAttribute("messCreateBlog", desc);
            request.getRequestDispatcher("AddBlog.jsp").forward(request, response);
        }

        model.Blog blog = new model.Blog();
        blog.setId(Integer.valueOf(id));
        blog.setTitle(title);
        blog.setDescription(desc);
        blog.setDate(Date.valueOf(java.time.LocalDate.now()));

        Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");

        blog.setTime(sdf.format(cal.getTime()));

        BlogDAO dao = new BlogDAO();

        dao.updateBlog(blog);

        response.sendRedirect("Blog");
    }

}
