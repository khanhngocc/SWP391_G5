/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Date;
import java.util.ArrayList;
import model.Answer;
import model.History;

/**
 *
 * @author Admin
 */
public class History_Answer_DAO extends MyDAO{
    public void addHistory(History x){
        xSql = "INSERT INTO [History]\n"
                + "           ([test_id]\n"
                + "           ,[user_id]\n"                
                + "           ,[taken_Date])\n"                
                + "     VALUES (?,?,?)";
        try {
            ps = con.prepareStatement(xSql);           
            ps.setInt(1, x.getTestId());
            ps.setInt(2, x.getUserId());
            ps.setDate(3, x.getTakenDate());
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void addAnswer(Answer x){
        xSql = "INSERT INTO [Answer]\n"
                + "           ([history_id]\n"
                + "           ,[quiz_id]\n"                
                + "           ,[answer])\n"                
                + "     VALUES (?,?,?)";
        try {
            ps = con.prepareStatement(xSql);           
            ps.setInt(1, x.getHistoryId());
            ps.setInt(2, x.getQuizId());
            ps.setString(3, x.getAnswer());
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public ArrayList<History> getAllHistory(){
        ArrayList<History> test = new ArrayList<>();
        xSql = "SELECT * FROM [History]";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                test.add(new History(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getDate(4)));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (test);
    }
    
    public ArrayList<Answer> getAllAnswer(){
        ArrayList<Answer> test = new ArrayList<>();
        xSql = "SELECT * FROM [History]";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                test.add(new Answer(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4)));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (test);
    }
}
