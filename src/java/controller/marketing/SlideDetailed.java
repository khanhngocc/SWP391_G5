/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.marketing;
import controller.base.BaseRequiredLoginController;
import dal.SlideDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Slide;

/**
 *
 * @author dell
 */
public class SlideDetailed extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String id = request.getParameter("id");
        SlideDAO dao = new SlideDAO();
        Slide slide = dao.getSlide(Integer.valueOf(id), "");
        request.setAttribute("slide", slide);
        request.getRequestDispatcher("SlideDetailed.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
    }

   

}
