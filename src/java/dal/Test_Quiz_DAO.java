/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Date;
import java.util.ArrayList;
import model.Quiz;
import model.Test;
import model.User;

/**
 *
 * @author Admin
 */
public class Test_Quiz_DAO extends MyDAO{
    
    public void addTest(Test x){
        xSql = "INSERT INTO [Test]\n"
                + "           ([title]\n"
                + "           ,[image]\n"
                + "           ,[creat_Date]\n"
                + "           ,[user_id]\n"                
                + "           ,[duration])\n"                
                + "     VALUES (?,?,?,?,?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, x.getTitle());
            ps.setString(2, x.getImage());
            ps.setDate(3, x.getCreate_date());
            ps.setInt(4, x.getUser_id());
            ps.setInt(5, x.getDuration());
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public ArrayList<Test> getTestByUser(User x){
        ArrayList<Test> test = new ArrayList<>();
        xSql = "SELECT * FROM [Test] WHERE [user_id] = ? ";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, x.getId());
            rs = ps.executeQuery();
            while (rs.next()) {
                test.add(new Test(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDate(4), rs.getInt(5), rs.getInt(6)));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (test);
    }
    
    public void addQuiz(Quiz x){
        xSql = "INSERT INTO [quiz]\n"
                + "           ([title]\n"
                + "           ,[option1]\n"
                + "           ,[option2]\n"
                + "           ,[option3]\n"
                + "           ,[option4]\n"
                + "           ,[correct_Option]\n"
                + "           ,[test_id])\n"                
                + "     VALUES (?,?,?,?,?,?,?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, x.getQuestion());
            ps.setString(2, x.getAnswer1());
            ps.setString(3, x.getAnswer2());
            ps.setString(4, x.getAnswer3());
            ps.setString(5, x.getAnswer4());
            ps.setString(6, x.getCorrect());
            ps.setInt(7, x.getTest_id());
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public Test getTestById(int id){
        Test x = null;
        xSql = "SELECT * FROM [Test] WHERE [id] = ? ";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                x=(new Test(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDate(4), rs.getInt(5), rs.getInt(6)));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return x;
    }
    
    public ArrayList<Quiz> getQuizByTestId(int testId){
        ArrayList<Quiz> x = new ArrayList<>();
        xSql = "SELECT * FROM [Quiz] WHERE [test_id] = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, testId);
            rs = ps.executeQuery();
            while (rs.next()) {
                x.add(new Quiz(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8)));               
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (x);
    }
    
    public ArrayList<Test> getTestByTitle(String title){
        ArrayList <Test> x = new ArrayList<>();
        xSql = "SELECT * FROM [Test] WHERE [title] like '%"+title+"%'";
        try {
            ps = con.prepareStatement(xSql);            
            rs = ps.executeQuery();
            while (rs.next()) {
                x.add(new Test(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDate(4), rs.getInt(5), rs.getInt(6)));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return x;
    }
    
    public static void main(String[] args) {
        Test_Quiz_DAO tqdao = new Test_Quiz_DAO();
        for (Test arg : tqdao.getTestByTitle("che")) {
            System.out.println(arg);
        }
    }
}
