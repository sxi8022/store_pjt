package com.web.roseFinch.basket.vo;

public class BasketVO {
	private Integer cartCode;
	private Integer gdsCode;
	private Integer userCode;
	private Integer gdsImgCode;
	private String gdsImgUrl;
	private String gdsName;
	private Integer gdsPrice;
	private Integer gdsSelYn;
	
	public Integer getCartCode() {
		return cartCode;
	}
	public void setCartCode(Integer cartCode) {
		this.cartCode = cartCode;
	}
	public Integer getGdsCode() {
		return gdsCode;
	}
	public void setGdsCode(Integer gdsCode) {
		this.gdsCode = gdsCode;
	}
	public Integer getUserCode() {
		return userCode;
	}
	public void setUserCode(Integer userCode) {
		this.userCode = userCode;
	}
	public Integer getGdsImgCode() {
		return gdsImgCode;
	}
	public void setGdsImgCode(Integer gdsImgCode) {
		this.gdsImgCode = gdsImgCode;
	}
	public String getGdsImgUrl() {
		return gdsImgUrl;
	}
	public void setGdsImgUrl(String gdsImgUrl) {
		this.gdsImgUrl = gdsImgUrl;
	}
	public String getGdsName() {
		return gdsName;
	}
	public void setGdsName(String gdsName) {
		this.gdsName = gdsName;
	}
	public Integer getGdsPrice() {
		return gdsPrice;
	}
	public void setGdsPrice(Integer gdsPrice) {
		this.gdsPrice = gdsPrice;
	}
	public Integer getGdsSelYn() {
		return gdsSelYn;
	}
	public void setGdsSelYn(Integer gdsSelYn) {
		this.gdsSelYn = gdsSelYn;
	}
	@Override
	public String toString() {
		return "BasketVO [cartCode=" + cartCode + ", gdsCode=" + gdsCode + ", userCode=" + userCode + ", gdsImgCode="
				+ gdsImgCode + ", gdsImgUrl=" + gdsImgUrl + ", gdsName=" + gdsName + ", gdsPrice=" + gdsPrice
				+ ", gdsSelYn=" + gdsSelYn + "]";
	}
}
