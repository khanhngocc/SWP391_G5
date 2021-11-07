/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import com.oreilly.servlet.MultipartRequest;
import controller.base.BaseRequiredLoginController;
import dal.RollDAO;
import dal.SettingDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Roll;
import model.Setting;
import model.User;

/**
 *
 * @author Admin
 */
public class EditUserControll extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        UserDAO udao = new UserDAO();
        User x = udao.getUser(email);
        request.setAttribute("user", x);
        SettingDAO settingDAO = new SettingDAO();
        ArrayList<Setting> listTitle = settingDAO.getListSettingByType("Title User");
        request.setAttribute("listTitle", listTitle);
        RollDAO rollDAO = new RollDAO();
        ArrayList<Roll> listAllRolls = rollDAO.listAllRolls();
        request.setAttribute("listAllRolls", listAllRolls);
        request.getRequestDispatcher("UserDetail.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String fileNameImg = "";
        String webPath = getServletContext().getRealPath("/");
        StringBuilder sb = new StringBuilder(webPath.replace("\\build", "").replace("\\", "/"));
        sb.append("images/avatar");

        // get file name of img uploaded
        MultipartRequest m = new MultipartRequest(request, sb.toString());

        if (m.getFile("fname") != null) {
            String fileNameImgPath = m.getFile("fname").toString();
            int indexOflast = fileNameImgPath.lastIndexOf("\\");
            fileNameImg = fileNameImgPath.substring(indexOflast + 1, fileNameImgPath.length());
        }

        String name = m.getParameter("name");
        String title = m.getParameter("title");
        String phone = m.getParameter("phone");
        String email = m.getParameter("email");
        String current_avatar = m.getParameter("imageurl");

        User user = new User();
        user.setFullname(name);
        user.setTitle(title);
        user.setPhone(phone);
        user.setEmail(email);
        user.setAvatar(current_avatar);

        if (m.getFile("fname") != null) {
            user.setAvatar("images/avatar/" + fileNameImg);
        }

        UserDAO dao = new UserDAO();
        dao.updateUser(user);
        
        response.sendRedirect("UserList");
    }

}
