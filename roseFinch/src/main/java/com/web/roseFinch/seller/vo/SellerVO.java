package com.web.roseFinch.seller.vo;

public class SellerVO {
	private int sel_code;
	private int user_code;
	private String sel_id;
	private String sel_pwd;
	private String sel_name;
	private int sel_owner_code;
	private int sel_join_stat;
	private int sel_credit;
	private int sel_type;
	private String sel_nick;
	private String sel_ori_addr;
	private String sel_rtn_addr;
	private String sel_phone;
	private String sel_shp_charge;
	private String sel_join_date;
	private String sel_mod_date;

	public boolean isCheckedPasswd(String userPasswd) {
		if(sel_pwd.equals(userPasswd)) {
			return true;
		}
		return false;
	}




	public int getSel_code() {
		return sel_code;
	}

	public void setSel_code(int sel_code) {
		this.sel_code = sel_code;
	}


	public String getSel_id() {
		return sel_id;
	}


	public void setSel_id(String sel_id) {
		this.sel_id = sel_id;
	}


	public String getSel_pwd() {
		return sel_pwd;
	}


	public void setSel_pwd(String sel_pwd) {
		this.sel_pwd = sel_pwd;
	}




	public int getUser_code() {
		return user_code;
	}




	public void setUser_code(int user_code) {
		this.user_code = user_code;
	}




	public String getSel_name() {
		return sel_name;
	}




	public void setSel_name(String sel_name) {
		this.sel_name = sel_name;
	}




	public int getSel_owner_code() {
		return sel_owner_code;
	}




	public void setSel_owner_code(int sel_owner_code) {
		this.sel_owner_code = sel_owner_code;
	}




	public int getSel_join_stat() {
		return sel_join_stat;
	}




	public void setSel_join_stat(int sel_join_stat) {
		this.sel_join_stat = sel_join_stat;
	}




	public int getSel_credit() {
		return sel_credit;
	}




	public void setSel_credit(int sel_credit) {
		this.sel_credit = sel_credit;
	}




	public int getSel_type() {
		return sel_type;
	}




	public void setSel_type(int sel_type) {
		this.sel_type = sel_type;
	}




	public String getSel_nick() {
		return sel_nick;
	}




	public void setSel_nick(String sel_nick) {
		this.sel_nick = sel_nick;
	}




	public String getSel_ori_addr() {
		return sel_ori_addr;
	}




	public void setSel_ori_addr(String sel_ori_addr) {
		this.sel_ori_addr = sel_ori_addr;
	}




	public String getSel_rtn_addr() {
		return sel_rtn_addr;
	}




	public void setSel_rtn_addr(String sel_rtn_addr) {
		this.sel_rtn_addr = sel_rtn_addr;
	}




	public String getSel_phone() {
		return sel_phone;
	}




	public void setSel_phone(String sel_phone) {
		this.sel_phone = sel_phone;
	}




	public String getSel_shp_charge() {
		return sel_shp_charge;
	}




	public void setSel_shp_charge(String sel_shp_charge) {
		this.sel_shp_charge = sel_shp_charge;
	}




	public String getSel_join_date() {
		return sel_join_date;
	}




	public void setSel_join_date(String sel_join_date) {
		this.sel_join_date = sel_join_date;
	}




	public String getSel_mod_date() {
		return sel_mod_date;
	}




	public void setSel_mod_date(String sel_mod_date) {
		this.sel_mod_date = sel_mod_date;
	}





}
