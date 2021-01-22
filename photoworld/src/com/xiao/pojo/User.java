package com.xiao.pojo;

public class User {
	
	private Integer uid;
	
	private String username; 
	private String password;
	private String sex;
	private String phone;
    private String userphoto;
    private String email;
    private Integer fans;
	private Integer follow;
    private String tag;
    
    public String getTag() {
    	return tag;
    }
    public void setTag(String tag) {
    	this.tag = tag;
    }
	public Integer getFollow() {
		return follow;
	}
	public void setFollow(Integer follow) {
		this.follow = follow;
	}
	public Integer getFans() {
		return fans;
	}
	public void setFans(Integer fans) {
		this.fans = fans;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getUserphoto() {
		return userphoto;
	}
	public void setUserphoto(String userphoto) {
		this.userphoto = userphoto;
	}
	@Override
	public String toString() {
		return "User [uid=" + uid + ", username=" + username + ", password=" + password + ", sex=" + sex + ", phone="
				+ phone + ", userphoto=" + userphoto + "]";
	}
    
    
}
