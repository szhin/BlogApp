package com.blog.model;

import java.sql.Timestamp;

public class Blog {
    private int id;
    private int userId;
    private String title;
    private Timestamp creationDate;
    private String content;

    public Blog() {
    }

    public Blog(int userId, String title, String content) {
        this.userId = userId;
        this.title = title;
        this.content = content;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Timestamp getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Timestamp creationDate) {
        this.creationDate = creationDate;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

}
