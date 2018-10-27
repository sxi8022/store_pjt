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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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

		vo.setJoinDate(new Date(System.currentTimeMillis()));
		//vo.setUser_mod_date(new Date(System.currentTimeMillis()));
		vo.setAddress(address);
		userService.insertUser(vo);

		return "redirect:/user/login";
	}

	//ajax id 유효성검사
 	@RequestMapping(value = "user/idcheck", method = { RequestMethod.GET, RequestMethod.POST})
 	public @ResponseBody String idCheck(@ModelAttribute("user") UserVO user , Model model) {
 		int result = userService.idCheck(user.getUserId());
 	    return String.valueOf(result);
 	}

 	//ajax email 유효성검사
 	 	@RequestMapping(value = "user/emailcheck", method = { RequestMethod.GET, RequestMethod.POST})
 	 	public @ResponseBody String emailcheck(@ModelAttribute("user") UserVO user , Model model) {
 	 		int result = userService.emailCheck(user.getEmail());
 	 	    return String.valueOf(result);
 	 	}

	//회원 상세정보 조회
	@RequestMapping(value="user/view")
	public String viewUser( String userId, HttpSession session, Model model) {
		//회원 정보를 model에 저장
		UserVO vo = (UserVO) session.getAttribute("userId");
		UserVO user = userService.selectUser(vo);
		model.addAttribute("user",user);
		//session.setAttribute("user",userService.viewUser(userId));
		logger.info("클릭한 아이디:"+ userId);
		return "user/view";
	}
	
	//회원 정보 수정 처리
	@RequestMapping(value="user/update")
	public String userUpdate(@ModelAttribute UserVO vo,Model model, HttpSession session) {
		boolean result = userService.checkPw(vo.getUserId(), vo.getUserPwd());
		if(result) { //비밀번호가 일치하면 수정 처리후,전체 회원 목록으로 리다이렉트
			userService.updateUser(vo);
			session.setAttribute("user", vo);
			return "redirect:/main";
		}else {
			UserVO vo2 = userService.viewUser(vo.getUserId());
			vo.setJoinDate(vo2.getJoinDate());
			vo.setUserModDate(vo2.getUserModDate());
			model.addAttribute("user",vo);
			model.addAttribute("message","비밀번호 불일치");
			return "user/view";
		}
	}
	
//	@RequestMapping(value="/user/update", method=RequestMethod.GET)
//	public String update(HttpSession session, Model model) {
//		
//		UserVO user = (UserVO) session.getAttribute("user");		
//		UserVO mvo = userService.selectUser(user);
//
//		model.addAttribute("mvo", mvo);
//		
//		return "/user/update";
//	}
//	@RequestMapping(value="/user/update", method=RequestMethod.POST)
//	public String update(UserVO vo) {
//		
//		userService.updateUser(vo);
//		
//		return "redirect:/";
//	}

	@RequestMapping(value="user/delete")
	public String userDelete(@RequestParam String userId,HttpSession session, @RequestParam String userPwd,Model model) {
		boolean result = userService.checkPw(userId, userPwd);
		if(result) { //비밀번호가 일치하면 수정 처리후,전체 회원 목록으로 리다이렉트
			userService.deleteUser(userId);
			session.removeAttribute("user"); // 기존값을 제거해 준다.
			return "redirect:/main";
		}else {
			model.addAttribute("user",userService.viewUser(userId));
			model.addAttribute("message","비밀번호 불일치");
			return "user/view";
		}
	}
}
