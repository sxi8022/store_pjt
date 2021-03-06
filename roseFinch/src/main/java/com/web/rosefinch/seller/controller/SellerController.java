package com.web.rosefinch.seller.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.rosefinch.seller.service.SellerService;
import com.web.rosefinch.seller.vo.SellerVO;

@Controller
public class SellerController {

	@Autowired
	private SellerService service;

	 @RequestMapping(value = "/seller/home", method = RequestMethod.GET)
	    public String home( Model model) throws Exception{

	        List<SellerVO> memberList = service.selectMember();

	        model.addAttribute("memberList", memberList);

	        return "seller/home";
	    }

	 // 메인 페이지 이동
	 	@GetMapping(value ="/SellerMain")
	 	public String sellerMain() {
	 		return "seller/seller-dashboard";
	 	}

	 // 회원가입 폼을 띄우는 부분
	 	@RequestMapping(value="/SellerJoin",method=RequestMethod.GET)
	 	public String joinForm(){
	 		return "seller/seller-join"; // /login/loginForm.jsp를 띄움.
	 	}// end of loginForm

	 	//ajax id 유효성검사
	 	@RequestMapping(value = "/idDuplChk", method = { RequestMethod.GET, RequestMethod.POST})
	 	public @ResponseBody String idDuplChk(@ModelAttribute("seller") SellerVO seller , Model model) {
	 		int result = service.idDuplChk(seller.getSel_id());
	 	    return String.valueOf(result);
	 	}//
	 		
	 		
	 		
	 	// 회원가입 프로세스
 		@RequestMapping(value="/joinProcess", method=RequestMethod.POST)
 		public String insert(@ModelAttribute SellerVO vo) throws Exception {

 			service.insert(vo);

 			return "redirect:/SellerMain";
 		}

		// 로그인 폼을 띄우는 부분
		@RequestMapping(value="/SellerLogin",method=RequestMethod.GET)
		public String loginForm(){
			return "seller/seller-login"; // /login/loginForm.jsp를 띄움.
		}// end of loginForm

		// 로그인 처리하는 부분
		@RequestMapping(value="/loginProcess",method=RequestMethod.POST)
		public String loginProcess(HttpSession session,SellerVO dto, HttpServletResponse response) throws Exception{
			String returnURL = "";
			if ( session.getAttribute("login") != null ){
				// 기존에 login이란 세션 값이 존재한다면
				session.removeAttribute("login"); // 기존값을 제거해 준다.
			}

			// 로그인이 성공하면 UserVO 객체를 반환함.
			SellerVO vo = service.login(dto);

			if ( vo != null ){ // 로그인 성공
				session.setAttribute("login", vo); // 세션에 login인이란 이름으로 UserVO 객체를 저장해 놈.
				returnURL = "redirect:/SellerMain";}
			// 로그인 성공시 게시글 목록페이지로 바로 이동하도록 하고
				else {
				returnURL = "redirect:/SellerLogin";
				}
			return returnURL; // 위에서 설정한 returnURL 을 반환해서 이동시킴
		}




}
