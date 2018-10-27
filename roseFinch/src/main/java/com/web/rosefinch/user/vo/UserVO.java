package com.web.rosefinch.user.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class UserVO {

	private int userCode;		//코드번호
	private String userId;		//ID
	private String userPwd;	//PW
	private String name;		//이름
	private String phone;		//전화번호
	private String email;		//이메일
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date birth;			//생일
	private String address;		//주소
	private int userStat;		//계정상태
	private Date joinDate;		//가입일시
	private Date userModDate;	//수정일시
	private String gender;		//성별
	private int points;			//점수
	private String rating;		//구매등급
	public int getUserCode() {
		return userCode;
	}
	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getUserStat() {
		return userStat;
	}
	public void setUserStat(int userStat) {
		this.userStat = userStat;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	public Date getUserModDate() {
		return userModDate;
	}
	public void setUserModDate(Date userModDate) {
		this.userModDate = userModDate;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getPoints() {
		return points;
	}
	public void setPoints(int points) {
		this.points = points;
	}
	public String getRating() {
		return rating;
	}
	public void setRating(String rating) {
		this.rating = rating;
	}
	
	@Override
	public String toString() {
		return "UserVO [userCode=" + userCode + ", userId=" + userId + ", userPwd=" + userPwd + ", name=" + name
				+ ", phone=" + phone + ", email=" + email + ", birth=" + birth + ", address=" + address + ", user_stat="
				+ userStat + ", joinDate=" + joinDate + ", userModDate=" + userModDate + ", gender=" + gender
				+ ", points=" + points + ", rating=" + rating + "]";
	}
	
	
	
}