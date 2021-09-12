/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


/**
 *
 * @author Admin
 */
public class MyDAO extends DBContext {
    public Connection con = null;
    public PreparedStatement ps = null;
    public ResultSet rs = null;
    public String xSql = null;

    public MyDAO() {
        con = connection;
    }
    
    public void finalize() {
        try {
            if(con != null) con.close();
        }catch(Exception e) {
        e.printStackTrace();
        }
    }
}
