/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.marketing;

import com.oreilly.servlet.MultipartRequest;
import controller.base.BaseRequiredLoginController;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Blog;
import java.util.Calendar;
import java.text.SimpleDateFormat;
import dal.BlogDAO;
import dal.UserDAO;
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
        // get path to save file
        String webPath = getServletContext().getRealPath("/");
        StringBuilder sb = new StringBuilder(webPath.replace("\\build", "").replace("\\", "/"));
        sb.append("blog");

        // upload file to folder
        MultipartRequest m = new MultipartRequest(request, sb.toString());

        // get file name of img uploaded
        String fileNameImgPath = m.getFile("fname").toString();
        int indexOflast = fileNameImgPath.lastIndexOf("\\");
        String fileNameImg = fileNameImgPath.substring(indexOflast + 1, fileNameImgPath.length());

        
        // get file name of attach file uploaded
        String fileNameAttach = "";
        if (m.getFile("attach") != null) {
            String fileNameAttachPath = m.getFile("attach").toString();
            int indexOflastAttach = fileNameAttachPath.lastIndexOf("\\");
            fileNameAttach = fileNameAttachPath.substring(indexOflastAttach + 1, fileNameAttachPath.length());
        }

        String message = "";

        String title = m.getParameter("title");
        String desc = m.getParameter("desc");
        String category = m.getParameter("category");

        request.setAttribute("title", title);
        request.setAttribute("desc", desc);
        request.setAttribute("category", category);
        
        
        if (category.length() > 50) {
            message = "category comes over 50 characters";
            request.setAttribute("messCreateBlog", message);
            request.getRequestDispatcher("AddBlog.jsp").forward(request, response);
        }

        if (title.length() > 100) {
            message = "title comes over 100 characters";
            request.setAttribute("messCreateBlog", message);
            request.getRequestDispatcher("AddBlog.jsp").forward(request, response);
        }

        if (desc.length() > 3500) {
            message = "description comes over 3500 characters";
            request.setAttribute("messCreateBlog", message);
            request.getRequestDispatcher("AddBlog.jsp").forward(request, response);
        }

        // create new blog
        Blog blog = new Blog();
        blog.setTitle(title);
        blog.setCategory(category);
        blog.setStatus("1");
        blog.setImg_url("blog/" + fileNameImg);

        if (m.getFile("attach") != null) {
            blog.setAttach_url("blog/" + fileNameAttach);
        } else {
            blog.setAttach_url("");
        }

        blog.setDescription(desc);
        blog.setDate(Date.valueOf(java.time.LocalDate.now()));

        Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");

        blog.setTime(sdf.format(cal.getTime()));
        User session_user = (User) request.getSession(false).getAttribute("user");
        UserDAO userDAO = new UserDAO();
        User current_user = userDAO.getUser(session_user.getEmail());

        BlogDAO dao = new BlogDAO();

        // save to db
        dao.createBlog(blog, current_user);

   
        request.removeAttribute("title");
        request.removeAttribute("desc");
        request.removeAttribute("category");
        
        response.sendRedirect("BlogList");
    }

}
