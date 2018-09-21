package com.web.roseFinch.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	
	// jj >> 쇼핑몰 메인 페이지  
	@GetMapping(value = "main")
	public String main() {
		return "/main";
	}
	
	
	@RequestMapping(value = "/topSellers")
	public String home(Model model) {
		return "topSellers";
	}

	
}