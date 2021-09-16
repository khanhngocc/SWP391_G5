/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.BlogDAO;
import dal.UserDAO;
import model.Blog;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author dell
 */
public class AddBlog extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("AddBlog.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String message = "";

        String title = request.getParameter("title");
        String desc = request.getParameter("desc");

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

        Blog blog = new Blog();
        blog.setTitle(title);
        blog.setDescription(desc);
        blog.setDate(Date.valueOf(java.time.LocalDate.now()));
        User session_user = (User) request.getSession(false).getAttribute("user");
        UserDAO userDAO = new UserDAO();
        User current_user = userDAO.getUser(session_user.getEmail());
        BlogDAO dao = new BlogDAO();
        dao.createBlog(blog, current_user);

        message = "create successfully";
        request.setAttribute("messCreateBlog", message);
        request.getRequestDispatcher("AddBlog.jsp").forward(request, response);
    }

}
