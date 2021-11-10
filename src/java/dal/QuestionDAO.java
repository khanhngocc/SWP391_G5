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
 * fixed: 22/10/2021
 */
public class QuestionDAO extends MyDAO {

    public void insertQuestion(Question q) {
        xSql = "INSERT INTO Question\n"
                + "           (content\n"
                + "           ,category\n"
                + "           ,status\n"
                + "           ,level\n"
                + "           ,option1\n"
                + "           ,option2\n"
                + "           ,option3\n"
                + "           ,option4\n"
                + "           ,optionCorrect)\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?,?)\n";

        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, q.getContent());
            ps.setString(2, q.getCategory());
            ps.setString(3, q.getStatus());
            ps.setString(4, q.getLevel());
            ps.setString(5, q.getOption1());
            ps.setString(6, q.getOption2());
            ps.setString(7, q.getOption3());
            ps.setString(8, q.getOption4());
            ps.setString(9, q.getOption_correct());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
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
                x = new Question(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return x;
    }

    public void EditQuestion(Question x) {
        xSql = "UPDATE Question\n"
                + "   SET content = ?\n"
                + "      ,category = ?\n"
                + "      ,status = ?\n"
                + "      ,level = ?\n"
                + "      ,option1 = ?\n"
                + "      ,option2 = ?\n"
                + "      ,option3 = ?\n"
                + "      ,option4 = ?\n"
                + "      ,optionCorrect = ?\n"
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
    
      public int getRowCount() {
        int no = 0;
        xSql = "SELECT COUNT(*) FROM question";
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

    public int getRowCountForSearch(String searchName, String subject, String category, String level, String status) {
        int no = 0;

        xSql = "";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, "%" + searchName + "%");
            ps.setString(2, "%" + subject + "%");
            ps.setString(3, "%" + category + "%");
           
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
    
    public ArrayList<Question> getQuestions(){
        ArrayList<Question> x = new ArrayList<>();
        xSql = "select * from Question";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                x.add(new Question(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return x;
    }
    
    public ArrayList<Question> getQuestionInQuiz(int id){
        ArrayList<Question> x = new ArrayList<>();
        xSql = "select * from Question q inner join Quizzes_Question qq on (q.id = qq.question_id) where qq.quiz_id = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                x.add(new Question(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return x;
    }

    public ArrayList<Question> getQuestionByQuizId(int id) {
        ArrayList<Question> x = new ArrayList<>();
        xSql = "select * from Quizzes_Question a inner join Question b on(a.question_id = b.id) inner join Quizzes c on(a.quiz_id = c.id) where c.id = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                x.add(new Question(rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8),
                        rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return x;
    }
   
}