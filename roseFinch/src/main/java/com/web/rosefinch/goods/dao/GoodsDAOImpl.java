package com.web.rosefinch.goods.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.rosefinch.goods.vo.CategoryVO;
import com.web.rosefinch.goods.vo.GoodsImgVO;
import com.web.rosefinch.goods.vo.GoodsVO;

@Repository
public class GoodsDAOImpl implements GoodsDAO {

	@Autowired
	private SqlSession sqlSession;

	private static String namespace = "com.web.rosefinch.mapper.goodsMapper";

	public List<GoodsVO> getGoodsList(String keyword) {
		return sqlSession.selectList("getGoodsList", keyword);
	}

	public List<CategoryVO> getCategories() {
		return sqlSession.selectList("getCategories");
	}

	public List<String> getComapnies(String keyword) {
		return sqlSession.selectList("getCompanies", keyword);
	}

	public List<CategoryVO> getCategoryFilter(String keyword, int catCode) {
		Map params = new HashMap();
		params.put("keyword", keyword);
		params.put("catCode", catCode);
		return sqlSession.selectList("getCategoryFilter", params);
	}

	public List<GoodsVO> getGoodsListFilter(String keyword, int catCode) {
		Map params = new HashMap();
		params.put("keyword", keyword);
		params.put("catCode", catCode);
		return sqlSession.selectList("getGoodsListFilter", params);
	}

	@Override
	public int Productregistration(GoodsVO vo) {
		return sqlSession.insert(namespace + ".seller_Productregistration", vo);
	}

	@Override
	public int Productregistration_img(GoodsImgVO vo) {
		return sqlSession.insert(namespace + ".seller_Productregistration_img", vo);
	}
}