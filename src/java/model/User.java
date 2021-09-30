/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class User {
    private int id;
    private String fullname;
    private String email;
    private String phone;
    private String password;
    private Date createDate;
    private String avatar;
    private int rollId;
    private String title;
    private String status;
    
    ArrayList<String> url = new ArrayList<>();

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

     public User() {
    }

    public User(int id, String fullname, String title, String email, String phone, String password, Date createDate, String avatar, String status, int rollId) {
        this.id = id;
        this.fullname = fullname;
        this.title = title;
        this.email = email;
        this.phone = phone;
        this.password = password;
        this.createDate = createDate;
        this.avatar = avatar;
        this.status = status;
        this.rollId = rollId;
    }

    
    public User( String fullname, String title, String email, String phone, String password, Date createDate, String avatar, String status, int rollId) {
        this.fullname = fullname;
        this.title = title;
        this.email = email;
        this.phone = phone;
        this.password = password;
        this.createDate = createDate;
        this.avatar = avatar;
        this.status = status;
        this.rollId = rollId;
    }
    
    
    public ArrayList<String> getUrl() {
        return url;
    }

    public void setUrl(ArrayList<String> url) {
        this.url = url;
    }

    public User(String email, String password) {
        this.email = email;
        this.password = password;
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
