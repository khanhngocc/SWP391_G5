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
public class Test {
    private int id;
    private String title;
    private String image;
    private Date create_date;
    private int user_id;
    private int duration;

    public Test() {
    }

    public Test(int id, String title, String image, Date create_date, int user_id, int duration) {       
        this.id = id;
        this.title = title;
        this.image = image;
        this.create_date = create_date;
        this.user_id = user_id;
        this.duration = duration;
    }

    public Test( String title, String image, Date create_date, int user_id, int duration) {       
        this.title = title;
        this.image = image;
        this.create_date = create_date;
        this.user_id = user_id;
        this.duration = duration;
    }
    
    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Date getCreate_date() {
        return create_date;
    }

    public void setCreate_date(Date create_date) {
        this.create_date = create_date;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }
    
}
