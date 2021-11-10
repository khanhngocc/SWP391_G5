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

    public User getUser(int id) {
        User x = null;
        xSql = "SELECT * FROM User WHERE id = ? ";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, id);
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

    public int getRowCount() {
        int no = 0;
        xSql = "SELECT COUNT(*) FROM user";
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

    public int getRowCountForSearch(String searchName, String roll, String status) {
        int no = 0;
        xSql = "SELECT COUNT(*) FROM user WHERE (phone like ? or email like ? or fullname like ?) and roll_id like ? and status like ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, "%" + searchName + "%");
            ps.setString(2, "%" + searchName + "%");
            ps.setString(3, "%" + searchName + "%");
            ps.setString(4, "%" + roll + "%");
            ps.setString(5, "%" + status + "%");
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

    public ArrayList<User> getAllUsers(int pageIndex, int pageSize, String searchName, String roll, String status) {

        int numberOfRecord = (pageIndex - 1) * pageSize;

        ArrayList<User> list = new ArrayList<>();

        xSql = "select user.id,fullname,title,email,phone,roll.name,status from user,roll\n"
                + "where user.roll_id = roll.id\n"
                + "and\n"
                + "(phone like ? or email like ? or fullname like ?)\n"
                + "and\n"
                + "roll_id like ?\n"
                + "and \n"
                + "status like ?\n"
                + "order by user.id desc\n"
                + "limit ?,?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, "%" + searchName + "%");
            ps.setString(2, "%" + searchName + "%");
            ps.setString(3, "%" + searchName + "%");
            ps.setString(4, "%" + roll + "%");
            ps.setString(5, "%" + status + "%");
            ps.setInt(6, numberOfRecord);
            ps.setInt(7, pageSize);
            rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt(1));
                user.setFullname(rs.getString(2));
                user.setTitle(rs.getString(3));
                user.setEmail(rs.getString(4));
                user.setPhone(rs.getString(5));
                user.setRollName(rs.getString(6));
                user.setStatus(rs.getString(7));
                list.add(user);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
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

    public void updateUser(User user) {

        xSql = "UPDATE User\n"
                + "   SET fullname = ?\n"
                + "      ,title = ?\n"
                + "      ,phone = ?\n"
                + "      ,avatar = ?\n"
                + "     \n"
                + " WHERE email = ?";

        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, user.getFullname());
            ps.setString(2, user.getTitle());
            ps.setString(3, user.getPhone());
            ps.setString(4, user.getAvatar());
            ps.setString(5, user.getEmail());
            ps.executeUpdate();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void changePassword(String email, String password) {
        ;
        xSql = "UPDATE User\n"
                + "   SET password = ?\n"
                + " WHERE email = ?";

        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, password);
            ps.setString(2, email);
            ps.executeUpdate();
            ps.close();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }

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

   
    public int getIDByEncryptId(String encryptId) {
        int user_id = -1;
        xSql = "SELECT id FROM user where upper(md5(concat('id=',id))) = ? order by id desc;";

        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, encryptId);
            rs = ps.executeQuery();
            if (rs.next()) {

                user_id = rs.getInt(1);

            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return user_id;
    }

    public void changeUserStatus(Integer id, String status) {
        xSql = "Update user set status = ? where id= ? ";
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
