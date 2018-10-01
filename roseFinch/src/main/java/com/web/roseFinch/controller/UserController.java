package com.web.roseFinch.user.controller;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.web.roseFinch.user.service.UserService;
import com.web.roseFinch.user.vo.UserVO;

@Controller
public class UserController {
	
	@Inject
	private UserService userService;

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	// 추가할 기능들 
	// 로그인
	// 아이디 찾기
	// 비밀번호 찾기 
	// 로그아웃 
	
	@RequestMapping(value="user/login", method=RequestMethod.GET)
	public String login() {
		
		return "user/login";
	}
	
	@RequestMapping(value="user/login", method=RequestMethod.POST)
	public String login(HttpServletResponse response ,HttpSession session, UserVO vo) throws Exception {
		
		userService.selectUser(vo);

		return "redirect:/user/login";
	}
	
	@RequestMapping("/user/logout.do")
	public String logout( HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/user/login.do";
	}
	
	
	@GetMapping(value = "user/mypage")
	public String mypage() {
		
		return "user/mypage";
	}
	
	@RequestMapping(value="user/join", method=RequestMethod.GET)
	public String join() {
		
		return "/user/join";
	}
	
	@RequestMapping(value="user/join", method=RequestMethod.POST)
	public String register( HttpServletRequest request, UserVO vo) {
		String address=vo.getAddress()+"("+vo.getZip()+")";
		vo.setBirth(new Date(System.currentTimeMillis()));
		vo.setJoin_date(new Date(System.currentTimeMillis()));
		vo.setUser_mod_date(new Date(System.currentTimeMillis()));
		vo.setAddress(address);
		userService.insertUser(vo);
		
		return "redirect:/user/login.do";
	}
	
}