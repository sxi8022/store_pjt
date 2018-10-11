package com.web.rosefinch.basket.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.rosefinch.basket.dao.BasketDAO;
import com.web.rosefinch.basket.vo.BasketVO;

@Service
public class BasketServiceImpl implements BasketService  {

	@Autowired
	private BasketDAO dao;
	
	@Override
	public List<BasketVO> getCart(Integer userCode) {
		return dao.readCart(userCode);
	}

	@Override
	public void removeBasketItem(Map<String, Integer> pair) {
		dao.deleteCartItem(pair);
	}

	@Override
	public void removeAllBasketItem(List<Map<String, Integer>> pairs) {
		dao.deleteAllCartItem(pairs);
	}

	@Override
	public void addFavItem(Map<String, Integer> pair) {
		dao.createFavItem(pair);
	}
}
