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

    public Blog getBlog(int id) {
        Blog b = new Blog();
        xSql = "select Blog.id,title,description,created_Date,fullname,Blog.user_id,timeCreated,image_Url,Category from Blog,[User]\n"
                + "where\n"
                + "Blog.user_id = [User].id\n"
                + "and\n"
                + "Blog.id = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, id);
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
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return b;
    }

    public int getRowCountForSearch(String searchName,String category) {
        int no = 0;
        xSql = "SELECT COUNT(*) FROM Blog WHERE title LIKE ? and Category LIKE ? ";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, "%" + searchName + "%");
            ps.setString(2, "%"+ category + "%");
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

    public ArrayList<Blog> listAllBlog(int pageIndex, int pageSize, String searchName,String category) {

        int numberOfRecord = (pageIndex - 1) * pageSize;
        ArrayList<Blog> list = new ArrayList<>();

        try {
            String sql = "select Blog.id,title,description,created_Date,[User].fullname,timeCreated,image_Url,Category,status from Blog,[User]\n"
                    + "where\n"
                    + "Blog.user_id = [User].id\n"
                    + "and title like ?\n"
                    + "and Category like ?\n"
                    + "order by created_Date desc\n"
                    + "OFFSET ? ROWS\n"
                    + "FETCH NEXT ? ROWS ONLY";
            PreparedStatement statement;

            statement = connection.prepareStatement(sql);
            statement.setString(1, "%" + searchName + "%");
            statement.setString(2, "%"+category+"%");
            statement.setInt(3, numberOfRecord);
            statement.setInt(4, pageSize);
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
    
  
    public void changeBlogStatus(int id,String status){
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
}
