package com.web.roseFinch.goods.service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.web.roseFinch.goods.dao.GoodsDAO;
import com.web.roseFinch.goods.dao.GoodsDAOImpl;
import com.web.roseFinch.goods.vo.CategoryFilterVO;
import com.web.roseFinch.goods.vo.GoodsImgVO;
import com.web.roseFinch.goods.vo.GoodsVO;

@Service
public class GoodsServiceImpl implements GoodsService{

	@Autowired public GoodsDAOImpl goodsDAO;


	public List<GoodsVO> getGoodsList(String keyword) {
		return goodsDAO.getGoodsList(keyword);
	}

	public List<CategoryFilterVO> getCategoryFilter(String keyword) {
		return goodsDAO.getDistinctCategoryListOfGoodsList(keyword);
	}

	public List<String> getCompanyFilter(String keyword) {
		return goodsDAO.getDistinctCompanyListOfGoodsList(keyword);
	}


	public int Productregistration(GoodsVO vo) {
		return goodsDAO.Productregistration(vo);
	}


	public int Productregistration_img(GoodsImgVO vo) {
		return 0;
	}



}
