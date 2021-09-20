/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * @author Admin
 */
public class History {
    private int id;
    private int testId;
    private int userId;
    private Date takenDate;

    public History() {
    }

    public History(int testId, int userId, Date takenDate) {
        this.testId = testId;
        this.userId = userId;
        this.takenDate = takenDate;
    }

    public History(int id, int testId, int userId, Date takenDate) {
        this.id = id;
        this.testId = testId;
        this.userId = userId;
        this.takenDate = takenDate;
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTestId() {
        return testId;
    }

    public void setTestId(int testId) {
        this.testId = testId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Date getTakenDate() {
        return takenDate;
    }

    public void setTakenDate(Date takenDate) {
        this.takenDate = takenDate;
    }
       
}
