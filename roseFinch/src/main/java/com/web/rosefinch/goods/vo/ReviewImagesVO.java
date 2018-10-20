package com.web.rosefinch.goods.vo;

public class ReviewImagesVO {
	private int revImgCode; 
	private int revCode;
	private String revImgUrl;
	private String revImgName;
	
	public int getRevImgCode() {
		return revImgCode;
	}
	public void setRevImgCode(int revImgCode) {
		this.revImgCode = revImgCode;
	}
	public int getRevCode() {
		return revCode;
	}
	public void setRevCode(int revCode) {
		this.revCode = revCode;
	}
	public String getRevImgUrl() {
		return revImgUrl;
	}
	public void setRevImgUrl(String revImgUrl) {
		this.revImgUrl = revImgUrl;
	}
	public String getRevImgName() {
		return revImgName;
	}
	public void setRevImgName(String revImgName) {
		this.revImgName = revImgName;
	}
	@Override
	public String toString() {
		return "ReviewImagesVO [revImgCode=" + revImgCode + ", revCode=" + revCode + ", revImgUrl=" + revImgUrl
				+ ", revImgName=" + revImgName + "]";
	}
}
