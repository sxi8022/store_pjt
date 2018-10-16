package com.web.rosefinch.user.controller;

import java.sql.Date;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.web.rosefinch.user.service.UserService;
import com.web.rosefinch.user.vo.UserVO;

@Controller
public class UserController {
	
	@Autowired
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
		
		UserVO user = userService.selectUser(vo);
		
		if(user != null) {
			session.setAttribute("user", user);
			return "redirect:/main";
		}else {
			return "redirect:/user/login";
		}
	}
	
//	@GetMapping(value = "/main")
//	public String main() {
//		return "/main";
//	}
//	
	@RequestMapping("user/logout")
	public String logout( HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/main";
	}
	
	
	@GetMapping(value = "user/mypage")
	public ModelAndView mypage(Model model, ServletRequest req, ServletResponse res) {
		
		return new ModelAndView("user/mypage");
	}
	
	@RequestMapping(value="user/join", method=RequestMethod.GET)
	public String join(UserVO vo) {
		
		return "user/join";
	}
	
	@RequestMapping(value="user/join", method=RequestMethod.POST)
	public String join( HttpServletRequest request, UserVO vo) throws Exception {
		String address=vo.getAddress();

		vo.setJoin_date(new Date(System.currentTimeMillis()));
		//vo.setUser_mod_date(new Date(System.currentTimeMillis()));
		vo.setAddress(address);
		userService.insertUser(vo);
		
		return "redirect:/user/login";
	}
	
	@RequestMapping(value="/user/idcheck", method=RequestMethod.POST)
	@ResponseBody
	public int idCheck( HttpServletRequest request, String userid) {

		
		int count = userService.getUser(userid);
		
		return count;
	}
	
	@RequestMapping(value="/user/emailcheck", method=RequestMethod.POST)
	@ResponseBody
	public int emailCheck( HttpServletRequest request, String useremail) {

		int count = userService.getEmail(useremail);
		
		return count;
	}
}
