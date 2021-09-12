/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Date;
import model.User;

/**
 *
 * @author Admin
 */
public class UserDAO extends MyDAO{
    
    public User getUser(String email) {
        User x = null;
        xSql = "SELECT * FROM [User] WHERE [email] = ? "; 
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            if(rs.next()) {
                x = new User(rs.getInt(1), rs.getString(2), rs.getBoolean(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getDate(7), rs.getString(8), rs.getInt(9));
            }
            rs.close();
            ps.close();
        } catch(Exception e) {
            e.printStackTrace();
        }
        return(x);
    }
    
    public void addUser(User x){
        xSql = "INSERT INTO [User]\n" +
"           ([fullname]\n" +
"           ,[gender]\n" +
"           ,[email]\n" +
"           ,[phone]\n" +
"           ,[password]\n" +
"           ,[avatar]\n" +
"           ,[createDate]\n" +
"           ,[roll_id])\n" +
"     VALUES (?,?,?,?,?,?,?,?)";
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
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
    
    public static void main(String[] args) {
        UserDAO dao = new UserDAO();
        dao.addUser(new User("ducanh2", true, "abc@gmail.com", "113", "ditmemay", Date.valueOf(java.time.LocalDate.now()), "1", 1));
    }
    
}
