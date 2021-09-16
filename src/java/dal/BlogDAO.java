/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

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
}
