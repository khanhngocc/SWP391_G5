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
 * fixed: 10/22/2021
 */
public class Quizzes {
    private int id;
    private String title;
    private String description;
    private int subject_id;
    private String category;
    private String level;
    private String type;
    private int user_id;
    private int number_of_question;
    private int duration;
    private float rate;
    private String thumbnail;
    private Date create_date;
    private boolean isFeatured;

    public Quizzes() {
    }

    public Quizzes(int id, String title, String description, int subject_id, String category, String level, String type, int user_id, int number_of_question, int duration, float rate, String thumbnail, Date create_date, boolean isFeatured) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.subject_id = subject_id;
        this.category = category;
        this.level = level;
        this.type = type;
        this.user_id = user_id;
        this.number_of_question = number_of_question;
        this.duration = duration;
        this.rate = rate;
        this.thumbnail = thumbnail;
        this.create_date = create_date;
        this.isFeatured = isFeatured;
    }

    public Quizzes(String title, String description, int subject_id, String category, String level, String type, int user_id, int number_of_question, int duration, float rate, String thumbnail, Date create_date, boolean isFeatured) {
        this.title = title;
        this.description = description;
        this.subject_id = subject_id;
        this.category = category;
        this.level = level;
        this.type = type;
        this.user_id = user_id;
        this.number_of_question = number_of_question;
        this.duration = duration;
        this.rate = rate;
        this.thumbnail = thumbnail;
        this.create_date = create_date;
        this.isFeatured = isFeatured;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getSubject_id() {
        return subject_id;
    }

    public void setSubject_id(int subject_id) {
        this.subject_id = subject_id;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getNumber_of_question() {
        return number_of_question;
    }

    public void setNumber_of_question(int number_of_question) {
        this.number_of_question = number_of_question;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public float getRate() {
        return rate;
    }

    public void setRate(float rate) {
        this.rate = rate;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public Date getCreate_date() {
        return create_date;
    }

    public void setCreate_date(Date create_date) {
        this.create_date = create_date;
    }

    public boolean isIsFeatured() {
        return isFeatured;
    }

    public void setIsFeatured(boolean isFeatured) {
        this.isFeatured = isFeatured;
    }
    
}