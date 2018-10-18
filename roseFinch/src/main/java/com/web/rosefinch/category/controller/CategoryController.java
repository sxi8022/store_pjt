package com.web.rosefinch.category.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	
	// 특정 카테고리의 하위 카테고리를 알아내기 위해서 하위 카테고리들 번호들을 요청
	@GetMapping(value = "/category/ajax/categoryFilter")
	public @ResponseBody List<CategoryVO> ajaxCategoryFilter(@RequestParam("keyword") String keyword,
			@RequestParam(value = "catCode") int catCode) {
		
		FilterVO filterVO = new FilterVO(keyword, catCode, null, null);
		List<CategoryVO> categoryFilter = null;
		
		if(keyword != null && !keyword.isEmpty()) {
			categoryFilter = categoryService.getCategoryFilter(filterVO);
		}
		
		return categoryFilter;
	}
}
