package com.web.rosefinch.goods.vo;

import java.util.List;

public class FilterVO {
	private String keyword;
	private int catCode;
	private List<String> company;
	private List<Integer> priceRange;
	
	public FilterVO(String keyword, int catCode, List<String> company, List<Integer> priceRange) {
		this.keyword = keyword;
		this.catCode = catCode;
		this.company = company;
		this.priceRange = priceRange;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getCatCode() {
		return catCode;
	}

	public void setCatCode(int catCode) {
		this.catCode = catCode;
	}

	public List<String> getCompany() {
		return company;
	}

	public void setCompany(List<String> company) {
		this.company = company;
	}

	public List<Integer> getPriceRange() {
		return priceRange;
	}

	public void setPriceRange(List<Integer> priceRange) {
		this.priceRange = priceRange;
	}

}
