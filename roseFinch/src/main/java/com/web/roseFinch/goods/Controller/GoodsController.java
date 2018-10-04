package com.web.roseFinch.goods.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.roseFinch.goods.service.GoodsServiceImpl;
import com.web.roseFinch.goods.vo.CategoryFilterVO;
import com.web.roseFinch.goods.vo.GoodsVO;

@Controller
public class GoodsController {
	@Autowired
	private GoodsServiceImpl goodsService;
	
	// 상품 리스트
	@GetMapping(value = "/goods/goods")
	public String goods(Model model, HttpServletRequest request) {
		String keyword = request.getParameter("keyword");

		if(keyword != null && !keyword.isEmpty()) {
			List<GoodsVO> goodsList = goodsService.getGoodsList(keyword);
			List<CategoryFilterVO> categoryFilter = goodsService.getCategoryFilter(keyword);
			List<String> companyFilter = goodsService.getCompanyFilter(keyword);
			model.addAttribute("keyword", keyword);
			model.addAttribute("categoryFilter", categoryFilter);
			model.addAttribute("companyFilter", companyFilter);
			model.addAttribute("goodsList", goodsList);
		}
		
		return "goods/goods";
	}
	
	// 상품 자세히보기
	@GetMapping(value = "/goods/goods-view")
	public String goodsView() {
		return "goods/goods-view";
	}
}
