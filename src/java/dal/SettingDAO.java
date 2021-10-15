/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.util.ArrayList;
import model.Question;
import model.Setting;

/**
 *
 * @author dell
 */
public class SettingDAO extends MyDAO{
    
      public ArrayList<Setting> getListSettingByType(String type) {
        ArrayList<Setting> list = new ArrayList<>();
        xSql = "select * from Settings where type = ? and status = 'Active'";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, type);
            rs = ps.executeQuery();
            while (rs.next()) {
              Setting setting = new Setting();
              setting.setId(rs.getInt(1));
              setting.setUser_id(rs.getInt(2));
              setting.setType(type);
              setting.setValue(rs.getString(4));
              setting.setNote(rs.getString(5));
              setting.setStatus(rs.getString(6));
              list.add(setting);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
      
   
}
