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
import model.Roll;

/**
 *
 * @author zzpho
 */
public class RollDAO extends MyDAO {

    public ArrayList<Roll> getAllRoll() {
        ArrayList<Roll> depts = new ArrayList<>();
        try {
            String sql = "SELECT [id]\n"
                    + "      ,[name]\n"
                    + "  FROM [Roll]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Roll d = new Roll();
                d.setId(rs.getInt("id"));
                d.setName(rs.getString("name"));
                depts.add(d);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RollDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return depts;
    }
}
