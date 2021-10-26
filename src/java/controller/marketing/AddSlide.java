/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.marketing;

import com.oreilly.servlet.MultipartRequest;
import controller.base.BaseRequiredLoginController;
import dal.SlideDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Slide;
import model.User;

/**
 *
 * @author dell
 */
public class AddSlide extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("AddSlide.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // get path to save file
        String webPath = getServletContext().getRealPath("/");
        StringBuilder sb = new StringBuilder(webPath.replace("\\build", "").replace("\\", "/"));
        sb.append("images/slide");

        // upload file to folder
        MultipartRequest m = new MultipartRequest(request, sb.toString());

        // get file name of img uploaded
        String fileNameImgPath = m.getFile("fname").toString();
        int indexOflast = fileNameImgPath.lastIndexOf("\\");
        String fileNameImg = fileNameImgPath.substring(indexOflast + 1, fileNameImgPath.length());

        String message = "";

        String title = m.getParameter("title");

        String notes = m.getParameter("notes");

        if (title.length() > 100) {
            message = "title comes over 100 characters";
            request.setAttribute("messCreateSlide", message);
            request.getRequestDispatcher("AddSlide.jsp").forward(request, response);
        }

        if (notes.length() > 1000) {
            message = "notes comes over 3500 characters";
            request.setAttribute("messCreateSlide", message);
            request.getRequestDispatcher("AddSlide.jsp").forward(request, response);
        }
        
        SlideDAO dao = new SlideDAO();
        
        Slide slide = new Slide();
        slide.setTitle(title);
        slide.setImage_Url("images/slide/" + fileNameImg);
        slide.setBacklink("SlideDetailed?id="+dao.getMaxID());
        slide.setNote(notes);

        User session_user = (User) request.getSession(false).getAttribute("user");
        UserDAO userDAO = new UserDAO();
        User current_user = userDAO.getUser(session_user.getEmail());

        slide.setUser_id(current_user.getId());

        dao.createSlide(slide, current_user);

        response.sendRedirect("SlideList");

    }

}
