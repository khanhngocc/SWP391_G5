/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.util.ArrayList;
import model.Question;
import model.Setting;
import model.Slide;
import model.User;

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

    public void changeSettingStatus(int id, String status) {
        xSql = "Update settings set status = ? where id= ? ";
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

    public void createSetting(Setting setting, User user) {
        xSql = "INSERT INTO `settings`\n"
                + "(`user_id`,\n"
                + "`type`,\n"
                + "`value`,\n"
                + "`note`,\n"
                + "`status`)\n"
                + "VALUES\n"
                + "(?,?,?,?,?);";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, user.getId());
            ps.setString(2, setting.getType());
            ps.setString(3, setting.getValue());
            ps.setString(4, setting.getNote());
            ps.setString(5, "Active");
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void updateSetting(Setting setting) {
        xSql = "UPDATE `settings`\n"
                + "SET\n"
                + "`type` = ?,\n"
                + "`value` = ?,\n"
                + "`note` = ?\n"
                + "WHERE `id` = ?";
        try {
            ps = con.prepareStatement(xSql);

            ps.setString(1, setting.getType());
            ps.setString(2, setting.getValue());
            ps.setString(3, setting.getNote());
            ps.setInt(4, setting.getId());
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public Setting getSetting(int id) {

        Setting s = new Setting();

        xSql = "select id,type,value,note from settings\n"
                + "where\n"
                + "id = ?";
        try {
            ps = con.prepareStatement(xSql);

            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                s.setId(rs.getInt(1));
                s.setType(rs.getString(2));
                s.setValue(rs.getString(3));
                s.setNote(rs.getString(4));

            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return s;
    }

}
