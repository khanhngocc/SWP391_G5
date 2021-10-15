package controller.manager;

import controller.base.BaseRequiredLoginController;
import dal.SubjectDAO;
import dal.UserDAO;
import java.io.IOException;
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

    private String patternFloat ="^([+-]?\\d*\\.?\\d*)$";
    
    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("AddSubject.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String message = "create successfully!";

        String title = request.getParameter("title");
        String price = request.getParameter("price");
        String salePrice = request.getParameter("salePrice");
        float num_price = 0;
        float num_sale = 0;

        if (title.length() > 50) {
            message = "length of title must be less than 50 characters";
            request.setAttribute("messAddSubject", message);
            request.getRequestDispatcher("AddSubject.jsp").forward(request, response);
        }

        if (price.matches(patternFloat) == false) {
            message = "price is not a number";
            request.setAttribute("messAddSubject", message);
            request.getRequestDispatcher("AddSubject.jsp").forward(request, response);
        }

        if (salePrice.matches(patternFloat) == false) {
            message = "sale price is not a number";
            request.setAttribute("messAddSubject", message);
            request.getRequestDispatcher("AddSubject.jsp").forward(request, response);
        }

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

        User session_user = (User) request.getSession(false).getAttribute("user");
        UserDAO userDAO = new UserDAO();
        User current_user = userDAO.getUser(session_user.getEmail());

        SubjectDAO dao = new SubjectDAO();
        dao.createSubject(subject, current_user);
        
        request.setAttribute("messAddSubject", message);
        request.getRequestDispatcher("AddSubject.jsp").forward(request, response);
    }

}