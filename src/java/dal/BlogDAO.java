/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Blog;
import model.User;

/**
 *
 * @author dell
 */
public class BlogDAO extends MyDAO {

    public int getRowCount(String statusRestricted) {
        int no = 0;
        xSql = "SELECT COUNT(*) FROM Blog where status like ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, "%" + statusRestricted + "%");
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

    public Blog getBlog(int id, String statusRestricted) {
        Blog b = new Blog();
        xSql = "select Blog.id,title,description,created_Date,fullname,Blog.user_id,timeCreated,image_Url,Category,status from Blog,[User]\n"
                + "where\n"
                + "Blog.user_id = [User].id\n"
                + "and\n"
                + "Blog.status like ? and\n"
                + "Blog.id = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, "%" + statusRestricted + "%");
            ps.setInt(2, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                b.setId(rs.getInt(1));
                b.setTitle(rs.getString(2));
                b.setDescription(rs.getString(3));
                b.setDate(rs.getDate(4));
                b.setAuthor(rs.getString(5));
                b.setAuthor_id(rs.getInt(6));
                b.setTime(rs.getString(7));
                b.setImg_url(rs.getString(8));
                b.setCategory(rs.getString(9));
                b.setStatus(rs.getString(10));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return b;
    }

    public int getRowCountForSearch(String searchName, String category, String statusRestricted) {
        int no = 0;
        xSql = "SELECT COUNT(*) FROM Blog WHERE title LIKE ? and Category LIKE ? and status LIKE ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, "%" + searchName + "%");
            ps.setString(2, "%" + category + "%");
            ps.setString(3, "%" + statusRestricted + "%");
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

    public ArrayList<Blog> listAllBlog(int pageIndex, int pageSize, String searchName, String category, String statusRestricted) {

        int numberOfRecord = (pageIndex - 1) * pageSize;
        ArrayList<Blog> list = new ArrayList<>();

        try {
            String sql = "select Blog.id,title,description,created_Date,[User].fullname,timeCreated,image_Url,Category,status from Blog,[User]\n"
                    + "where\n"
                    + "Blog.user_id = [User].id\n"
                    + "and title like ?\n"
                    + "and Category like ?\n"
                    + "and Blog.status like ? \n"
                    + "order by created_Date desc\n"
                    + "OFFSET ? ROWS\n"
                    + "FETCH NEXT ? ROWS ONLY";
            PreparedStatement statement;

            statement = connection.prepareStatement(sql);
            statement.setString(1, "%" + searchName + "%");
            statement.setString(2, "%" + category + "%");
            statement.setString(3, "%" + statusRestricted + "%");
            statement.setInt(4, numberOfRecord);
            statement.setInt(5, pageSize);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {

                Blog b = new Blog();
                b.setId(rs.getInt(1));
                b.setTitle(rs.getString(2));
                b.setDescription(rs.getString(3));
                b.setDate(rs.getDate(4));
                b.setAuthor(rs.getString(5));
                b.setTime(rs.getString(6));
                b.setImg_url(rs.getString(7));
                b.setCategory(rs.getString(8));
                b.setStatus(rs.getString(9));
                list.add(b);
            }

            return list;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;

    }

    public ArrayList<String> listCategories() {

        ArrayList<String> list = new ArrayList<>();

        try {
            String sql = "Select distinct Category from Blog";
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

    public void deleteBlog(int id) {
        xSql = "Delete from Blog where id = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, id);

            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void changeBlogStatus(int id, String status) {
        xSql = "Update Blog set status = ? where id= ? ";
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

    public void createBlog(Blog blog, User user) {
        xSql = "INSERT INTO [Blog]\n"
                + "           ([title]\n"
                + "           ,[description]\n"
                + "           ,[image_Url]\n"
                + "           ,[created_Date]\n"
                + "           ,[user_id]\n"
                + "           ,[timeCreated]\n"
                + "           ,[Category]\n"
                + "           ,[status])\n"
                + "     VALUES\n"
                + "           (? \n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, blog.getTitle());
            ps.setString(2, blog.getDescription());
            ps.setString(3, blog.getImg_url());
            ps.setDate(4, blog.getDate());
            ps.setInt(5, user.getId());
            ps.setString(6, blog.getTime());
            ps.setString(7, blog.getCategory());
            ps.setString(8, blog.getStatus());
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateBlog(Blog blog) {
        xSql = "UPDATE [Blog]\n"
                + "   SET [title] = ?\n"
                + "      ,[description] = ?\n"
                + "      ,[image_Url] = ?\n"
                + "      ,[created_Date] = ?\n"
                + "    ,[timeCreated] = ?\n"
                + "      ,[Category] = ?\n"
                + " WHERE [Blog].id = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, blog.getTitle());
            ps.setString(2, blog.getDescription());
            ps.setString(3, blog.getImg_url());
            ps.setDate(4, blog.getDate());
            ps.setString(5, blog.getTime());
            ps.setString(6, blog.getCategory());
            ps.setInt(7, blog.getId());
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    
}
