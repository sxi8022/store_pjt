package com.web.rosefinch.customerCenter.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CustomerCenterController {

	// jj >> qna 
	@GetMapping(value = "cs-center/qna")
	public String qna() {
		return "cs-center/qna";
	}
	
}