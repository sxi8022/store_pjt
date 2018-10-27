package com.web.rosefinch.goods.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.rosefinch.category.service.CategoryServiceImpl;
import com.web.rosefinch.category.vo.CategoryVO;
import com.web.rosefinch.goods.service.GoodsDetailServiceImpl;
import com.web.rosefinch.goods.service.GoodsServiceImpl;
import com.web.rosefinch.goods.vo.FilterVO;
import com.web.rosefinch.goods.vo.GoodsDetailVO;
import com.web.rosefinch.goods.vo.GoodsImagesVO;
import com.web.rosefinch.goods.vo.GoodsImgVO;
import com.web.rosefinch.goods.vo.GoodsVO;

@Controller
public class GoodsController {
	
	public final Logger logger = LoggerFactory.getLogger(GoodsController.class);
		
	@Autowired
	private GoodsServiceImpl goodsService;
	@Autowired
	private CategoryServiceImpl categoryService;
	
	@Autowired
	private GoodsDetailServiceImpl gdsDetailServ;

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
	@GetMapping(value = "/search/all")
	public String searchAll(Model model,
			@RequestParam(value = "keyword", defaultValue = "") String keyword, 
			@RequestParam(value = "catCode", defaultValue = "0") int catCode) {
			
		if(!keyword.isEmpty()) {
			FilterVO filterVO = new FilterVO(keyword, catCode, null, null);
			List<GoodsVO> goodsList = goodsService.getGoodsInvokedFilter(filterVO);
			List<CategoryVO> subCategories = categoryService.getSubCategoriesInvokedFilter(filterVO);
			model.addAttribute("categoryPath", categoryService.getCategoryPath(catCode));
			model.addAttribute("subCategories", subCategories);
			model.addAttribute("goodsList", goodsList);
		}

		model.addAttribute("keyword", keyword);
		return "goods/goods";
	}
	
	@GetMapping(value = "/search/category")
	public String searchCategory(Model model, 
			@RequestParam(value = "catCode", defaultValue = "0") int catCode) {
			
		FilterVO filterVO = new FilterVO(null, catCode, null, null);
		List<GoodsVO> goodsList = goodsService.getGoodsInvokedFilter(filterVO);
		List<CategoryVO> subCategories = categoryService.getSubCategoriesInvokedFilter(filterVO);
		model.addAttribute("categoryPath", categoryService.getCategoryPath(catCode));
		model.addAttribute("subCategories", subCategories);
		model.addAttribute("goodsList", goodsList);
			
		return "goods/goods";
	}

	@GetMapping(value = "/search/filter/goods")
	public String searchFilterGoods(Model model,
			@RequestParam(value = "keyword", defaultValue="") String keyword,
			@RequestParam(value = "catCode", defaultValue="0") int catCode,
			@RequestParam(value = "company[]", required=false) List<String> company,
			@RequestParam(value = "priceRange[]", required=false) List<Integer> priceRange) {
		
		FilterVO filterVO = new FilterVO(keyword, catCode, company, priceRange);
		// sortType
		model.addAttribute("goodsList", goodsService.getGoodsInvokedFilter(filterVO));
		// pagination
		return "goods/template/content";
	}
	
	@GetMapping(value = "/search/filter/company")
	public String searchFilterCompany(Model model,
			@RequestParam(value = "catCode", defaultValue="0") int catCode) {
		model.addAttribute("companies", goodsService.getCompanyInvokedFilter(catCode));
		return "goods/template/company-filter";
	}	

	// 상품 자세히보기
	@GetMapping(value = "/goods/goods-view/{gdsCode}")
	public String goodsView(@PathVariable Integer gdsCode, Model model) {
		
		GoodsDetailVO goodVO = gdsDetailServ.getGood(gdsCode);
		int selCode = goodVO.getSelCode();
		
		model.addAttribute("good", goodVO);
		
		List<GoodsImagesVO> imgVO = gdsDetailServ.getGoodImg(gdsCode);
		model.addAttribute("goodImg", imgVO);
		model.addAttribute("goodImgNum", imgVO.size());
		model.addAttribute("goodOpts", gdsDetailServ.getGoodOpts(gdsCode));
		model.addAttribute("goodReviews", gdsDetailServ.getGoodReviews(gdsCode));
		
		Map<String, Double> countAvg = gdsDetailServ.getCountAvgRating(gdsCode);
		logger.info(countAvg.toString());
		model.addAttribute("revNum", countAvg.get("count"));
		model.addAttribute("revAvg", countAvg.get("avg"));
		model.addAttribute("seller", gdsDetailServ.getSeller(selCode));
		
		return "goods/goods-view";
	}
}
