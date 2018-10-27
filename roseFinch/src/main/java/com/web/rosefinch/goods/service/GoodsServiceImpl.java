package com.web.rosefinch.goods.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.rosefinch.goods.dao.GoodsDAOImpl;
import com.web.rosefinch.goods.vo.FilterVO;
import com.web.rosefinch.goods.vo.GoodsImgVO;
import com.web.rosefinch.goods.vo.GoodsVO;

@Service
public class GoodsServiceImpl implements GoodsService{

	@Autowired
	public GoodsDAOImpl goodsDAO;

	public List<GoodsVO> getNewGoodsList(FilterVO filterVO) {
		return goodsDAO.getNewGoodsList(filterVO);
	}
	
	public List<GoodsVO> getBestGoodsList(FilterVO filterVO) {
		return goodsDAO.getBestGoodsList(filterVO);
	}
	
	public List<GoodsVO> getGoodsInvokedFilter(FilterVO filterVO) {
		return goodsDAO.getGoodsInvokedFilter(filterVO);
	}
	
	public List<String> getCompanyInvokedFilter(int catCode) {
		return goodsDAO.getCompanyInvokedFilter(catCode);
	}
	
	public int Productregistration(GoodsVO vo) {
		return goodsDAO.Productregistration(vo);
	}

	public int Productregistration_img(GoodsImgVO vo) {
		return 0;
	}

}
