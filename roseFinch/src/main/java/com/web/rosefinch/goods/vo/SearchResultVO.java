package com.web.rosefinch.goods.vo;

import java.util.List;

public class SearchResultVO {
	private List<GoodsVO> arrGoods;
	private List<CategoryVO> arrCategory;
	
	public List<GoodsVO> getArrGoods() {
		return arrGoods;
	}
	public void setArrGoods(List<GoodsVO> arrGoods) {
		this.arrGoods = arrGoods;
	}
	public List<CategoryVO> getArrCategory() {
		return arrCategory;
	}
	public void setArrCategory(List<CategoryVO> arrCategory) {
		this.arrCategory = arrCategory;
	}
}
