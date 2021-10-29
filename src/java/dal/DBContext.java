/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

/**
 *
 * @author Admin
 */
public class DBContext {
    public Connection connection;
    
    public DBContext() {
        try {
            //Change the username password and url to connect your own database
            String username = "root";
            String password = "tuancb";
            String url = "jdbc:mysql://localhost:3306/quizpractice?useSSL=false";
            try { 
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
                } catch (InstantiationException ex) {
                    Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
                } catch (IllegalAccessException ex) {
                    Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
            connection = DriverManager.getConnection(url, username, password);
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }
    
    public static void main(String[] args) {
        UserDAO d = new UserDAO();
        User a = d.getUser("ducanh@gmail.com");
    }
}
