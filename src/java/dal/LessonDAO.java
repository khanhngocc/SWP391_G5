/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import model.Lesson;

/**
 *
 * @author INSPIRON 15-7559
 */
public class LessonDAO extends MyDAO {
     public List<Lesson> GetAllLessonByClassId(int id){
        List<Lesson> list = new ArrayList<Lesson>();
        xSql = "Select * from Lessons where class_id = ? ";
        try{
        ps = con.prepareStatement(xSql);
        ps.setInt(1, id);
        rs = ps.executeQuery();
        while(rs.next()){
             list.add(new Lesson(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4),  rs.getDate(5), rs.getDate(6)));
        }
        return list;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
     
     public Lesson GetLessonById(int id){
       Lesson l = null;
        xSql = "Select * from Lessons where id = ? ";
        try{
        ps = con.prepareStatement(xSql);
        ps.setInt(1, id);
        rs = ps.executeQuery();
        while(rs.next()){
             l =new Lesson(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4),  rs.getDate(5), rs.getDate(6));
        }
        
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return l;
    }
     
     public int AddLessonToClass(String name, String content,int cid, String endDate){
         int res = 0;
         xSql = "INSERT INTO Lessons\n" +
"(\n" +
"`name`,\n" +
"`content`,\n" +
"`class_id`,\n" +
"`create_date`,\n" +
"`end_date`)\n" +
"VALUES\n" +
"(\n" +
"?,\n" +
"?,\n" +
"?,\n" +
"?,\n" +
"?);";
         try{
             ps =con.prepareStatement(xSql);
             ps.setString(1,name);
             ps.setString(2, content);
             ps.setInt(3, cid);
             ps.setDate(4, Date.valueOf(LocalDate.now()));
             ps.setDate(5,Date.valueOf(endDate));
             res = ps.executeUpdate();
             
         }
         catch(Exception ex){
             ex.printStackTrace();
         }
         return res;
     }
     
     public int DeleteLesson(int id){
         int res = 0;
         xSql = "DELETE FROM Lessons WHERE id =?;";
         try{
             ps =con.prepareStatement(xSql);
             ps.setInt(1,id);
             
             res = ps.executeUpdate();
             
         }
         catch(Exception ex){
             ex.printStackTrace();
         }
         return res;
     }
     
     
     public static void main(String[] args) {
        LessonDAO ld= new LessonDAO();
         System.out.println(ld.DeleteLesson(1));
    }
}
