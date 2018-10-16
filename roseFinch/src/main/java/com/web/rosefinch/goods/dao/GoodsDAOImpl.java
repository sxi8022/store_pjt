package com.web.rosefinch.goods.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.rosefinch.goods.vo.FilterVO;
import com.web.rosefinch.goods.vo.GoodsImgVO;
import com.web.rosefinch.goods.vo.GoodsVO;

@Repository
public class GoodsDAOImpl implements GoodsDAO{

	@Autowired
	private SqlSession sqlSession;

	private static String namespace = "com.web.rosefinch.mapper.goodsMapper";

	public List<GoodsVO> getNewGoodsList(FilterVO filterVO) {
		return sqlSession.selectList("getNewGoodsList", filterVO);
	}

	public List<GoodsVO> getBestGoodsList(FilterVO filterVO) {
		return sqlSession.selectList("getBestGoodsList", filterVO);
	}
	
	public List<GoodsVO> getGoodsList(FilterVO filterVO) {
		return sqlSession.selectList("getGoodsList", filterVO);
	}

	public List<String> getComapnies(String keyword) {
		return sqlSession.selectList("getCompanies", keyword);
	}
	
	public List<GoodsVO> getGoodsListFilter(FilterVO filterVO) {
		return sqlSession.selectList("getGoodsListFilter", filterVO);
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
