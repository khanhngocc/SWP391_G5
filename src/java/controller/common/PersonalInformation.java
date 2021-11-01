/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.common;

import com.oreilly.servlet.MultipartRequest;
import controller.base.BaseRequiredLoginController;
import dal.SettingDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Setting;
import model.User;
import utilities.ValidationField;

/**
 *
 * @author LEGION
 */
public class PersonalInformation extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User session_user = (User) request.getSession(false).getAttribute("user");
        UserDAO userDAO = new UserDAO();
        User current_user = userDAO.getUser(session_user.getEmail());
        current_user.setPhone("0"+current_user.getPhone());
        request.setAttribute("userInfor", current_user);
        SettingDAO settingDAO = new SettingDAO();
        ArrayList<Setting> listTitle = settingDAO.getListSettingByType("Title User");
        request.setAttribute("listTitle", listTitle);
        request.getRequestDispatcher("UpdateInformation.jsp").forward(request, response);

    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
        String message = "";
        boolean isValid = true;
        // get path to save img
        String webPath = getServletContext().getRealPath("/");
        StringBuilder sb = new StringBuilder(webPath.replace("\\build", "").replace("\\", "/"));
        sb.append("images/avatar");

        String fileNameImg = "";

        // get file name of img uploaded
        MultipartRequest m = new MultipartRequest(request, sb.toString());

        if (m.getFile("fname") != null) {
            String fileNameImgPath = m.getFile("fname").toString();
            int indexOflast = fileNameImgPath.lastIndexOf("\\");
            fileNameImg = fileNameImgPath.substring(indexOflast + 1, fileNameImgPath.length());
        }
        String title = m.getParameter("title");
        String email = m.getParameter("email");
        String fullname = m.getParameter("name");
        String phone = m.getParameter("phone");
        String srcAvatar = m.getParameter("srcAvatar");
      
        User updatedUser = new User();
        updatedUser.setTitle(title);

        updatedUser.setEmail(email);

        updatedUser.setFullname(fullname);

        updatedUser.setPhone(phone);

        updatedUser.setAvatar(srcAvatar);

        if (m.getFile("fname") != null && ValidationField.isImageFileExtension(fileNameImg, ValidationField.standardExtension) == true) {
            updatedUser.setAvatar("images/avatar/" + fileNameImg);
        }

        request.setAttribute("userInfor", updatedUser);

        if (ValidationField.isImageFileExtension(fileNameImg, ValidationField.standardExtension) == false && !fileNameImg.equals("")) {
            message = "file input is not a image";
            isValid = false;
            dispatch(request, message, response);
        } else if (fullname.length() > 100) {
            message = "fullname comes over 100 characters";
            isValid = false;
            dispatch(request, message, response);
        } else if (phone.length() > 100) {
            message = "phone comes over 100 characters";
            isValid = false;
            dispatch(request, message, response);
        } else if (!phone.matches(ValidationField.VALID_PHONE_NUMBER.toString())) {
            message = "phone number contains only 11 digit";
            isValid = false;
            dispatch(request, message, response);
        }

        if (isValid == true) {
            UserDAO dao = new UserDAO();
            dao.updateUser(updatedUser);
            message = "update information successfully!";
            dispatch(request, message, response);
        }

    }

    private void dispatch(HttpServletRequest request, String message, HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("messUpdateUser", message);
        SettingDAO settingDAO = new SettingDAO();
        ArrayList<Setting> listTitle = settingDAO.getListSettingByType("Title User");
        request.setAttribute("listTitle", listTitle);
        request.getRequestDispatcher("UpdateInformation.jsp").forward(request, response);
    }

}
