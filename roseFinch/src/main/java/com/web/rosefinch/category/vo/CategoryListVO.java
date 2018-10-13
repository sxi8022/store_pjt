package com.web.rosefinch.category.vo;

import java.util.List;
import java.util.Map;

public class CategoryListVO {
	List<CategoryVO> categoryDepth0;
	Map<String, List<CategoryVO>> categoryDepth1;
	
	public CategoryListVO() {}
	
	public CategoryListVO(List<CategoryVO> categoryDepth0, Map<String, List<CategoryVO>> categoryDepth1) {
		super();
		this.categoryDepth0 = categoryDepth0;
		this.categoryDepth1 = categoryDepth1;
	}

	public List<CategoryVO> getCategoryDepth0() {
		return categoryDepth0;
	}
	
	public void setCategoryDepth0(List<CategoryVO> categoryDepth0) {
		this.categoryDepth0 = categoryDepth0;
	}
	
	public Map<String, List<CategoryVO>> getCategoryDepth1() {
		return categoryDepth1;
	}
	
	public void setCategoryDepth1(Map<String, List<CategoryVO>> categoryDepth1) {
		this.categoryDepth1 = categoryDepth1;
	}
	
}
