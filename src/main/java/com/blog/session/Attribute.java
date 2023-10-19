package com.blog.session;

public class Attribute {
	private String name;
	private String fullname;
	private String blogTitle;
	private String blogContent;
	private String blogTime;
	private String blogCreator;
	private String userEmail;
	private String userPhone;
	private String userPassword;
	
	public Attribute() {
		this.name = "name";
		this.fullname = "fullname";
		this.blogTitle = "blogTitle";
		this.blogContent = "blogContent";
		this.blogTime = "blogTime";
		this.blogCreator = "blogCreator";
		this.userEmail = "userEmail";
		this.userPhone = "userPhone";
		this.userPassword = "userPassword";
	}

	public String getName() {
		return name;
	}
	public String getBlogTitle() {
		return blogTitle;
	}
	public String getBlogContent() {
		return blogContent;
	}
	public String getBlogTime() {
		return blogTime;
	}
	public String getFullname() {
		return fullname;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public String getBlogCreator() {
		return blogCreator;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public String getUserPassword() {
		return userPassword;
	}
	
}
