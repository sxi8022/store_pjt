package com.web.rosefinch.category.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.web.rosefinch.category.dao.CategoryDAOImpl;
import com.web.rosefinch.category.vo.CategoryVO;
import com.web.rosefinch.goods.vo.FilterVO;

public class CategoryServiceImpl implements CategoryService {
	@Autowired
	private CategoryDAOImpl categoryDAO;
	
	public List<CategoryVO> getSubCategories(FilterVO filterVO) {
		return categoryDAO.getSubCategories(filterVO);
	}
	
	public List<CategoryVO> getSubCategoriesInvokedFilter(FilterVO filterVO) {
		int subCategoryCount = categoryDAO.getSubCategoryCount(filterVO);
		
		if(subCategoryCount == 0) {
			CategoryVO category = categoryDAO.getCategory(filterVO.getCatCode());
			filterVO = new FilterVO(filterVO.getKeyword(), category.getCatParCode(), null, null);
		}
		
		return categoryDAO.getSubCategoriesInvokedFilter(filterVO);
	}
	
	public List<CategoryVO> getCategoryPath(int catCode) {
		return categoryDAO.getCategoryPath(catCode);
	}
}
