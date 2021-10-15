/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.util.ArrayList;
import model.Question;

/**
 *
 * @author INSPIRON 15-7559
 */
public class QuestionDAO extends MyDAO {

    public void insertQuestion(Question q) {
        xSql = "INSERT INTO [QuizPractice].[dbo].[Question]\n"
                + "           ([content]\n"
                + "           ,[category]\n"
                + "           ,[status]\n"
                + "           ,[level]\n"
                + "           ,[quiz_id]\n"
                + "           ,[option1]\n"
                + "           ,[option2]\n"
                + "           ,[option3]\n"
                + "           ,[option4]\n"
                + "           ,[optionCorrect])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,? ,?,?,?,?,?)\n";

        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, q.getContent());
            ps.setString(2, q.getCategory());
            ps.setString(3, q.getStatus());
            ps.setString(4, q.getLevel());
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

    public ArrayList<Question> getQuestionByQuizId(String id) {
        ArrayList<Question> x = new ArrayList<>();
        xSql = "select * from Question where quiz_id = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                x.add(new Question(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6),
                        rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return x;
    }

    public void deleteQuestion(int id) {
        xSql = "delete from Question where id = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Question getQuestionById(String id) {
        Question x = null;
        xSql = "select * from Question where id = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                x = new Question(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6),
                        rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return x;
    }

    public void EditQuestion(Question x) {
        xSql = "UPDATE [QuizPractice].[dbo].[Question]\n"
                + "   SET [content] = ?\n"
                + "      ,[category] = ?\n"
                + "      ,[status] = ?\n"
                + "      ,[level] = ?\n"
                + "      ,[option1] = ?\n"
                + "      ,[option2] = ?\n"
                + "      ,[option3] = ?\n"
                + "      ,[option4] = ?\n"
                + "      ,[optionCorrect] = ?\n"
                + " WHERE id = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1,x.getContent());
            ps.setString(2,x.getCategory());
            ps.setString(3,x.getStatus());
            ps.setString(4,x.getLevel());
            ps.setString(5,x.getOption1());
            ps.setString(6,x.getOption2());
            ps.setString(7,x.getOption3());
            ps.setString(8,x.getOption4());
            ps.setString(9,x.getOption_correct());
            ps.setInt(10, x.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
