package com.xiao.pojo;

import java.util.List;

public class UserComment {

	 private String comment_id;
	 private String username;
	 private String userphoto;
	 private String content;
	 private String c_time;
	 private List<UserReply> rlist;
	 
	 
	 
	public List<UserReply> getRlist() {
		return rlist;
	}
	public void setRlist(List<UserReply> rlist) {
		this.rlist = rlist;
	}
	public String getComment_id() {
		return comment_id;
	}
	public void setComment_id(String comment_id) {
		this.comment_id = comment_id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserphoto() {
		return userphoto;
	}
	public void setUserphoto(String userphoto) {
		this.userphoto = userphoto;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getC_time() {
		return c_time;
	}
	public void setC_time(String c_time) {
		this.c_time = c_time;
	}
	 
	 
}
