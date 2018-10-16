package com.web.rosefinch.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/admin")
public class AdminController {

	private static Logger logger = LoggerFactory.getLogger(AdminController.class);

	@GetMapping("/login")
	public String adminLogin(@RequestParam(required=false) String error, Model model){
		model.addAttribute("error", error);
		logger.info("login get : "+error);
		return "admin/admin-login";
	}
	
	@PostMapping("/login")
	public String adminLoginPost(){
		logger.info("login post");
		return "redirect:/admin/main";
	}
	
	@GetMapping("/main")
	public String adminBoard(){
		logger.info("admin main dashboard");
		return "admin/admin-dashboard";
	}
	
}
