package com.web.rosefinch.goods.vo;

public class SellerVO {
	private int selCode;
	private int userCode;
	private String selId;
	private String selPwd;
	private int selOwnerCode;
	private int selJoinStat;
	private int selCredit;
	private int selType;
	private String selName;
	private String selOriAddr;
	private String selRtnAddr;
	private String selPhone;
	private String selShpCharge;
	private String selJoinDate;
	private String selModDate;
	public int getSelCode() {
		return selCode;
	}
	public void setSelCode(int selCode) {
		this.selCode = selCode;
	}
	public int getUserCode() {
		return userCode;
	}
	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}
	public String getSelId() {
		return selId;
	}
	public void setSelId(String selId) {
		this.selId = selId;
	}
	public String getSelPwd() {
		return selPwd;
	}
	public void setSelPwd(String selPwd) {
		this.selPwd = selPwd;
	}
	public int getSelOwnerCode() {
		return selOwnerCode;
	}
	public void setSelOwnerCode(int selOwnerCode) {
		this.selOwnerCode = selOwnerCode;
	}
	public int getSelJoinStat() {
		return selJoinStat;
	}
	public void setSelJoinStat(int selJoinStat) {
		this.selJoinStat = selJoinStat;
	}
	public int getSelCredit() {
		return selCredit;
	}
	public void setSelCredit(int selCredit) {
		this.selCredit = selCredit;
	}
	public int getSelType() {
		return selType;
	}
	public void setSelType(int selType) {
		this.selType = selType;
	}
	public String getSelName() {
		return selName;
	}
	public void setSelName(String selName) {
		this.selName = selName;
	}
	public String getSelOriAddr() {
		return selOriAddr;
	}
	public void setSelOriAddr(String selOriAddr) {
		this.selOriAddr = selOriAddr;
	}
	public String getSelRtnAddr() {
		return selRtnAddr;
	}
	public void setSelRtnAddr(String selRtnAddr) {
		this.selRtnAddr = selRtnAddr;
	}
	public String getSelPhone() {
		return selPhone;
	}
	public void setSelPhone(String selPhone) {
		this.selPhone = selPhone;
	}
	public String getSelShpCharge() {
		return selShpCharge;
	}
	public void setSelShpCharge(String selShpCharge) {
		this.selShpCharge = selShpCharge;
	}
	public String getSelJoinDate() {
		return selJoinDate;
	}
	public void setSelJoinDate(String selJoinDate) {
		this.selJoinDate = selJoinDate;
	}
	public String getSelModDate() {
		return selModDate;
	}
	public void setSelModDate(String selModDate) {
		this.selModDate = selModDate;
	}
	@Override
	public String toString() {
		return "SellerVO [selCode=" + selCode + ", userCode=" + userCode + ", selId=" + selId + ", selPwd=" + selPwd
				+ ", selOwnerCode=" + selOwnerCode + ", selJoinStat=" + selJoinStat + ", selCredit=" + selCredit
				+ ", selType=" + selType + ", selName=" + selName + ", selOriAddr=" + selOriAddr + ", selRtnAddr="
				+ selRtnAddr + ", selPhone=" + selPhone + ", selShpCharge=" + selShpCharge + ", selJoinDate="
				+ selJoinDate + ", selModDate=" + selModDate + "]";
	}	
}
