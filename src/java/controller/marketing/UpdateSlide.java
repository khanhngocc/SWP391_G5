/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.marketing;

import com.oreilly.servlet.MultipartRequest;
import controller.base.BaseRequiredLoginController;
import dal.SlideDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Slide;
import utilities.ValidationField;

/**
 *
 * @author dell
 */
public class UpdateSlide extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        SlideDAO dao = new SlideDAO();
        Slide slide = dao.getSlide(Integer.valueOf(id), "");
        request.setAttribute("slide", slide);
        request.getRequestDispatcher("UpdateSlide.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        boolean isValid = true;

        String message = "";
        // get path to save img
        String webPath = getServletContext().getRealPath("/");
        StringBuilder sb = new StringBuilder(webPath.replace("\\build", "").replace("\\", "/"));
        sb.append("images/slide");

        String fileNameImg = "";

        // get file name of img uploaded
        MultipartRequest m = new MultipartRequest(request, sb.toString());

        if (m.getFile("fname") != null) {
            String fileNameImgPath = m.getFile("fname").toString();
            int indexOflast = fileNameImgPath.lastIndexOf("\\");
            fileNameImg = fileNameImgPath.substring(indexOflast + 1, fileNameImgPath.length());
        }

        String srcImg = m.getParameter("srcImg");
        String id = m.getParameter("id");
        String title = m.getParameter("title");
        String notes = m.getParameter("notes");
        String backlink = m.getParameter("backlink");
        
        Slide slide = new Slide();
        slide.setId(Integer.valueOf(id));
        slide.setTitle(title);
        slide.setImage_Url(srcImg);
        slide.setBacklink(backlink);
        slide.setNote(notes);

        if (m.getFile("fname") != null) {
            slide.setImage_Url("images/slide/" + fileNameImg);
        }

        request.setAttribute("slide", slide);
      
     
        if (title.length() > 100) {
            message = "title comes over 100 characters";
            isValid = false;
            dispatch(request, message, response);
        }

        if (notes.length() > 1000) {
            message = "notes comes over 1000 characters";
            isValid = false;
            dispatch(request, message, response);
        }

        if (isValid == true) {
            SlideDAO slideDAO = new SlideDAO();
            slideDAO.updateSlide(slide);
            response.sendRedirect("SlideList");
        }

    }

    private void dispatch(HttpServletRequest request, String message, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("messUpdateSlide", message);
        request.getRequestDispatcher("UpdateSlide.jsp").forward(request, response);
    }

}
