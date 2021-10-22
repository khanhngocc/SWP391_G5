/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Blog;
import model.Slide;

/**
 *
 * @author dell
 */
public class SlideDAO extends MyDAO {

    public int getRowCount(String statusRestricted) {

        int no = 0;

        if (statusRestricted.equals("")) {
            statusRestricted = "%%";
        }

        xSql = "SELECT COUNT(*) FROM slide where status like ?";
        try {
            ps = con.prepareStatement(xSql);

            ps.setString(1, statusRestricted);
            rs = ps.executeQuery();
            if (rs.next()) {
                no = rs.getInt(1);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return no;
    }

    public int getRowCountForSearch(String searchName, String statusRestricted) {
        int no = 0;

        if (statusRestricted.equals("")) {
            statusRestricted = "%%";
        }

        xSql = "SELECT COUNT(*) FROM slide WHERE title LIKE ? and status LIKE ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, "%" + searchName + "%");
          
            ps.setString(2, statusRestricted);
            rs = ps.executeQuery();
            if (rs.next()) {
                no = rs.getInt(1);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return no;
    }

    public ArrayList<Slide> listAllSlides(int pageIndex, int pageSize, String searchName, String statusRestricted) {

        if (statusRestricted.equals("")) {
            statusRestricted = "%%";
        }

        int numberOfRecord = (pageIndex - 1) * pageSize;
        ArrayList<Slide> list = new ArrayList<>();

        try {
            String sql = "select slide.id,slide.title,image,backlink,User.fullname,slide.status from slide,User\n"
                    + "where\n"
                    + "slide.user_id = User.id\n"
                    + "and slide.title like ?\n"
                  
                    + "and slide.status like ? \n"
                    + "order by slide.id desc\n"
                    + "LIMIT ?,?";

            PreparedStatement statement;

            statement = connection.prepareStatement(sql);
            statement.setString(1, "%" + searchName + "%");
           
            statement.setString(2, statusRestricted);
            statement.setInt(3, numberOfRecord);
            statement.setInt(4, pageSize);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {

                Slide s = new Slide();
                s.setId(rs.getInt(1));
                s.setTitle(rs.getString(2));
                s.setImage_Url(rs.getString(3));
                s.setBacklink(rs.getString(4));
                s.setAuthor_name(rs.getString(5));
                s.setStatus(rs.getString(6));

                list.add(s);
            }

            return list;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;

    }
}
