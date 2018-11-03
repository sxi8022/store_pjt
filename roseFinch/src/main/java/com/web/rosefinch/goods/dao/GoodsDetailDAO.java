package com.web.rosefinch.goods.dao;

import java.util.List;
import java.util.Map;

import com.web.rosefinch.goods.vo.GoodsDetailVO;
import com.web.rosefinch.goods.vo.GoodsImagesVO;
import com.web.rosefinch.goods.vo.GoodsOptVO;
import com.web.rosefinch.goods.vo.GoodsReviewVO;
import com.web.rosefinch.goods.vo.SellerVO;

public interface GoodsDetailDAO {
	
	public GoodsDetailVO readGood(int gdsCode);
	public List<GoodsImagesVO> readGoodImg(int gdsCode);
	public List<GoodsOptVO> readGoodOpts(int gdsCode);
	public List<GoodsReviewVO> readGoodReviews(int gdsCode);
	public List<String> readGoodReviewImgs(int revCode);
	public Map<String, Double> readCountAvgRating(int gdsCode);
	public SellerVO readSeller(int selCode);
	public List<String> readOptGrpTits(int gdsCode);
	public List<GoodsOptVO> readOptGrp(int gdsCode, int optGrp);
	public GoodsOptVO readOpt(int optCode);
}
