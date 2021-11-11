package controller.manager;

import controller.base.BaseRequiredLoginController;
import dal.SubjectDAO;
import dal.UserDAO;
import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Subject;
import model.User;

/**
 *
 * @author dell
 */
public class AddSubject extends BaseRequiredLoginController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("AddSubject.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String title = request.getParameter("title");
        String price = request.getParameter("price");
        String salePrice = request.getParameter("salePrice");
        
        if(salePrice.equals(""))
             salePrice = "0";
        
        
        float num_price = 0;
        float num_sale = 0;

        try {
            num_price = Float.parseFloat(price);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        try {
            num_sale = Float.parseFloat(salePrice);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        Subject subject = new Subject();

        subject.setTitle(title);
        subject.setPrice(num_price);
        subject.setSalePrice(num_sale);
        subject.setCreatedDate(Date.valueOf(java.time.LocalDate.now()));

        User session_user = (User) request.getSession(false).getAttribute("user");
        UserDAO userDAO = new UserDAO();
        User current_user = userDAO.getUser(session_user.getEmail());

        SubjectDAO dao = new SubjectDAO();
        dao.createSubject(subject, current_user);

        response.sendRedirect("SubjectList");
    }

}
