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
	
	public List<CategoryVO> getCategoryFilter(FilterVO filterVO) {
		return sqlSession.selectList("getCategoryFilter", filterVO);
	}
}
