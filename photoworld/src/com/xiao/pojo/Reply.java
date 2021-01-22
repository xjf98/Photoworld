package com.xiao.pojo;

public class Reply {

	 private String rid;
	 private String comment_id;
	 private Integer uid;
	 private String r_content;
	 private String r_time;
	 
	public String getR_time() {
		return r_time;
	}
	public void setR_time(String r_time) {
		this.r_time = r_time;
	}
	public String getRid() {
		return rid;
	}
	public void setRid(String rid) {
		this.rid = rid;
	}
	public String getComment_id() {
		return comment_id;
	}
	public void setComment_id(String comment_id) {
		this.comment_id = comment_id;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	@Override
	public String toString() {
		return "Reply [rid=" + rid + ", comment_id=" + comment_id + ", uid=" + uid + ", r_content=" + r_content + "]";
	}
	
	 
	
}
