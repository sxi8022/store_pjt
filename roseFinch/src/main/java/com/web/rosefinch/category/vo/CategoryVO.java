package com.web.rosefinch.category.vo;

public class CategoryVO {
	private int catCode;
	private String catName;
	private int catLeft;
	private int catRight;
	
	@Override
	public String toString() {
		return "CategoryVO [catCode=" + catCode + ", catName=" + catName + ", catLeft=" + catLeft + ", catRight="
				+ catRight + "]";
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
	public int getCatLeft() {
		return catLeft;
	}
	public void setCatLeft(int catLeft) {
		this.catLeft = catLeft;
	}
	public int getCatRight() {
		return catRight;
	}
	public void setCatRight(int catRight) {
		this.catRight = catRight;
	}
}
