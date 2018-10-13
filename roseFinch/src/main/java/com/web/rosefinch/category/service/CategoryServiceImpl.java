package com.web.rosefinch.category.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.web.rosefinch.category.dao.CategoryDAOImpl;
import com.web.rosefinch.category.vo.CategoryVO;
import com.web.rosefinch.goods.vo.FilterVO;

public class CategoryServiceImpl implements CategoryService {
	@Autowired
	private CategoryDAOImpl categoryDAO;
	
	public List<CategoryVO> getCategories() {
		return categoryDAO.getCategories();
	}
	
	public List<CategoryVO> getCategoryFilter(FilterVO filterVO) {
		return categoryDAO.getCategoryFilter(filterVO);
	}
}
