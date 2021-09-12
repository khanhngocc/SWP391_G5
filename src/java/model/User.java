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
public class User {
    private int id;
    private String fullname;
    private boolean gender;
    private String email;
    private String phone;
    private String password;
    private Date createDate;
    private String avatar;
    private int rollId;

    public User() {
    }

    public User(int id, String fullname, boolean gender, String email, String phone, String password, Date createDate, String avatar, int rollId) {
        this.id = id;
        this.fullname = fullname;
        this.gender = gender;
        this.email = email;
        this.phone = phone;
        this.password = password;
        this.createDate = createDate;
        this.avatar = avatar;
        this.rollId = rollId;
    }

    public User( String fullname, boolean gender, String email, String phone, String password, Date createDate, String avatar, int rollId) {
        this.fullname = fullname;
        this.gender = gender;
        this.email = email;
        this.phone = phone;
        this.password = password;
        this.createDate = createDate;
        this.avatar = avatar;
        this.rollId = rollId;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public int getRollId() {
        return rollId;
    }

    public void setRollId(int rollId) {
        this.rollId = rollId;
    }
    
}
