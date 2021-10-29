/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 * Fixed: 22/10/2021
 */
package dal;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Quizzes;
import java.util.List;

/**
 *
 * @author Admin
 */
public class QuizDAO extends MyDAO {

    public ArrayList<Quizzes> getQuiz() {
        ArrayList<Quizzes> x = new ArrayList<>();
        xSql = "SELECT * FROM Quizzes";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                x.add(new Quizzes(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getInt(8), rs.getInt(9), rs.getInt(10), rs.getFloat(11), rs.getString(12)));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (x);
    }

public ArrayList<Quizzes> getTop5Quiz() {
        ArrayList<Quizzes> x = new ArrayList<>();
        xSql = "SELECT * FROM Quizzes where type = 'Free Test' order by id desc LIMIT 5 ";
        
        try {
            
            ps = con.prepareStatement(xSql);
           
            rs = ps.executeQuery();
            while (rs.next()) {
                x.add(new Quizzes(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getInt(8), rs.getInt(9), rs.getInt(10), rs.getFloat(11), rs.getString(12)));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (x);
    }

    public void deleteQuiz(int id) {
        xSql = "delete from Quizzes where id = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void addQuiz(Quizzes q) {
        xSql = "INSERT INTO Quizzes\n"
                + "           (title\n"
                + "           ,description\n"
                + "           ,subject_id\n"
                + "           ,category\n"
                + "           ,level\n"
                + "           ,type\n"
                + "           ,user_id\n"
                + "           ,numberOfQuestion\n"
                + "           ,duration\n"
                + "           ,rate\n"
                + "           ,thumnail)\n"
                + "     VALUES(?,?,?,?,?,?,?,?,?,?,?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, q.getTitle());
            ps.setString(2, q.getDescription());
            ps.setInt(3, q.getSubject_id());
            ps.setString(4, q.getCategory());
            ps.setString(5, q.getLevel());
            ps.setString(6, q.getType());
            ps.setInt(7, q.getUser_id());
            ps.setInt(8, q.getNumber_of_question());
            ps.setInt(9, q.getDuration());
            ps.setFloat(10, q.getRate());
            ps.setString(11, q.getThumbnail());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Quizzes getQuizByID(String id) {
        xSql = "select * from Quizzes where id = ?";
        Quizzes q = null;
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                q = new Quizzes(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8), rs.getInt(9), rs.getInt(10), rs.getFloat(11), rs.getString(12));
            }
            return q;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void UpdateQuizzes(Quizzes q) {

        xSql = "UPDATE Quizzes\n"
                + "   SET title = ?\n"
                + "      ,description = ?\n"
                + "      ,subject_id = ?\n"
                + "      ,category = ?\n"
                + "      ,level = ?\n"
                + "      ,type = ?\n"
                + "      ,user_id = ?\n"
                + "      ,numberOfQuestion = ?\n"
                + "      ,duration = ?\n"
                + "      ,rate = ?\n"
                + "      ,thumnail = ?\n"
                + " WHERE id=?";

        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, q.getTitle());
            ps.setString(2, q.getDescription());
            ps.setInt(3, q.getSubject_id());
            ps.setString(4, q.getCategory());
            ps.setString(5, q.getLevel());
            ps.setString(6, q.getType());
            ps.setInt(7, q.getUser_id());
            ps.setInt(8, q.getNumber_of_question());
            ps.setInt(9, q.getDuration());
            ps.setFloat(10, q.getRate());
            ps.setString(11, q.getThumbnail());
            ps.setInt(12, q.getId());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }        
    }
    
    public ArrayList<Quizzes> getPractice(int uid) {
        ArrayList<Quizzes> x = new ArrayList<>();
        xSql = "SELECT * FROM Quizzes where type='User Practice' and user_id=?";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                x.add(new Quizzes(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getInt(8), rs.getInt(9), rs.getInt(10), rs.getFloat(11), rs.getString(12)));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (x);
    }
    
    public ArrayList<Quizzes> getQuizByType(String type) {
        ArrayList<Quizzes> x = new ArrayList<>();
        xSql = "SELECT * FROM Quizzes where type = ? order by id desc limit 6";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, type);
            rs = ps.executeQuery();
            while (rs.next()) {
                x.add(new Quizzes(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getInt(8), rs.getInt(9), rs.getInt(10), rs.getFloat(11), rs.getString(12)));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (x);
    }


//    public static void main(String[] args) {
//        QuizDAO dao = new QuizDAO();
//        dao.addQuiz(new Quizzes("abc", "abc", 1, 10, "Free Test", 25, 0, 200, 0.6f, "abc"));
//    }

public List<Quizzes> getQuizByName(String res) {
        List<Quizzes> list = new ArrayList();
        xSql = "SELECT * FROM Quizzes where `title` like ? and `type` = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, "%" + res + "%");
            ps.setString(2, "Free Test");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Quizzes(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8), rs.getInt(9), rs.getInt(10), rs.getFloat(11), rs.getString(12)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static void main(String[] args) {
        QuizDAO dao = new QuizDAO();
        List<Quizzes> l = dao.getTop5Quiz();
        for (Quizzes quizzes : l) {
            System.out.println(quizzes.getTitle());
        }
        ;
    }

    public List<Quizzes> getQuizbyCategory(String type) {

        List<Quizzes> list = new ArrayList();
        xSql = "SELECT *\n" +"FROM Quizzes\n" +"where category like ? and type = 'Free Test' ";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, type);

            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Quizzes(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8), rs.getInt(9), rs.getInt(10), rs.getFloat(11), rs.getString(12)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Quizzes> getQuizbyType(String free_Test) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}