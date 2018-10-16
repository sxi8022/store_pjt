package com.web.rosefinch.admin.vo;

public class AdminVO  {
	private int adCode;
	private String adId;
	private String adPwd;
	private String adAuth;
	private String adName;
	private String adVisitDate;
	
	public int getAdCode() {
		return adCode;
	}
	public void setAdCode(int adCode) {
		this.adCode = adCode;
	}
	public String getAdId() {
		return adId;
	}
	public void setAdId(String adId) {
		this.adId = adId;
	}
	public String getAdPwd() {
		return adPwd;
	}
	public void setAdPwd(String adPwd) {
		this.adPwd = adPwd;
	}
	public String getAdAuth() {
		return adAuth;
	}
	public void setAdAuth(String adAuth) {
		this.adAuth = adAuth;
	}
	public String getAdName() {
		return adName;
	}
	public void setAdName(String adName) {
		this.adName = adName;
	}
	public String getAdVisitDate() {
		return adVisitDate;
	}
	public void setAdVisitDate(String adVisitDate) {
		this.adVisitDate = adVisitDate;
	}
	@Override
	public String toString() {
		return "adminVO [adCode=" + adCode + ", adId=" + adId + ", adPwd=" + adPwd + ", adAuth=" + adAuth + ", adName="
				+ adName + ", adVisitDate=" + adVisitDate + "]";
	}

}
