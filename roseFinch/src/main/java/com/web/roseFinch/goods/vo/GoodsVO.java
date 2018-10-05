package com.web.roseFinch.goods.vo;

import java.util.Date;

public class GoodsVO {
	private int code;
	private String imgUrl;
	private int categoryCode;
	private String categoryName;
	private int sellerCode;
	private String sellerName;
	private String name;
	private String company;
	private String madeby;
	private int price;
	private int count;
	private int sellYesOrNo;
	private int hit;
	private Date startDate;
	private Date modifyDate;
	private String post;
	
	@Override
	public String toString() {
		return "GoodsVO [code=" + code + ", imgUrl=" + imgUrl + ", categoryCode=" + categoryCode + ", categoryName="
				+ categoryName + ", sellerCode=" + sellerCode + ", sellerName=" + sellerName + ", name=" + name
				+ ", company=" + company + ", madeby=" + madeby + ", price=" + price + ", count=" + count
				+ ", sellYesOrNo=" + sellYesOrNo + ", hit=" + hit + ", startDate=" + startDate + ", modifyDate="
				+ modifyDate + ", post=" + post + "]";
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public int getCategoryCode() {
		return categoryCode;
	}

	public void setCategoryCode(int categoryCode) {
		this.categoryCode = categoryCode;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public int getSellerCode() {
		return sellerCode;
	}

	public void setSellerCode(int sellerCode) {
		this.sellerCode = sellerCode;
	}

	public String getSellerName() {
		return sellerName;
	}

	public void setSellerName(String sellerName) {
		this.sellerName = sellerName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getMadeby() {
		return madeby;
	}

	public void setMadeby(String madeby) {
		this.madeby = madeby;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getSellYesOrNo() {
		return sellYesOrNo;
	}

	public void setSellYesOrNo(int sellYesOrNo) {
		this.sellYesOrNo = sellYesOrNo;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}


}
