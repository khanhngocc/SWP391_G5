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
import model.Subject;
import model.User;
/**
 *
 * @author dell
 */
public class SubjectDAO extends MyDAO{
    public int getRowCount(String statusRestricted) {
        int no = 0;
        xSql = "SELECT COUNT(*) FROM Subject where status like ?";
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

    public ArrayList<Subject> listAllSubject(String statusRestricted) {

       
        ArrayList<Subject> list = new ArrayList<>();

        try {
            String sql = "Select Subject.id,Subject.title,Subject.status,price,salePrice,[User].fullname from Subject,[User]\n"
                    + "where\n"
                    + "Subject.user_id = [User].id\n"
                    + "and Subject.status like ? \n";
                    
            PreparedStatement statement;

            statement = connection.prepareStatement(sql);
  
            statement.setString(1, "%" + statusRestricted + "%");
           
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {

                Subject s = new Subject();
                s.setId(rs.getInt(1));
                s.setTitle(rs.getString(2));
                s.setStatus(rs.getString(3));
                s.setPrice(rs.getFloat(4));
                s.setSalePrice(rs.getFloat(5));
                s.setAuthor_name(rs.getString(6));
                list.add(s);
            }

            return list;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;

    }

    public ArrayList<Subject> listAllSubject(int pageIndex, int pageSize, String statusRestricted) {

        int numberOfRecord = (pageIndex - 1) * pageSize;
        ArrayList<Subject> list = new ArrayList<>();

        try {
            String sql = "Select Subject.id,Subject.title,Subject.status,price,salePrice,[User].fullname from Subject,[User]\n"
                    + "where\n"
                    + "Subject.user_id = [User].id\n"
                    + "and Subject.status like ? \n"
                    + "order by Subject.id desc\n"
                    + "OFFSET ? ROWS\n"
                    + "FETCH NEXT ? ROWS ONLY";
            PreparedStatement statement;

            statement = connection.prepareStatement(sql);
  
            statement.setString(1, "%" + statusRestricted + "%");
            statement.setInt(2, numberOfRecord);
            statement.setInt(3, pageSize);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {

                Subject s = new Subject();
                s.setId(rs.getInt(1));
                s.setTitle(rs.getString(2));
                s.setStatus(rs.getString(3));
                s.setPrice(rs.getFloat(4));
                s.setSalePrice(rs.getFloat(5));
                s.setAuthor_name(rs.getString(6));
                list.add(s);
            }

            return list;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;

    }

    public void changeBlogStatus(int id, String status) {
        xSql = "Update Subject set status = ? where id= ? ";
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

    public Subject getSubject(int id, String statusRestricted) {

        Subject s = new Subject();

        xSql = "select Subject.id,Subject.title,Subject.status,price,salePrice,[User].fullname from Subject,[User]\n"
                + "where\n"
                + "Subject.user_id = [User].id\n"
                + "and\n"
                + "Subject.status like ? and\n"
                + "Subject.id = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, "%" + statusRestricted + "%");
            ps.setInt(2, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                s.setId(rs.getInt(1));
                s.setTitle(rs.getString(2));
                s.setStatus(rs.getString(3));
                s.setPrice(rs.getFloat(4));
                s.setSalePrice(rs.getFloat(5));
                s.setAuthor_name(rs.getString(6));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return s;
    }

    public void deleteSubject(int id) {
        xSql = "Delete from Subject where id = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, id);

            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void createSubject(Subject subject, User user) {
        xSql = "INSERT INTO [Subject]\n"
                + "           ([title]\n"
                + "           ,[user_id]\n"
                + "           ,[status]\n"
                + "           ,[price]\n"
                + "           ,[salePrice])\n"
                + "     VALUES\n"
                + "           (\n"
                + "		?  \n"
                + "           , ? \n"
                + "           , ? \n"
                + "           ,? \n"
                + "           , ?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, subject.getTitle());
            ps.setInt(2, user.getId());
            ps.setString(3, "Published");
            ps.setFloat(4, subject.getPrice());
            ps.setFloat(5, subject.getSalePrice());
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateSubject(Subject subject) {
        xSql = "UPDATE [Subject]\n"
                + "   SET [title] = ? \n"
                + "      ,[status] =? \n"
                + "      ,[price] = ? \n"
                + "      ,[salePrice] = ? \n"
                + " WHERE [Subject].id = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, subject.getTitle());
            ps.setString(2, subject.getStatus());
            ps.setFloat(3, subject.getPrice());
            ps.setFloat(4, subject.getSalePrice());
            ps.setInt(5, subject.getId());
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
