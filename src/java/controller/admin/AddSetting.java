/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;
import controller.base.BaseRequiredLoginController;
import dal.SettingDAO;
import dal.UserDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Setting;
import model.User;

/**
 *
 * @author dell
 */
public class AddSetting extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       request.getRequestDispatcher("AddSetting.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String type = request.getParameter("type");
       String value = request.getParameter("value");
       String note = request.getParameter("note");
       
       Setting setting = new Setting();
       setting.setType(type);
       setting.setValue(value);
       setting.setNote(note);
       
        User session_user = (User) request.getSession(false).getAttribute("user");
        UserDAO userDAO = new UserDAO();
        User current_user = userDAO.getUser(session_user.getEmail());
        
        SettingDAO settingDAO = new SettingDAO();
        settingDAO.createSetting(setting, current_user);
        response.sendRedirect("SettingList");
    }

   

}
