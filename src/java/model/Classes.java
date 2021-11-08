/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;
import java.sql.Timestamp;

/**
 *
 * @author INSPIRON 15-7559
 */
public class Classes {
    int id;
     String name;
 
    String logo;
    int authorId;
    int status;
    Date createdDate;
    Date expriedDate;

    public Classes(int id, String name, String logo, int authorId, int status, Date createdDate, Date expriedDate) {
        this.id = id;
        this.name = name;
        this.logo = logo;
        this.authorId = authorId;
        this.status = status;
        this.createdDate = createdDate;
        this.expriedDate = expriedDate;
    }
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public int getAuthorId() {
        return authorId;
    }

    public void setAuthorId(int authorId) {
        this.authorId = authorId;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public Date getExpriedDate() {
        return expriedDate;
    }

    public void setExpriedDate(Date expriedDate) {
        this.expriedDate = expriedDate;
    }
   
}
