package com.web.rosefinch.goods.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.rosefinch.category.service.CategoryServiceImpl;
import com.web.rosefinch.category.vo.CategoryVO;
import com.web.rosefinch.goods.service.GoodsServiceImpl;
import com.web.rosefinch.goods.vo.FilterVO;
import com.web.rosefinch.goods.vo.GoodsImgVO;
import com.web.rosefinch.goods.vo.GoodsVO;

@Controller
public class GoodsController {

	@Autowired
	private GoodsServiceImpl goodsService;
	@Autowired
	private CategoryServiceImpl categoryService;


	//판매사 상품등록
	@RequestMapping(value="/ProductregistrationProcess",method=RequestMethod.POST)
	public String registration_process(GoodsVO vo, GoodsImgVO img, HttpSession session) throws Exception{
		String login  = (String) session.getAttribute("login");

		goodsService.Productregistration(vo);
		goodsService.Productregistration_img(img);

		return "/seller/dashboard";

	}
	
	@GetMapping(value = "/goods/rank")
	public String rankPage(Model model, @RequestParam("topic") String topic) {
		List<CategoryVO> categoryList = categoryService.getSubCategories(new FilterVO(null, 0, null, null));
		
		String pageTitle;
		if(topic.equals("new")) {
			pageTitle = "신상품";
		} else {
			pageTitle = "베스트";
		}
		
		model.addAttribute("topic", topic);
		model.addAttribute("pageTitle", pageTitle);
		model.addAttribute("categoryList", categoryList);
		return "goods/rank";
	}
	
	@GetMapping(value = "/goods/ajax/rankGoodsList")
	public @ResponseBody List<GoodsVO> ajaxNewGoodsList(@RequestParam("topic") String topic, @RequestParam(value = "catCode") int catCode) {
		// 상위 100개의 최신상품을 카테고리 별로 읽어옴
		FilterVO filterVO = new FilterVO(null, catCode, null, null);
		List<GoodsVO> goodsList = null;
		
		if(topic.equals("new")) {
			goodsList = goodsService.getNewGoodsList(filterVO);
		} else {
			goodsList = goodsService.getBestGoodsList(filterVO);
		}
		
		return goodsList;
	}

	// 상품 리스트
	@GetMapping(value = "/goods/goods")
	public String goods(Model model, HttpServletRequest request) {
		String keyword = request.getParameter("keyword");
		
		if(keyword != null && !keyword.isEmpty()) {
			FilterVO filterVO = new FilterVO(keyword, 0, null, null);
			
			List<GoodsVO> goodsList = goodsService.getGoodsListFilter(filterVO);
			List<CategoryVO> categoryFilter = categoryService.getCategoryFilter(filterVO);
			List<String> companyFilter = goodsService.getCompanies(keyword);
			model.addAttribute("keyword", keyword);
			model.addAttribute("categoryFilter", categoryFilter);
			model.addAttribute("companyFilter", companyFilter);
			model.addAttribute("goodsList", goodsList);
		}
		return "goods/goods";
	}
	
	// 필터 조건 값을 충족하는 상품을 알아내기 위해서 조건을 충족하는 상품 번호들을 요청
	@GetMapping(value = "/goods/ajax/goodsListFilter")
	public @ResponseBody List<GoodsVO> ajaxGoodsListFilter(@RequestParam("keyword") String keyword, 
			@RequestParam(value = "catCode", required = false) int catCode,
			@RequestParam(value = "company[]", required = false) List<String> company,
			@RequestParam(value = "priceRange[]", required = false) List<Integer> priceRange) {
		
		FilterVO filterVO = new FilterVO(keyword, catCode, company, priceRange);
		List<GoodsVO> goodsFilter = null;

		if(keyword != null && !keyword.isEmpty()) {
			goodsFilter = goodsService.getGoodsListFilter(filterVO);
		}
		
		return goodsFilter;
	}

	// 상품 자세히보기
	@GetMapping(value = "/goods/goods-view")
	public String goodsView() {
		return "goods/goods-view";
	}
}
