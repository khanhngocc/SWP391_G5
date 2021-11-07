/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.util.ArrayList;
import model.Answer_History;

/**
 *
 * @author Admin
 */
public class Answer_HistoryDAO extends MyDAO {

    public void addAnswer_History(Answer_History x) {
        xSql = "INSERT INTO Answer_History\n"
                + "(\n"
                + "`history_id`,\n"
                + "`question_id`,\n"
                + "`answer`)\n"
                + "VALUES\n"
                + "(\n"
                + "?,\n"
                + "?,\n"
                + "?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, x.getHistory_id());
            ps.setInt(2, x.getQuestion_id());
            ps.setString(3 , x.getAnswer());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Answer_History> getAnswerHistory(int id, int status) {
        ArrayList<Answer_History> x = new ArrayList<>();
        switch (status) {
            case 1:
                xSql = "SELECT * FROM Answer_History where history_id = ? and answer <> ''";
                break;
            case -1:
                xSql = "SELECT * FROM Answer_History where history_id = ? and answer = ''";
                break;
            default:
                xSql = "select * from Answer_History where history_id = ?";
                break;
        }
        try{
            ps = con.prepareStatement(xSql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while(rs.next()){
                x.add(new Answer_History(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4)));
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return x;
    }

}