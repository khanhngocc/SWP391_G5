/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.manager;

import com.oreilly.servlet.MultipartRequest;
import controller.base.BaseRequiredLoginController;
import dal.ClassDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Classes;

/**
 *
 * @author INSPIRON 15-7559
 */
public class ClassEdit extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        ClassDAO cd = new ClassDAO();
        Classes clas = cd.GetClassByClassID(Integer.parseInt(id));
//        request.setAttribute("cid", id);
        request.setAttribute("cl", clas);
        request.getRequestDispatcher("ClassEdit.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String fileNameImg = "";
        String webPath = getServletContext().getRealPath("/");
        StringBuilder sb = new StringBuilder(webPath.replace("\\build", "").replace("\\", "/"));
        sb.append("images/course");

        // get file name of img uploaded
        MultipartRequest m = new MultipartRequest(request, sb.toString());
        
        if (m.getFile("fname") != null) {
            String fileNameImgPath = m.getFile("fname").toString();
            int indexOflast = fileNameImgPath.lastIndexOf("\\");
            fileNameImg = fileNameImgPath.substring(indexOflast + 1, fileNameImgPath.length());
        }
        else{
            fileNameImg = m.getParameter("clg").substring(13);
        }
        String id = m.getParameter("cid");
        String newname = m.getParameter("title");
        if(newname.length()==0) newname = m.getParameter("cname");
        String newdate = m.getParameter("cdate");
        ClassDAO cd = new ClassDAO();
        String mess = "";
        int res = cd.UpdateClass(newname, "images/course/" + fileNameImg, newdate, Integer.parseInt(id));
        if (res > 0) {
            mess += "Edit Successfully";

        } else {
            mess += "Edit Failed";
        }

        request.setAttribute("mess", mess);
        request.getRequestDispatcher("ClassEdit.jsp").forward(request, response);
    }

}
