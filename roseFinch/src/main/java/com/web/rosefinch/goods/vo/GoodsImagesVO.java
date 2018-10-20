package com.web.rosefinch.goods.vo;

public class GoodsImagesVO {
	
	private int gdsImgCode;
	private int gdsCode;
	private String gdsImgName;
	private String gdsImgUrl;
	private String gdsImgSeq;
	
	public int getGdsImgCode() {
		return gdsImgCode;
	}
	public void setGdsImgCode(int gdsImgCode) {
		this.gdsImgCode = gdsImgCode;
	}
	public int getGdsCode() {
		return gdsCode;
	}
	public void setGdsCode(int gdsCode) {
		this.gdsCode = gdsCode;
	}
	public String getGdsImgName() {
		return gdsImgName;
	}
	public void setGdsImgName(String gdsImgName) {
		this.gdsImgName = gdsImgName;
	}
	public String getGdsImgUrl() {
		return gdsImgUrl;
	}
	public void setGdsImgUrl(String gdsImgUrl) {
		this.gdsImgUrl = gdsImgUrl;
	}
	public String getGdsImgSeq() {
		return gdsImgSeq;
	}
	public void setGdsImgSeq(String gdsImgSeq) {
		this.gdsImgSeq = gdsImgSeq;
	}
	@Override
	public String toString() {
		return "GoodsImagesVO [gdsImgCode=" + gdsImgCode + ", gdsCode=" + gdsCode + ", gdsImgName=" + gdsImgName
				+ ", gdsImgUrl=" + gdsImgUrl + ", gdsImgSeq=" + gdsImgSeq + "]";
	}
	
}
