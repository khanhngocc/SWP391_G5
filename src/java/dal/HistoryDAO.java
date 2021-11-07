/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.util.ArrayList;
import model.History;

/**
 *
 * @author Admin
 */
public class HistoryDAO extends MyDAO {

    public ArrayList<History> getHistorybyUserID(int id) {
        ArrayList<History> x = new ArrayList<>();
        xSql = "select * from History where user_id = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                x.add(new History(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getDate(4), rs.getFloat(5), rs.getString(6)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return x;
    }

    public ArrayList<History> getHistorys() {
        ArrayList<History> x = new ArrayList<>();
        xSql = "select * from History";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                x.add(new History(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getDate(4), rs.getFloat(5), rs.getString(6)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return x;
    }
    
    public void addHistory(History x) {
        xSql = "INSERT INTO History\n"
                + "(\n"
                + "`user_id`,\n"
                + "`quiz_id`,\n"
                + "`taken`,\n"
                + "`percentage`,\n"
                + "`status`)\n"
                + "VALUES\n"
                + "(\n"
                + "?,\n"
                + "?,\n"
                + "?,\n"
                + "?,\n"
                + "?);";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, x.getUser_id());
            ps.setInt(2, x.getQuiz_id());
            ps.setDate(3, x.getTaken());
            ps.setFloat(4, x.getPercentage());
            ps.setString(5,x.getStatus());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public History getHistorybyID(int id) {
        History x = null;
        xSql = "select * from History where id = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                x = new History(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getDate(4), rs.getFloat(5), rs.getString(6));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return x;
    }
}