/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import model.Question;

/**
 *
 * @author INSPIRON 15-7559
 */
public class QuestionDAO extends MyDAO {
    public void insertQuestion(Question q){
        xSql = "INSERT INTO [QuizPractice].[dbo].[Question]\n" +
"           ([content]\n" +
"           ,[category]\n" +
"           ,[status]\n" +
"           ,[level]\n" +
"           ,[quiz_id]\n" +
"           ,[option1]\n" +
"           ,[option2]\n" +
"           ,[option3]\n" +
"           ,[option4]\n" +
"           ,[optionCorrect])\n" +
"     VALUES\n" +
"           (?,?,?,?,? ,?,?,?,?,?)\n" ;
        
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, q.getContent());
            ps.setString(2, q.getCategory());
            ps.setString(3, q.getStatus());
            ps.setInt(4, q.getLevel());
            ps.setInt(5, q.getQuiz_id());
            ps.setString(6, q.getOption1());
            ps.setString(7, q.getOption2());
            ps.setString(8, q.getOption3());
            ps.setString(9, q.getOption4());
            ps.setString(10, q.getOption_correct());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
