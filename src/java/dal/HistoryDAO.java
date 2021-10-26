/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.util.ArrayList;
import model.History;

/**
 *
 * @author Admin
 */
public class HistoryDAO extends MyDAO {
    
    public ArrayList<History> getHistorybyUserID(int id){
        ArrayList<History> x = new ArrayList<>();
        xSql = "select * from History where user_id = ?";
        try{
            ps = con.prepareStatement(xSql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while(rs.next()){
                x.add(new History(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getDate(4), rs.getFloat(5), rs.getString(6)));
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return x;
    }
}
