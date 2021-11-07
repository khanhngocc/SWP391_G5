package controller.admin;

import controller.base.BaseRequiredLoginController;
import dal.RollDAO;
import dal.UserDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Roll;
import model.User;
import utilities.Constant;

/**
 *
 * @author Admin
 */
public class UserListControl extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        UserDAO dao = new UserDAO();

        int pageSize = 4;

        String raw_pageindex = request.getParameter("page");

        if (raw_pageindex == null) {
            raw_pageindex = "1";
        }

        int pageIndex = 0;
        try {
            pageIndex = Integer.parseInt(raw_pageindex);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        int rowCount = 0;

        String searchName = request.getParameter("searchName");
        String roll = request.getParameter("roll");
        String status = request.getParameter("status");

        // case default: don't search and don't filter
        if (searchName == null && roll == null && status == null) {
            searchName = "";
            roll = "";
            status = "";
            rowCount = dao.getRowCount();
        } else { // case specific: search or filter

            rowCount = dao.getRowCountForSearch(searchName, roll, status);

        }

        int pageCount;

        if (rowCount % pageSize == 0) {
            pageCount = rowCount / pageSize;
        } else {
            pageCount = rowCount / pageSize + 1;
        }

        int gap = 1;

        ArrayList<User> listAllUsers = dao.getAllUsers(pageIndex, pageSize, searchName, roll, status);

        RollDAO rollDAO = new RollDAO();
        ArrayList<Roll> listAllRolls = rollDAO.listAllRolls();

        request.setAttribute("listAllUsers", listAllUsers);
        request.setAttribute("listAllRolls", listAllRolls);
        request.setAttribute("listAllStatus", Constant.status);

        request.setAttribute("searchName", searchName);
        request.setAttribute("roll", roll);
        request.setAttribute("status", status);

        request.setAttribute("pagecount", pageCount);
        request.setAttribute("pageindex", pageIndex);
        request.setAttribute("gap", gap);
        
        request.getRequestDispatcher("UserList.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
