package com.web.roseFinch.goods.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.web.roseFinch.goods.vo.CategoryFilterVO;
import com.web.roseFinch.goods.vo.GoodsImgVO;
import com.web.roseFinch.goods.vo.GoodsVO;

public class GoodsDAOImpl implements GoodsDAO{

	@Autowired
	private SqlSession sqlSession;

	private static String namespace = "com.web.roseFinch.mapper.goodsMapper";

	public List<GoodsVO> getGoodsList(String keyword) {
		return sqlSession.selectList("getGoodsList", keyword);
	}

	public List<CategoryFilterVO> getDistinctCategoryListOfGoodsList(String keyword) {
		return sqlSession.selectList("getDistinctCategoryListOfGoodsList", keyword);
	}

	public List<String> getDistinctCompanyListOfGoodsList(String keyword) {
		return sqlSession.selectList("getDistinctCompanyListOfGoodsList", keyword);
	}

	@Override
	public int Productregistration(GoodsVO vo) {
		return sqlSession.insert(namespace + ".seller_Productregistration", vo);
	}

	@Override
	public int Productregistration_img(GoodsImgVO vo) {
		return sqlSession.insert(namespace + ".seller_Productregistration_img", vo) ;
	}
}
