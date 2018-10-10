package com.web.roseFinch.goods.controller;

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

import com.web.roseFinch.goods.service.GoodsServiceImpl;
import com.web.roseFinch.goods.vo.CategoryVO;
import com.web.roseFinch.goods.vo.GoodsImgVO;
import com.web.roseFinch.goods.vo.GoodsVO;
import com.web.roseFinch.goods.vo.SearchResultVO;

@Controller
public class GoodsController {

	@Autowired
	private GoodsServiceImpl goodsService;

	// 판매사 상품등록
	@RequestMapping(value = "/ProductregistrationProcess", method = RequestMethod.POST)
	public String registration_process(GoodsVO vo, GoodsImgVO img, HttpSession session) throws Exception {

		String login = (String) session.getAttribute("login");

		goodsService.Productregistration(vo);
		goodsService.Productregistration_img(img);

		return "/seller/dashboard";

	}

	// 상품 리스트
	@GetMapping(value = "/goods/goods")
	public String goods(Model model, HttpServletRequest request) {
		String keyword = request.getParameter("keyword");

		if (keyword != null && !keyword.isEmpty()) {
			List<GoodsVO> goodsList = goodsService.getGoodsList(keyword);
			List<CategoryVO> categoryFilter = goodsService.getCategories();
			List<String> companyFilter = goodsService.getCompanies(keyword);
			model.addAttribute("keyword", keyword);
			model.addAttribute("categoryFilter", categoryFilter);
			model.addAttribute("companyFilter", companyFilter);
			model.addAttribute("goodsList", goodsList);
			System.out.println(goodsList.toString() + "@@@@@@@@@@@@@@@@@@@@@@@@@@");
		}
		return "goods/goods";
	}

	// 카테고리, 상품리스트 필터링
	@GetMapping(value = "/goods/ajax")
	public @ResponseBody SearchResultVO AjaxView(@RequestParam("keyword") String keyword,
			@RequestParam("catCode") int catCode) {
		SearchResultVO result = new SearchResultVO();
		if (keyword != null && !keyword.isEmpty()) {
			result.setArrCategory(goodsService.getCategoryFilter(keyword, catCode));
			result.setArrGoods(goodsService.getGoodsListFilter(keyword, catCode));
		}
		return result;
	}

	// 상품 자세히보기
	@GetMapping(value = "/goods/goods-view")
	public String goodsView() {
		return "goods/goods-view";
	}
}
