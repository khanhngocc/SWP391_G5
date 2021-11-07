/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.util.ArrayList;
import model.Roll;

/**
 *
 * @author dell
 */
public class RollDAO extends MyDAO{
    
    public ArrayList<Roll> listAllRolls() {
        ArrayList<Roll> list = new ArrayList<>();
        xSql = "select * from roll";
        try {
            ps = con.prepareStatement(xSql);
          
            rs = ps.executeQuery();
            while (rs.next()) {
                Roll roll = new Roll();
                roll.setId(rs.getInt(1));
                roll.setName(rs.getString(2));
                list.add(roll);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
