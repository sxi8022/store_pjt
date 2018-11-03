package com.web.rosefinch.goods.service;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.rosefinch.goods.dao.GoodsDetailDAO;
import com.web.rosefinch.goods.vo.GoodsDetailVO;
import com.web.rosefinch.goods.vo.GoodsImagesVO;
import com.web.rosefinch.goods.vo.GoodsOptVO;
import com.web.rosefinch.goods.vo.GoodsReviewVO;
import com.web.rosefinch.goods.vo.SellerVO;

@Service
public class GoodsDetailServiceImpl implements GoodsDetailService{
	
	@Autowired
	private GoodsDetailDAO dao;

	@Override
	public GoodsDetailVO getGood(int gdsCode) {
		return dao.readGood(gdsCode);
	}

	@Override
	public List<GoodsImagesVO> getGoodImg(int gdsCode) {
		return dao.readGoodImg(gdsCode);
	}

	@Override
	public Map<String, List<GoodsOptVO>> getGdsOptGrps(int gdsCode) {
		Map<String, List<GoodsOptVO>> gdsOptGrps = new LinkedHashMap<>();
		List<String> optGrpTits = dao.readOptGrpTits(gdsCode);
		for(int i=0; i<optGrpTits.size(); i++) {
			gdsOptGrps.put(optGrpTits.get(i), dao.readOptGrp(gdsCode, i));
		}
		return gdsOptGrps;
	}

	@Override
	@Transactional
	public List<GoodsReviewVO> getGoodReviews(int gdsCode) {
		List<GoodsReviewVO> revs = dao.readGoodReviews(gdsCode);
		for(GoodsReviewVO vo : revs){
			vo.setRevImgUrl(getGoodReviewImgs(vo.getRevCode()));
		}
		return revs;
	}

	@Override
	public List<String> getGoodReviewImgs(int revCode) {
		return dao.readGoodReviewImgs(revCode);
	}

	@Override
	public Map<String, Double> getCountAvgRating(int gdsCode) {
		return dao.readCountAvgRating(gdsCode);
	}

	@Override
	public SellerVO getSeller(int selCode) {
		return dao.readSeller(selCode);
	}

	@Override
	public GoodsOptVO getOpt(int optCode) {
		return dao.readOpt(optCode);
	}
	
	
}
