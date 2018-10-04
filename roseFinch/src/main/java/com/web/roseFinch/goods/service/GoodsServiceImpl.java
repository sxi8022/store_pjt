package com.web.roseFinch.goods.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.web.roseFinch.goods.dao.GoodsDAOImpl;
import com.web.roseFinch.goods.vo.CategoryFilterVO;
import com.web.roseFinch.goods.vo.GoodsVO;

public class GoodsServiceImpl implements GoodsService{
	@Autowired
	public GoodsDAOImpl goodsDAO;
	
	public List<GoodsVO> getGoodsList(String keyword) {
		return goodsDAO.getGoodsList(keyword);
	}
	
	public List<CategoryFilterVO> getCategoryFilter(String keyword) {
		return goodsDAO.getDistinctCategoryListOfGoodsList(keyword);
	}
	
	public List<String> getCompanyFilter(String keyword) {
		return goodsDAO.getDistinctCompanyListOfGoodsList(keyword);
	}
}
