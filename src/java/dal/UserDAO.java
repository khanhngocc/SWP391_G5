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
import model.Roll;
import model.User;

/**
 *
 * @author Admin
 */
public class UserDAO extends MyDAO {

    public User getUser(String email) {
        User x = null;
        xSql = "SELECT * FROM [User] WHERE [email] = ? ";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                x = new User(rs.getInt(1), rs.getString(2), rs.getBoolean(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getDate(8), rs.getString(7), rs.getInt(9));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (x);
    }

    public void addUser(User x) {
        xSql = "INSERT INTO [User]\n"
                + "           ([fullname]\n"
                + "           ,[gender]\n"
                + "           ,[email]\n"
                + "           ,[phone]\n"
                + "           ,[password]\n"
                + "           ,[avatar]\n"
                + "           ,[createDate]\n"
                + "           ,[roll_id])\n"
                + "     VALUES (?,?,?,?,?,?,?,?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, x.getFullname());
            ps.setBoolean(2, x.isGender());
            ps.setString(3, x.getEmail());
            ps.setString(4, x.getPhone());
            ps.setString(5, x.getPassword());
            ps.setString(6, x.getAvatar());
            ps.setDate(7, x.getCreateDate());
            ps.setInt(8, x.getRollId());
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public User getAccount(String email, String password) {
        User user = null;
        try {
            String sql = "Select url from [User],Roll,Roll_Feature where [User].roll_id = Roll.id \n"
                    + "and Roll.id = Roll_Feature.roll_id \n"
                    + "and[User].email = ?\n"
                    + "and [User].password = ?";
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
            }
            return user;

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;

    }

    public int UpdateUser(String email, String fullname, String phone, boolean gender) {
        int n = 0;
        String sql = "UPDATE [dbo].[User]\n"
                + "   SET [fullname] = ?\n"
                + "      ,[gender] = ?\n"
                + "      ,[phone] = ?\n"
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
        String sql = "UPDATE [dbo].[User]\n"
                + "   SET [password] = ?\n"
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
            String sql = "Select Roll.name from [User],Roll\n"
                    + "where\n"
                    + "[User].roll_id = Roll.id\n"
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

    /**
     * Function get All User
     *
     * @return List User
     *
     *
     */
    public ArrayList<User> getAllUser() {
        ArrayList<User> depts = new ArrayList<>();
        try {
            String sql = "SELECT u.[id]\n"
                    + "      ,[fullname]\n"
                    + "      ,[gender]\n"
                    + "      ,[email]\n"
                    + "      ,[phone]\n"
                    + "      ,[password]\n"
                    + "      ,[avatar]\n"
                    + "      ,[createDate]\n"
                    + "      ,[roll_id],r.name\n"
                    + "  FROM [User] u join Roll r on u.roll_id=r.id";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                User d = new User();
                d.setId(rs.getInt("id"));
                d.setFullname(rs.getString("fullname"));
                d.setGender(rs.getBoolean("gender"));
                d.setEmail(rs.getString("email"));
                d.setCreateDate(rs.getDate("createDate"));
                d.setPhone(rs.getString("phone"));
                d.setPassword(rs.getString("password"));
                Roll r = new Roll();
                r.setId(rs.getInt("id"));
                r.setName(rs.getString("name"));
                d.setRoll(r);
                depts.add(d);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return depts;
    }

    /**
     * Function get User by Roll_id
     *
     * @param id:Where select roll on filter
     * @return
     */
    public ArrayList<User> getAllUserByrollid(int id) {
        ArrayList<User> depts = new ArrayList<>();
        try {
            String sql = "SELECT u.[id]\n"
                    + "      ,[fullname]\n"
                    + "      ,[gender]\n"
                    + "      ,[email]\n"
                    + "      ,[phone]\n"
                    + "      ,[password]\n"
                    + "      ,[avatar]\n"
                    + "      ,[createDate]\n"
                    + "      ,[roll_id],r.name\n"
                    + "  FROM [User] u join Roll r on u.roll_id=r.id\n"
                    + "  where r.id=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                User d = new User();
                d.setId(rs.getInt("id"));
                d.setFullname(rs.getString("fullname"));
                d.setGender(rs.getBoolean("gender"));
                d.setEmail(rs.getString("email"));
                d.setPhone(rs.getString("phone"));
                d.setPassword(rs.getString("password"));
                d.setCreateDate(rs.getDate("createDate"));
                Roll r = new Roll();
                r.setId(rs.getInt("id"));
                r.setName(rs.getString("name"));
                d.setRoll(r);
                depts.add(d);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return depts;
    }

    /**
     * Function update User by Admin
     *
     * @param user
     * @return
     */
    public int UpdateUserByAdmin(User user) {
        int n = 0;
        String sql = "UPDATE [User]\n"
                + "   SET [fullname] = ?\n"
                + "      ,[gender] = ?\n"
                + "      ,[phone] = ?\n"
                + "      ,[password] = ?\n"
                + " WHERE email=?";
        PreparedStatement statement;
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, user.getFullname());
            statement.setBoolean(2, user.isGender());
            statement.setString(3, user.getPhone());
            statement.setString(4, user.getPassword());
            statement.setString(5, user.getEmail());
            n = statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    /**
     * Function add user to list
     *
     * @param x :object user
     */
    public void addUserbyAdmin(User x) {
        String sql = "INSERT INTO [User]\n"
                + "           ([fullname]\n"
                + "           ,[gender]\n"
                + "           ,[email]\n"
                + "           ,[phone]\n"
                + "           ,[password]\n"
                + "           ,[avatar]\n"
                + "           ,[createDate]\n"
                + "           ,[roll_id])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,1\n"
                + "           ,GETDATE()\n"
                + "           ,?)";
        PreparedStatement statement;
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, x.getFullname());
            statement.setBoolean(2, x.isGender());
            statement.setString(3, x.getEmail());
            statement.setString(4, x.getPhone());
            statement.setString(5, x.getPassword());
            statement.setInt(6, x.getRoll().getId());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteUser(int id) {
        //int n = 0;
        String sql = "DELETE FROM [User]\n"
                + "      WHERE id=?";
        PreparedStatement statement;
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<User> search(String name, String email) {
        ArrayList<User> users = new ArrayList<>();
        Integer index = 0;
        String sql = "SELECT u.[id]\n"
                + "      ,[fullname]\n"
                + "      ,[gender]\n"
                + "      ,[email]\n"
                + "      ,[phone]\n"
                + "      ,[password]\n"
                + "      ,[avatar]\n"
                + "      ,[createDate]\n"
                + "      ,[roll_id],r.name\n"
                + "  from [User] u join Roll r on u.roll_id=r.id\n"
                + "  where(1=1)";
        if (name != null) {
            sql += " AND fullname like '%'+ ? + '%' ";
        }
        if (email != null) {
            sql += " AND email like '%'+ ? + '%'";
        }
        PreparedStatement stm;
        try {
            stm = connection.prepareStatement(sql);
            if (name != null) {
                index++;
                stm.setString(index, name);
            }
            if (email != null) {
                index++;
                stm.setString(index, email);
            }
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                User d = new User();
                d.setId(rs.getInt("id"));
                d.setFullname(rs.getString("fullname"));
                d.setGender(rs.getBoolean("gender"));
                d.setEmail(rs.getString("email"));
                d.setPhone(rs.getString("phone"));
                d.setPassword(rs.getString("password"));
                d.setCreateDate(rs.getDate("createDate"));
                Roll r = new Roll();
                r.setId(rs.getInt("id"));
                r.setName(rs.getString("name"));
                d.setRoll(r);
                users.add(d);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return users;
    }

}
