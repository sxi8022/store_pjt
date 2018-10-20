package com.web.rosefinch.goods.vo;

import java.util.Date;
import java.util.List;

public class GoodsReviewVO {
	
	private int revCode;
	private int userCode;
	private int gdsCode;
	private String revTitle; 
	private String revCont; 
	private int revYn;
	private String revPwd; 
	private Date revRegDate;
	private Date revModDate; 
	private int revRating;
	private int revRefs;
	private String userId;
	private List<String> revImgUrl;
	
	public int getRevCode() {
		return revCode;
	}
	public void setRevCode(int revCode) {
		this.revCode = revCode;
	}
	public int getUserCode() {
		return userCode;
	}
	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}
	public int getGdsCode() {
		return gdsCode;
	}
	public void setGdsCode(int gdsCode) {
		this.gdsCode = gdsCode;
	}
	public String getRevTitle() {
		return revTitle;
	}
	public void setRevTitle(String revTitle) {
		this.revTitle = revTitle;
	}
	public String getRevCont() {
		return revCont;
	}
	public void setRevCont(String revCont) {
		this.revCont = revCont;
	}
	public int getRevYn() {
		return revYn;
	}
	public void setRevYn(int revYn) {
		this.revYn = revYn;
	}
	public String getRevPwd() {
		return revPwd;
	}
	public void setRevPwd(String revPwd) {
		this.revPwd = revPwd;
	}
	public Date getRevRegDate() {
		return revRegDate;
	}
	public void setRevRegDate(Date revRegDate) {
		this.revRegDate = revRegDate;
	}
	public Date getRevModDate() {
		return revModDate;
	}
	public void setRevModDate(Date revModDate) {
		this.revModDate = revModDate;
	}
	public int getRevRating() {
		return revRating;
	}
	public void setRevRating(int revRating) {
		this.revRating = revRating;
	}
	public int getRevRefs() {
		return revRefs;
	}
	public void setRevRefs(int revRefs) {
		this.revRefs = revRefs;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		int len = userId.length();
		if(len>4){
			this.userId = userId.substring(0, 4)+new String(new char[len-4]).replace('\0', '*');
		}else{
			this.userId = userId;
		}
	}
	
	public List<String> getRevImgUrl() {
		return revImgUrl;
	}
	public void setRevImgUrl(List<String> revImgUrl) {
		this.revImgUrl = revImgUrl;
	}
	@Override
	public String toString() {
		return "GoodsReviewVO [revCode=" + revCode + ", userCode=" + userCode + ", gdsCode=" + gdsCode + ", revTitle="
				+ revTitle + ", revCont=" + revCont + ", revYn=" + revYn + ", revPwd=" + revPwd + ", revRegDate="
				+ revRegDate + ", revModDate=" + revModDate + ", revRating=" + revRating + ", revRefs=" + revRefs
				+ ", userId=" + userId + ", revImgUrl=" + revImgUrl + "]";
	}
}
