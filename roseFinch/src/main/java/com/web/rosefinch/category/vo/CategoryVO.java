package com.web.rosefinch.category.vo;

public class CategoryVO {
	private int catCode;
	private String catName;
	private int catParCode;
	
	@Override
	public String toString() {
		return "CategoryVO [catCode=" + catCode + ", catName=" + catName + ", catParCode=" + catParCode + "]";
	}
	
	public int getCatCode() {
		return catCode;
	}
	public void setCatCode(int catCode) {
		this.catCode = catCode;
	}
	public String getCatName() {
		return catName;
	}
	public void setCatName(String catName) {
		this.catName = catName;
	}
	public int getCatParCode() {
		return catParCode;
	}
	public void setCatParCode(int catParCode) {
		this.catParCode = catParCode;
	}
	
}
