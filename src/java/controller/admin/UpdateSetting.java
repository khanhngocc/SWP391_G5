/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import controller.base.BaseRequiredLoginController;
import dal.SettingDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Setting;

/**
 *
 * @author dell
 */
public class UpdateSetting extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        SettingDAO settingDAO = new SettingDAO();
        Setting setting = settingDAO.getSetting(Integer.valueOf(id));
        request.setAttribute("setting", setting);
        request.getRequestDispatcher("UpdateSetting.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String type = request.getParameter("type");
        String value = request.getParameter("value");
        String note = request.getParameter("note");

        Setting setting = new Setting();
        setting.setId(Integer.valueOf(id));
        setting.setType(type);
        setting.setValue(value);
        setting.setNote(note);

        SettingDAO settingDAO = new SettingDAO();
        settingDAO.updateSetting(setting);
        response.sendRedirect("SettingList");
    }

}
