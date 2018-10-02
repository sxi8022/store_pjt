package com.web.roseFinch.user.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@RequestMapping(value="/user/login", method=RequestMethod.GET)
	public String login() {
		
		return "/user/login";
	}
	
	@RequestMapping(value="/user/login", method=RequestMethod.POST)
	public String login(HttpServletResponse response ,HttpSession session, UserVO vo) throws Exception {
		
		UserVO user = userService.selectUser(vo);
		
		if(user != null) {
			session.setAttribute("user", user);
			return "redirect:/main";
		}else {
			return "redirect:/user/login";
		}
	}
	
	@RequestMapping("/user/logout")
	public String logout( HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/user/login";
	}
	
	
	@GetMapping(value = "/user/mypage")
	public String mypage() {
		
		return "/user/mypage";
	}
	
	@RequestMapping(value="/user/join", method=RequestMethod.GET)
	public String join(UserVO vo) {
		
		return "/user/join";
	}
	
	
	@RequestMapping(value="/user/join", method=RequestMethod.POST)
	public String join( HttpServletRequest request, UserVO vo) throws Exception {
		String address=vo.getAddress();

		vo.setJoin_date(new Date(System.currentTimeMillis()));
		vo.setUser_mod_date(new Date(System.currentTimeMillis()));
		vo.setAddress(address);
		userService.insertUser(vo);
		
		return "redirect:/user/login";
	}
}