package com.web.roseFinch.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	// 추가할 기능들 
	// 로그인
	// 아이디 찾기
	// 비밀번호 찾기 
	// 로그아웃 
	
	@GetMapping(value = "user/login")
	public String login() {
		return "user/login";
	}
	
	
	@GetMapping(value = "user/mypage")
	public String mypage() {
		return "user/mypage";
	}
	
}