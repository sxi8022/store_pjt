package com.web.roseFinch.goods.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class GoodsController {

	// jj >> 상품 페이지 
	@GetMapping(value = "goods/goods")
	public String goods() {
		return "goods/goods";
	}
	
	@GetMapping(value = "goods/goods-view")
	public String goodsView() {
		return "goods/goods-view";
	}
	
}