package com.blog.model;

public class User {
    private int id;
    private String uname;
    private String uemail;
    private String upw;
    private String umobile;

    public User() {}

    public User(String uname, String uemail, String upw, String umobile) {
        this.uname = uname;
        this.uemail = uemail;
        this.upw = upw;
        this.umobile = umobile;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUemail() {
        return uemail;
    }

    public void setUemail(String uemail) {
        this.uemail = uemail;
    }

    public String getUpw() {
        return upw;
    }

    public void setUpw(String upw) {
        this.upw = upw;
    }

    public String getUmobile() {
        return umobile;
    }

    public void setUmobile(String umobile) {
        this.umobile = umobile;
    }
}
