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
public class SettingDAO extends MyDAO {

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

    public ArrayList<String> getAllTypes() {
        ArrayList<String> list = new ArrayList<>();
        xSql = "select distinct type from Settings";
        try {
            ps = con.prepareStatement(xSql);

            rs = ps.executeQuery();
            while (rs.next()) {

                list.add(rs.getString(1));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    

    public int getRowCount() {
        int no = 0;
        xSql = "SELECT COUNT(*) FROM settings";
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

    public int getRowCountForSearch(String searchName, String type, String statusRestricted) {
        int no = 0;
        xSql = "SELECT COUNT(*) FROM settings WHERE value LIKE ? and type LIKE ? and status LIKE ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, "%" + searchName + "%");
            ps.setString(2, "%" + type + "%");
            ps.setString(3, "%" + statusRestricted + "%");
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

    public ArrayList<Setting> listAllSettings(int pageIndex, int pageSize, String searchName, String statusRestricted, String type) {
        int numberOfRecord = (pageIndex - 1) * pageSize;
        ArrayList<Setting> list = new ArrayList<>();
        xSql = "select * from settings\n"
                + "where\n"
                + "status like ?\n"
                + "and\n"
                + "type like ?\n"
                + "and\n"
                + "value like ?\n"
                + "order by id desc\n"
                + "limit ?,?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, "%" + statusRestricted + "%");
            ps.setString(2, "%" + type + "%");
            ps.setString(3, "%" + searchName + "%");
            ps.setInt(4, numberOfRecord);
            ps.setInt(5, pageSize);
            rs = ps.executeQuery();
            while (rs.next()) {
                Setting setting = new Setting();
                setting.setId(rs.getInt(1));
                setting.setType(rs.getString(3));
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
