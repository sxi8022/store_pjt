package com.web.rosefinch.goods.vo;

public class GoodsOptVO {
	private int optCode;
	private int gdsCode;
	private String optName;
	private int optPrice;
	private int optCnt;
	private int optGrp;
	private String optGrpTit;
	
	public int getOptCode() {
		return optCode;
	}
	public void setOptCode(int optCode) {
		this.optCode = optCode;
	}
	public int getGdsCode() {
		return gdsCode;
	}
	public void setGdsCode(int gdsCode) {
		this.gdsCode = gdsCode;
	}
	public String getOptName() {
		return optName;
	}
	public void setOptName(String optName) {
		this.optName = optName;
	}
	public int getOptPrice() {
		return optPrice;
	}
	public void setOptPrice(int optPrice) {
		this.optPrice = optPrice;
	}
	public int getOptCnt() {
		return optCnt;
	}
	public void setOptCnt(int optCnt) {
		this.optCnt = optCnt;
	}
	public int getOptGrp() {
		return optGrp;
	}
	public void setOptGrp(int optGrp) {
		this.optGrp = optGrp;
	}
	public String getOptGrpTit() {
		return optGrpTit;
	}
	public void setOptGrpTit(String optGrpTit) {
		this.optGrpTit = optGrpTit;
	}

	@Override
	public String toString() {
		return "GoodsOptionVO [optCode=" + optCode + ", gdsCode=" + gdsCode + ", optName=" + optName + ", optPrice="
				+ optPrice + ", optCnt=" + optCnt + "]";
	}
}
