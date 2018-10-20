package com.web.rosefinch.goods.service;

import java.util.List;
import java.util.Map;

import com.web.rosefinch.goods.vo.GoodsDetailVO;
import com.web.rosefinch.goods.vo.GoodsImagesVO;
import com.web.rosefinch.goods.vo.GoodsOptVO;
import com.web.rosefinch.goods.vo.GoodsReviewVO;
import com.web.rosefinch.goods.vo.SellerVO;

public interface GoodsDetailService {
	
	public GoodsDetailVO getGood(int gdsCode);
	public List<GoodsImagesVO> getGoodImg(int gdsCode);
	public List<GoodsOptVO> getGoodOpts(int gdsCode);
	public List<GoodsReviewVO> getGoodReviews(int gdsCode);
	public List<String> getGoodReviewImgs(int revCode);
	public Map<String, Double> getCountAvgRating(int gdsCode);
	public SellerVO getSeller(int selCode);
}
