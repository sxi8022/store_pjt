package com.web.roseFinch.user.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class UserVO {

	private int user_code;		//코드번호
	private String user_id;		//ID
	private String user_pwd;	//PW
	private String name;		//이름
	private String phone;		//전화번호
	private String email;		//이메일
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date birth;			//생일
	private String address;		//주소
	private int user_stat;		//계정상태
	private Date join_date;		//가입일시
	private Date user_mod_date;	//수정일시
	private String gender;		//성별
	private int points;			//점수
	private String rating;		//구매등급

	public int getUser_code() {
		return user_code;
	}

	public void setUser_code(int user_code) {
		this.user_code = user_code;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pwd() {
		return user_pwd;
	}

	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
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

	public int getUser_stat() {
		return user_stat;
	}

	public void setUser_stat(int user_stat) {
		this.user_stat = user_stat;
	}


	public Date getJoin_date() {
		return join_date;
	}

	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}

	public Date getUser_mod_date() {
		return user_mod_date;
	}

	public void setUser_mod_date(Date user_mod_date) {
		this.user_mod_date = user_mod_date;
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
		return "UserVO [user_code=" + user_code + ", user_id=" + user_id + ", user_pwd=" + user_pwd + ", name=" + name
				+ ", phone=" + phone + ", email=" + email + ", birth=" + birth + ", address=" + address
				+ ", user_stat=" + user_stat + ", join_date=" + join_date
				+ ", user_mod_date=" + user_mod_date + ", gender=" + gender + ", points=" + points + ", rating="
				+ rating + "]";
	}

}
