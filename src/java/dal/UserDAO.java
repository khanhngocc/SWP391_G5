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
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

/**
 *
 * @author Admin
 */
public class UserDAO extends MyDAO {

    public User getUser(String email) {
        User x = null;
        xSql = "SELECT * FROM User WHERE email = ? ";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                x = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getDate(8), rs.getString(7), rs.getString(9), rs.getInt(10));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (x);
    }

    public ArrayList<User> getAllUser() {
        ArrayList<User> x = new ArrayList<>();
        xSql = "SELECT * FROM User";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                x.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getDate(8), rs.getString(7), rs.getString(9), rs.getInt(10)));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (x);
    }

    public User getAccount(String email, String password) {
        User user = null;
        try {
            String sql = "Select url,Roll.id from User,Roll,Roll_Feature where User.roll_id = Roll.id \n"
                    + "and Roll.id = Roll_Feature.roll_id \n"
                    + "and User.email = ?\n"
                    + "and User.password = ?\n"
                    + "and User.status = 'Active'";
            PreparedStatement statement;

            statement = connection.prepareStatement(sql);
            statement.setString(1, email);
            statement.setString(2, password);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                if (user == null) {
                    user = new User();
                }                
                user.setEmail(email);
                user.setPassword(password);
                user.getUrl().add(rs.getString("url"));
                user.setRollId(rs.getInt(2));
            }
            return user;

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;

    }

    public int UpdateUser(String email, String fullname, String phone, boolean gender) {
        int n = 0;
        String sql = "UPDATE User\n"
                + "   SET fullname = ?\n"
                + "      ,gender = ?\n"
                + "      ,phone = ?\n"
                + "     \n"
                + " WHERE email = ?";
        PreparedStatement statement;

        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, fullname);
            statement.setBoolean(2, gender);
            statement.setString(3, phone);
            statement.setString(4, email);
            n = statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int changePassword(String email, String password) {
        int n = 0;
        String sql = "UPDATE User\n"
                + "   SET password = ?\n"
                + " WHERE email = ?";
        PreparedStatement statement;

        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, password);
            statement.setString(2, email);

            n = statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public String getRollName(String email) {
        String roll_name = "";
        try {
            String sql = "Select Roll.name from User,Roll\n"
                    + "where\n"
                    + "User.roll_id = Roll.id\n"
                    + "and\n"
                    + "email = ?";
            PreparedStatement statement;

            statement = connection.prepareStatement(sql);
            statement.setString(1, email);

            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                roll_name = rs.getString(1);
            }
            return roll_name;

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return roll_name;
    }

    public void addUser(User x) {
        xSql = "INSERT INTO User\n"
                + "           (fullname\n"
                + "           ,title\n"
                + "           ,email\n"
                + "           ,phone\n"
                + "           ,password\n"
                + "           ,avatar\n"
                + "           ,createDate\n"
                + "           ,status\n"
                + "           ,roll_id)\n"
                + "     VALUES (?,?,?,?,?,?,?,?,?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, x.getFullname());
            ps.setString(2, x.getTitle());
            ps.setString(3, x.getEmail());
            ps.setString(4, x.getPhone());
            ps.setString(5, x.getPassword());
            ps.setString(6, x.getAvatar());
            ps.setDate(7, x.getCreateDate());
            ps.setString(8, x.getStatus());
            ps.setInt(9, x.getRollId());
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteUser(String id) {
        xSql = "delete from User where id = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void UpdateUser(int id, String name, String title, String phone, int role, String status, String ava) {
        xSql = "UPDATE User\n"
                + "   SET fullname = ?\n"
                + "      ,title = ?\n"
                + "      ,phone = ?\n"
                + "      ,avatar = ?\n"
                + "      ,roll_id = ?\n"
                + "      ,status = ?\n"
                + "     \n"
                + " WHERE [id] = ?";

        try {
            ps = connection.prepareStatement(xSql);
            ps.setString(1, name);
            ps.setString(2, title);
            ps.setString(3, phone);
            ps.setString(4, ava);
            ps.setInt(5, role);
            ps.setString(6, status);
            ps.setInt(7, id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public String getMaxID() {
        String id = "";
        xSql = "Select max(id) from User";

        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            if (rs.next()) {
                id = rs.getString(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }

    public void activateAccount(String id) {
        xSql = "UPDATE User\n"
                + "   SET status = 'Active' \n"
                + " WHERE id = ?";

        try {
            ps = connection.prepareStatement(xSql);
            ps.setString(1, id);

            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

  
}
