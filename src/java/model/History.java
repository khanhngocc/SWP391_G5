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
    private int user_id;
    private int quiz_id;
    private Date taken;
    private float percentage;
    private String status;

    public History() {
    }

    public History(int id, int user_id, int quiz_id, Date taken, float percentage, String status) {
        this.id = id;
        this.user_id = user_id;
        this.quiz_id = quiz_id;
        this.taken = taken;
        this.percentage = percentage;
        this.status = status;
    }

    public History(int user_id, int quiz_id, Date taken, float percentage, String status) {
        this.user_id = user_id;
        this.quiz_id = quiz_id;
        this.taken = taken;
        this.percentage = percentage;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getQuiz_id() {
        return quiz_id;
    }

    public void setQuiz_id(int quiz_id) {
        this.quiz_id = quiz_id;
    }

    public Date getTaken() {
        return taken;
    }

    public void setTaken(Date taken) {
        this.taken = taken;
    }

    public float getPercentage() {
        return percentage;
    }

    public void setPercentage(float percentage) {
        this.percentage = percentage;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
}