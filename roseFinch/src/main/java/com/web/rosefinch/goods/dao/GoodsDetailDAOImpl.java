package com.web.rosefinch.goods.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.rosefinch.goods.vo.GoodsDetailVO;
import com.web.rosefinch.goods.vo.GoodsImagesVO;
import com.web.rosefinch.goods.vo.GoodsOptVO;
import com.web.rosefinch.goods.vo.GoodsReviewVO;
import com.web.rosefinch.goods.vo.SellerVO;

@Repository
public class GoodsDetailDAOImpl implements GoodsDetailDAO {
	
	@Autowired
	private SqlSession sess;

	private final String namespace = "com.web.rosefinch.mapper.GoodDetailMapper";
	
	@Override
	public GoodsDetailVO readGood(int gdsCode) {
		return sess.selectOne(namespace+".readGood", gdsCode);
	}

	@Override
	public List<GoodsImagesVO> readGoodImg(int gdsCode) {
		return sess.selectList(namespace+".readGoodImg", gdsCode);
	}

	@Override
	public List<GoodsOptVO> readGoodOpts(int gdsCode) {
		return sess.selectList(namespace+".readGoodOpts", gdsCode);
	}

	@Override
	public List<GoodsReviewVO> readGoodReviews(int gdsCode) {
		return sess.selectList(namespace+".readGoodReviews", gdsCode);
	}
	
	@Override
	public List<String> readGoodReviewImgs(int revCode) {
		return sess.selectList(namespace+".readGoodReviewImgs", revCode);
	}

	@Override
	public Map<String, Double> readCountAvgRating(int gdsCode) {
		return sess.selectOne(namespace+".readCountAvgRating", gdsCode);
		
	}

	@Override
	public SellerVO readSeller(int selCode) {
		return sess.selectOne(namespace+".readSeller", selCode);
	}

	@Override
	public List<String> readOptGrpTits(int gdsCode) {
		return sess.selectList(namespace+".readOptGrpTits", gdsCode);
	}

	@Override
	public List<GoodsOptVO> readOptGrp(int gdsCode, int optGrp) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("gdsCode", gdsCode);
		params.put("optGrp", optGrp);
		return sess.selectList(namespace+".readOptGrp", params);
	}
	
	@Override
	public GoodsOptVO readOpt(int optCode) {
		return sess.selectOne(namespace+".readOpt", optCode);
	}

}
