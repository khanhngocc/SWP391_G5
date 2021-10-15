/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Quizzes;

/**
 *
 * @author Admin
 */
public class QuizDAO extends MyDAO {

    public ArrayList<Quizzes> getQuiz() {
        ArrayList<Quizzes> x = new ArrayList<>();
        xSql = "SELECT * FROM [Quizzes]";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                x.add(new Quizzes(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5),
                        rs.getString(6), rs.getInt(7), rs.getInt(8), rs.getInt(9), rs.getFloat(10), rs.getString(11)));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (x);
    }

    public void deleteQuiz(int id) {
        xSql = "delete from [Question] where quiz_id = ?\n"
                + "delete from [Quizzes] where id =?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, id);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void addQuiz(Quizzes q) {
        xSql = "INSERT INTO [QuizPractice].[dbo].[Quizzes]\n"
                + "           ([title]\n"
                + "           ,[description]\n"
                + "           ,[subject_id]\n"
                + "           ,[level]\n"
                + "           ,[type]\n"
                + "           ,[user_id]\n"
                + "           ,[numberOfQuestion]\n"
                + "           ,[duration]\n"
                + "           ,[rate]\n"
                + "           ,[thumnail])\n"
                + "     VALUES(?,?,?,?,?,?,?,?,?,?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, q.getTitle());
            ps.setString(2, q.getDescription());
            ps.setInt(3, q.getSubject_id());
            ps.setString(4, q.getLevel());
            ps.setString(5, q.getType());
            ps.setInt(6, q.getUser_id());
            ps.setInt(7, q.getNumber_of_question());
            ps.setInt(8, q.getDuration());
            ps.setFloat(9, q.getRate());
            ps.setString(10, q.getThumbnail());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public Quizzes getQuizByID(String id){
        xSql = "select * from [Quizzes] where [id] = ?";
        Quizzes q = null;
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            if(rs.next()){
                q =  new Quizzes(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8), rs.getInt(9), rs.getFloat(10), rs.getString(11));
            }
            return q;
        } catch (Exception e) {
            e.printStackTrace();
        }
       return null; 
    }
    
    public void UpdateQuizzes(Quizzes q) {
        
       xSql = "UPDATE [QuizPractice].[dbo].[Quizzes]\n" +
"   SET [title] = ?\n" +
"      ,[description] = ?\n" +
"      ,[subject_id] = ?\n" +
"      ,[level] = ?\n" +
"      ,[type] = ?\n" +
"      ,[user_id] = ?\n" +
"      ,[numberOfQuestion] = ?\n" +
"      ,[duration] = ?\n" +
"      ,[rate] = ?\n" +
"      ,[thumnail] = ?\n" +
" WHERE [id]=?";
        

        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, q.getTitle());
            ps.setString(2, q.getDescription());
            ps.setInt(3,q.getSubject_id());
            ps.setString(4, q.getLevel());
            ps.setString(5,q.getType());
            ps.setInt(6, q.getUser_id());
             ps.setInt(7, q.getNumber_of_question());
             ps.setInt(8, q.getDuration());
             ps.setFloat(9, q.getRate());
             ps.setString(10, q.getThumbnail());
             ps.setInt(11, q.getId());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
 
    }

//    public static void main(String[] args) {
//        QuizDAO dao = new QuizDAO();
//        dao.addQuiz(new Quizzes("abc", "abc", 1, 10, "Free Test", 25, 0, 200, 0.6f, "abc"));
//    }
}
