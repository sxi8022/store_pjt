package com.web.rosefinch.goods.vo;

import java.util.Date;

public class GoodsDetailVO {
	private int gdsCode;
	private int catCode;
	private int selCode;
	private String gdsName;
	private String gdsCompany;
	private String gdsMadeby;
	private String gdsDesc;
	private int gdsPrice;
	private int gdsCnt;
	private int gdsSelYn;
	private int gdsHit;
	private Date gdsStrDate;
	private Date gdsModDate;
	
	public int getGdsCode() {
		return gdsCode;
	}
	public void setGdsCode(int gdsCode) {
		this.gdsCode = gdsCode;
	}
	public int getCatCode() {
		return catCode;
	}
	public void setCatCode(int catCode) {
		this.catCode = catCode;
	}
	public int getSelCode() {
		return selCode;
	}
	public void setSelCode(int selCode) {
		this.selCode = selCode;
	}
	public String getGdsName() {
		return gdsName;
	}
	public void setGdsName(String gdsName) {
		this.gdsName = gdsName;
	}
	public String getGdsCompany() {
		return gdsCompany;
	}
	public void setGdsCompany(String gdsCompany) {
		this.gdsCompany = gdsCompany;
	}
	public String getGdsMadeby() {
		return gdsMadeby;
	}
	public void setGdsMadeby(String gdsMadeby) {
		this.gdsMadeby = gdsMadeby;
	}
	public String getGdsDesc() {
		return gdsDesc;
	}
	public void setGdsDesc(String gdsDesc) {
		this.gdsDesc = gdsDesc;
	}
	public int getGdsPrice() {
		return gdsPrice;
	}
	public void setGdsPrice(int gdsPrice) {
		this.gdsPrice = gdsPrice;
	}
	public int getGdsCnt() {
		return gdsCnt;
	}
	public void setGdsCnt(int gdsCnt) {
		this.gdsCnt = gdsCnt;
	}
	public int getGdsSelYn() {
		return gdsSelYn;
	}
	public void setGdsSelYn(int gdsSelYn) {
		this.gdsSelYn = gdsSelYn;
	}
	public int getGdsHit() {
		return gdsHit;
	}
	public void setGdsHit(int gdsHit) {
		this.gdsHit = gdsHit;
	}
	public Date getGdsStrDate() {
		return gdsStrDate;
	}
	public void setGdsStrDate(Date gdsStrDate) {
		this.gdsStrDate = gdsStrDate;
	}
	public Date getGdsModDate() {
		return gdsModDate;
	}
	public void setGdsModDate(Date gdsModDate) {
		this.gdsModDate = gdsModDate;
	}
	
	@Override
	public String toString() {
		return "GoodDetailVO [gdsCode=" + gdsCode + ", catCode=" + catCode + ", selCode=" + selCode + ", gdsName="
				+ gdsName + ", gdsCompany=" + gdsCompany + ", gdsMadeby=" + gdsMadeby + ", gdsDesc=" + gdsDesc
				+ ", gdsPrice=" + gdsPrice + ", gdsCnt=" + gdsCnt + ", gdsSelYn=" + gdsSelYn + ", gdsHit=" + gdsHit
				+ ", gdsStrDate=" + gdsStrDate + ", gdsModDate=" + gdsModDate + "]";
	}
	
	
}
