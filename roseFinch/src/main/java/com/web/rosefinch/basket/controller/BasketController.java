package com.web.rosefinch.basket.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.rosefinch.basket.service.BasketService;
import com.web.rosefinch.basket.vo.BasketVO;
import com.web.rosefinch.user.vo.UserVO;

@Controller
@RequestMapping("user/basket")
public class BasketController {
	private static Logger logger = LoggerFactory.getLogger(BasketController.class);
	
	@Autowired
	private BasketService serv;
	
	public static final int ALL_ITEM = -1;
	
	@GetMapping()
	public String showBasket(Model model, HttpSession sess){
		try{
			UserVO user = (UserVO)sess.getAttribute("user");
			if(sess.getAttribute("user") == null){
				return "redirect:/user/login";
			}
			List<BasketVO> list = serv.getCart(user.getUserCode());
			if(list.isEmpty()) model.addAttribute("itemNum", 0);
			else model.addAttribute("itemNum", list.size());
			model.addAttribute("itemList", list);
		}catch(Exception e){
			e.printStackTrace();
			return "redirect:/main";
		}
		return "basket/basket";
	}
	
	@PostMapping()
	@ResponseBody
	public ResponseEntity<Void> removeBasketItem(@RequestBody List<Map<String, Integer>> map){
		for(Map<String, Integer> pair : map){
			System.out.println(pair.toString());
		}
		serv.removeAllBasketItem(map);
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	@PostMapping("/fav")
	@ResponseBody
	public ResponseEntity<Void> addFavItem(@RequestBody Map<String, Integer> map){

		serv.addFavItem(map);
		return new ResponseEntity<>(HttpStatus.OK);
	}
}
