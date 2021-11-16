/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Date;
import java.time.LocalDate;
import java.time.Month;
import java.util.ArrayList;
import java.util.List;
import model.*;

/**
 *
 * @author INSPIRON 15-7559
 */
public class ClassDAO extends MyDAO {
    
    public int CreateClass(String name, String logo, int authorID, Date creDate, Date exDate) {
        int res = 0;
        xSql = "INSERT INTO Class (\n"
                + "`name`,\n"
                + "`logo`,\n"
                + "`author_id`,\n"
                + "`status`,\n"
                + "`createdDate`,\n"
                + "`expiredDate`) VALUES (?,?,?,1,?,?)";
        
        try {
            
            ps = con.prepareStatement(xSql);
            ps.setString(1, name);
            ps.setString(2, logo);
            ps.setInt(3, authorID);
            ps.setDate(4, creDate);
            ps.setDate(5, exDate);
            res = ps.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }
    
    public List<Classes> GetAllClass() {
        List<Classes> list = new ArrayList<Classes>();
        xSql = "Select * from Class";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Classes(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getDate(6), rs.getDate(7)));
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public List<Classes> GetAllClassByUserID(int uid) {
        List<Classes> list = new ArrayList<Classes>();
        
        xSql = "Select class_id from Class_Member where user_id = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, uid);
            rs = ps.executeQuery();
            while (rs.next()) {
                int cid = rs.getInt(1);
                list.add(GetClassByClassID(cid));
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public int DeleteUserFromClass(int uid, int cid) {
        int res = 0;
        xSql = "Delete from Class_Member where user_id = ? and class_id = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, uid);
            ps.setInt(2, cid);
            
            res = ps.executeUpdate();
            return res;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }
    
    public int UpdateClass(String name, String logo, String exdate, int id) {
        int res = 0;
        xSql = "UPDATE Class\n"
                + "SET\n"
                + "`name` = ?,\n"
                + "`logo` = ?,\n"
                + "`expiredDate` =? \n"
                + "WHERE `id` = ?;";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, name);
            ps.setString(2, logo);
            ps.setDate(3, Date.valueOf(exdate));
            ps.setInt(4, id);
            
            res = ps.executeUpdate();
            return res;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }
    
    public int InsertUserToClass(int uid, int cid) {
        int res = 0;
        xSql = "Insert into Class_Member values (?,?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, uid);
            ps.setInt(2, cid);
            
            res = ps.executeUpdate();
            return res;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }

    public Classes GetClassByClassID(int id) {
        Classes classes = null;
        xSql = "Select * from Class where id = ?";
        try {
            
            ps = con.prepareStatement(xSql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                classes = new Classes(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getDate(6), rs.getDate(7));
                return classes;
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public List<User> GetUsersByClassID(int id) {
        List<User> list = new ArrayList<User>();
        List listid = new ArrayList();
        UserDAO ud = new UserDAO();
        xSql = "Select user_id from Class_Member where class_id = ?";
        try {
            
            ps = con.prepareStatement(xSql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                listid.add(rs.getInt(1));
                
            }
            for (Object object : listid) {
                list.add(ud.getUser((int) object));
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public List<Classes> GetClassByUserID(int id) {
        List<Classes> list = new ArrayList<Classes>();
        xSql = "Select * from Class where author_id = ?";
        try {
            
            ps = con.prepareStatement(xSql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Classes(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getDate(6), rs.getDate(7)));
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public List<Classes> GetClassByName(String name) {
        List<Classes> list = new ArrayList<Classes>();
        xSql = "Select * from Class where name like ?";
        try {
            
            ps = con.prepareStatement(xSql);
            ps.setString(1, "%" + name + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Classes(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getDate(6), rs.getDate(7)));
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public List<User> GetUserOutsideOfClass(int cid) {
        UserDAO ud = new UserDAO();
        List<User> list = ud.getUserByRole(1);
        List<User> Outside = new ArrayList<>();
        for (User user : list) {
            if (!CheckUserIsInClass(user.getId(), cid)&& user.getStatus().equals("Active")) {
                Outside.add(user);
            }
        }
        return Outside;
    }
    
    public List<Classes> GetTop5RecentClass() {
        List<Classes> list = new ArrayList<Classes>();
        xSql = "Select * from Class order by `createdDate` desc limit 5";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Classes(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getDate(6), rs.getDate(7)));
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public boolean CheckUserIsInClass(int uid, int cid) {
        xSql = "Select * from Class_Member where user_id = ? and class_id = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, uid);
            ps.setInt(2, cid);
            rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        
    }
    
    public static void main(String[] args) {
        ClassDAO cd = new ClassDAO();
//        List<User> x = cd.GetUserOutsideOfClass(1);
////        System.out.println(cd.CheckUserIsInClass(6, 1));
////        System.out.println(cd.CheckUserIsInClass(2, 1));
//        for (User user : x) {
//            System.out.println(user.getFullname());
//        }
        List<Classes> lc = cd.GetAllClassByUserID(2);
        for (Classes classes : lc) {
            System.out.println(classes.getName());
        }

    }
    
}
