package com.web.mybatis.user;

import java.util.Date;

public class UserVO {
	private String userid;
	private String userpw;
	private String name;
	private String email;
	private Date updatedate;
	
	
	
	public UserVO(String userid, String userpw, String name, String email) {
		super();
		this.userid = userid;
		this.userpw = userpw;
		this.name = name;
		this.email = email;
	}
	public String getUserid() {
		
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	
	@Override
	public String toString() {
		return "UserVO [userid=" + userid + ", userpw=" + userpw + ", name=" + name + ", email=" + email
				+ ", updatedate=" + updatedate + "]";
	}
	
}
