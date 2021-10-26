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
import model.Subject;
import model.User;

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

        xSql = "SELECT COUNT(*) FROM slide WHERE ( title LIKE ? or backlink LIKE ? ) and status LIKE ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, "%" + searchName + "%");
            ps.setString(2, "%" + searchName + "%");
            ps.setString(3, statusRestricted);
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
                    + "and ( slide.title like ?\n"
                    + "or backlink LIKE ? )\n"
                    + "and slide.status like ? \n"
                    + "order by slide.id desc\n"
                    + "LIMIT ?,?";

            PreparedStatement statement;

            statement = connection.prepareStatement(sql);
            statement.setString(1, "%" + searchName + "%");
            statement.setString(2, "%" + searchName + "%");
            statement.setString(3, statusRestricted);
            statement.setInt(4, numberOfRecord);
            statement.setInt(5, pageSize);
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

    public void changeSlideStatus(int id, String status) {
        xSql = "Update slide set status = ? where id= ? ";
        try {
            ps = con.prepareStatement(xSql);

            ps.setString(1, status);

            ps.setInt(2, id);

            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ArrayList<String> listStatus() {

        ArrayList<String> list = new ArrayList<>();

        try {
            String sql = "Select distinct status from slide";
            PreparedStatement statement;

            statement = connection.prepareStatement(sql);

            ResultSet rs = statement.executeQuery();

            while (rs.next()) {

                list.add(rs.getString(1));
            }

            return list;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void createSlide(Slide slide, User user) {
        xSql = "INSERT INTO `slide`\n"
                + "(\n"
                + "`title`,\n"
                + "`image`,\n"
                + "`backlink`,\n"
                + "`status`,\n"
                + "`user_id`,\n"
                + "`notes`)\n"
                + "VALUES\n"
                + "(?\n"
                + ",?\n"
                + ",?\n"
                + ",?\n"
                + ",?\n"
                + ",?\n"
                + ");";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, slide.getTitle());
            ps.setString(2, slide.getImage_Url());
            ps.setString(3, slide.getBacklink());
            ps.setString(4, "Published");
            ps.setInt(5, user.getId());
            ps.setString(6, slide.getNote());
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Slide getSlide(int id, String statusRestricted) {

        if (statusRestricted.equals("")) {
            statusRestricted = "%%";
        }

        Slide s = new Slide();

        xSql = "select id,title,backlink,image,notes from slide\n"
                + "where\n"
                + "status like ? and\n"
                + "id = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, statusRestricted);
            ps.setInt(2, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                s.setId(rs.getInt(1));
                s.setTitle(rs.getString(2));
                s.setBacklink(rs.getString(3));
                s.setImage_Url(rs.getString(4));
                s.setNote(rs.getString(5));

            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return s;
    }

    public void updateSlide(Slide slide) {
        xSql = "UPDATE `slide`\n"
                + "SET\n"
                + "`title` = ?,\n"
                + "`image` = ?,\n"
                + "`notes` = ?\n"
                + "WHERE `id` = ?;";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, slide.getTitle());
            ps.setString(2, slide.getImage_Url());
            ps.setString(3, slide.getNote());
            ps.setInt(4, slide.getId());
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

     public String getMaxID() {
        String id = "1";
        xSql = "SELECT max(id)+1 FROM quizpractice.slide;";

        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            if (rs.next()) {
                
                if(rs.getString(1) != null)
                    id = rs.getString(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }
     
    public static void main(String[] args) {
        SlideDAO dao = new SlideDAO();
        String a = dao.getMaxID();
        System.out.println(a);
    }

    
}
