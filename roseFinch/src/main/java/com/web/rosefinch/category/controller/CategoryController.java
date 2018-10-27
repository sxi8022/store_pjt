package com.web.rosefinch.category.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.rosefinch.category.service.CategoryServiceImpl;
import com.web.rosefinch.category.vo.CategoryVO;
import com.web.rosefinch.goods.vo.FilterVO;

@Controller
public class CategoryController {
	@Autowired
	private CategoryServiceImpl categoryService;
	
	@GetMapping(value = "/search/filter/category")
	public String searchFilterCategory(Model model,
			@RequestParam(value = "keyword", defaultValue="") String keyword,
			@RequestParam(value = "catCode", defaultValue="0") int catCode) {
		
		FilterVO filterVO = new FilterVO(keyword, catCode, null, null);
		model.addAttribute("categoryPath", categoryService.getCategoryPath(catCode));
		model.addAttribute("subCategories", categoryService.getSubCategoriesInvokedFilter(filterVO));
		
		return "goods/template/category-filter";
	}
}
