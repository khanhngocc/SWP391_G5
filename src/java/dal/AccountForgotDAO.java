/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.AccountForgot;

/**
 *
 * @author dell
 */
public class AccountForgotDAO extends MyDAO {

    public boolean isExisted(int user_id) {

        xSql = "SELECT * FROM account_forgot where user_id = ? ";

        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, user_id);
            rs = ps.executeQuery();
            if (rs.first()) {

                return true;
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return false;
    }

    public String getExpiredTime(int id) {
        String result = "";
        xSql = "SELECT timeEnded FROM account_forgot where id = ? ";

        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {

                result = rs.getString(1);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return result;
    }

    public String getDateCreated(int id) {
        String result = "";
        xSql = "SELECT dateCreated FROM account_forgot where id = ? ";

        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {

                result = rs.getString(1);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return result;
    }
    
    public void createAccountForgot(AccountForgot acc) {
        xSql = "INSERT INTO `account_forgot`\n"
                + "(\n"
                + "`user_id`,\n"
                + "`allowedReset`,\n"
                + "`timeStarted`,\n"
                + "`timeEnded`,\n"
                + "`dateCreated`)\n"
                + "VALUES\n"
                + "(\n"
                + "?,\n"
                + "?,\n"
                + "?,\n"
                + "?,\n"
                + "?);";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, acc.getUser_id());
            ps.setString(2, acc.getAllowedReset());
            ps.setString(3, acc.getTimeStarted());
            ps.setString(4, acc.getTimeEnded());
            ps.setString(5, acc.getDateCreated());
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateAccountForgot(AccountForgot acc) {
        xSql = "UPDATE account_forgot\n"
                + "SET\n"
                + "`allowedReset` = ?\n"
                + "WHERE `id` = ? ;";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, acc.getAllowedReset());
            ps.setInt(2, acc.getId());
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public String getMaxID() {
        String id = "1";
        xSql = "SELECT max(id) FROM account_forgot;";
        
        try {
            ps = con.prepareStatement(xSql);
           
            rs = ps.executeQuery();
            if (rs.next()) {
                
                if (rs.getString(1) != null) {
                    id = rs.getString(1);
                }
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return id;
    }
    
    public int getUserID(int id) {
        int user_id = 0;
        xSql = "SELECT user_id FROM account_forgot where id = ? ;";
        
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                
             user_id = rs.getInt(1);
                
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return user_id;
    }
}
