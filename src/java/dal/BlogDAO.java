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
import model.User;

/**
 *
 * @author dell
 */
public class BlogDAO extends MyDAO {

    public void createBlog(Blog blog, User user) {
        xSql = "INSERT INTO [dbo].[Blog]\n"
                + "           ([title]\n"
                + "           ,[description]\n"
                + "           ,[image_Url]\n"
                + "           ,[created_Date]\n"
                + "           ,[user_id])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, blog.getTitle());
            ps.setString(2, blog.getDescription());
            ps.setString(3, "");
            ps.setDate(4, blog.getDate());
            ps.setInt(5, user.getId());

            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    
    public int getRowCount() {
       int no = 0;
        xSql = "SELECT COUNT(*) FROM Blog";
        try {
            ps = con.prepareStatement(xSql);
           
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
    
     public int getRowCountForSearch(String searchName) {
       int no = 0;
        xSql = "SELECT COUNT(*) FROM Blog WHERE title LIKE ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, "%"+searchName+"%");
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
    public ArrayList<Blog> listAllBlog(int pageIndex, int pageSize, String searchName) {
        
        int numberOfRecord = (pageIndex - 1) * pageSize;
        ArrayList<Blog> list = new ArrayList<>();

        try {
            String sql = "select title,description,created_Date,[User].fullname from Blog,[User]\n"
                    + "where\n"
                    + "Blog.user_id = [User].id\n"
                    + "and title like ?\n"
                    + "order by created_Date desc\n"
                    + "OFFSET ? ROWS\n"
                    + "FETCH NEXT ? ROWS ONLY";
            PreparedStatement statement;

            statement = connection.prepareStatement(sql);
            statement.setString(1, "%"+searchName+"%");
            statement.setInt(2, numberOfRecord);
            statement.setInt(3, pageSize);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {

                Blog b = new Blog();
                b.setTitle(rs.getString(1));
                b.setDescription(rs.getString(2));
                b.setDate(rs.getDate(3));
                b.setAuthor(rs.getString(4));
                list.add(b);
            }

            return list;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;

    }
    
   
}
