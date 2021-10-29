/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

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

}
