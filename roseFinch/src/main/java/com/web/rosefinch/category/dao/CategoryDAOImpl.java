package com.web.rosefinch.category.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.web.rosefinch.category.vo.CategoryVO;
import com.web.rosefinch.goods.vo.FilterVO;

public class CategoryDAOImpl implements CategoryDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public List<CategoryVO> getSubCategories(FilterVO filterVO) {
		return sqlSession.selectList("getSubCategories", filterVO);
	}
	
	public List<CategoryVO> getSubCategoriesInvokedFilter(FilterVO filterVO) {
		return sqlSession.selectList("getSubCategoriesInvokedFilter", filterVO);
	}
	
	public int getSubCategoryCount(FilterVO filterVO) {
		return sqlSession.selectOne("getSubCategoryCount", filterVO);
	}
	
	public CategoryVO getCategory(int catCode) {
		return sqlSession.selectOne("getCategory", catCode);
	}

	public List<CategoryVO> getCategoryPath(int catCode) {
		return sqlSession.selectList("getCategoryPath", catCode);
	}

	public List<CategoryVO> getCatSibs(int catCode) {
		return sqlSession.selectList("getCatSibs", catCode);
	}
}
