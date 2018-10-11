package com.web.rosefinch.goods.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.rosefinch.goods.dao.GoodsDAOImpl;
import com.web.rosefinch.goods.vo.CategoryVO;
import com.web.rosefinch.goods.vo.GoodsImgVO;
import com.web.rosefinch.goods.vo.GoodsVO;

@Service
public class GoodsServiceImpl implements GoodsService {

	@Autowired
	public GoodsDAOImpl goodsDAO;

	public List<GoodsVO> getGoodsList(String keyword) {
		return goodsDAO.getGoodsList(keyword);
	}

	public List<CategoryVO> getCategories() {
		return goodsDAO.getCategories();
	}

	public List<String> getCompanies(String keyword) {
		return goodsDAO.getComapnies(keyword);
	}

	public List<CategoryVO> getCategoryFilter(String keyword, int catCode) {
		return goodsDAO.getCategoryFilter(keyword, catCode);
	}

	public List<GoodsVO> getGoodsListFilter(String keyword, int catCode) {
		return goodsDAO.getGoodsListFilter(keyword, catCode);
	}

	public int Productregistration(GoodsVO vo) {
		return goodsDAO.Productregistration(vo);
	}

	public int Productregistration_img(GoodsImgVO vo) {
		return 0;
	}

}
