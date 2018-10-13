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

	public List<GoodsVO> getGoodsList(String keyword) {
		return goodsDAO.getGoodsList(keyword);
	}
	
	public List<String> getCompanies(String keyword) {
		return goodsDAO.getComapnies(keyword);
	}

	public List<GoodsVO> getGoodsListFilter(FilterVO filterVO) {
		return goodsDAO.getGoodsListFilter(filterVO);
	}
	
	public int Productregistration(GoodsVO vo) {
		return goodsDAO.Productregistration(vo);
	}

	public int Productregistration_img(GoodsImgVO vo) {
		return 0;
	}



}
