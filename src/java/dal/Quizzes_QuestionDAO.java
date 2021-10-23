/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.util.ArrayList;
import model.Quizzes_Question;

/**
 *
 * @author Admin
 */
public class Quizzes_QuestionDAO extends MyDAO {

    public Quizzes_Question getQuizzes_QuestionBy2Id(int quiz_id, int question_id) {
        Quizzes_Question x = null;
        xSql = "SELECT * FROM Quizzes_Question where quiz_id = ? and question_id = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, quiz_id);
            ps.setInt(2, question_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                x = new Quizzes_Question(rs.getInt(1), rs.getInt(2), rs.getInt(3));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (x);
    }

    public void addQuizzes_Question(Quizzes_Question x) {
        xSql = "INSERT INTO `quizpractice`.`quizzes_question`\n"
                + "(`quiz_id`,\n"
                + "`question_id`)\n"
                + "VALUES\n"
                + "(?,\n"
                + "?)";
        try{
            ps = con.prepareStatement(xSql);
            ps.setInt(1, x.getQuiz_id());
            ps.setInt(2, x.getQuestion_id());
            ps.executeUpdate();
        } catch(Exception e){
            e.printStackTrace();
        }
    }
    
    public void removeQQ(int id){
        xSql = "delete from Quizzes_Question where quiz_id = ?";
        try{
            ps = con.prepareStatement(xSql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch(Exception e){
            e.printStackTrace();
        }
    }
}
