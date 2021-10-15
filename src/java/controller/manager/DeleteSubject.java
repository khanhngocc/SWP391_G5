/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.manager;
import controller.base.BaseRequiredLoginController;
import dal.SubjectDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dell
 */
public class DeleteSubject extends BaseRequiredLoginController{

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        SubjectDAO dao = new SubjectDAO();
        dao.deleteSubject(Integer.valueOf(id));
        request.getRequestDispatcher("SubjectList").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
    }

  
}
