package com.web.rosefinch.basket.service;

import java.util.List;
import java.util.Map;

import com.web.rosefinch.basket.vo.BasketVO;

public interface BasketService {
	public List<BasketVO> getCart(Integer userCode);
	public void removeBasketItem(Map<String, Integer> pair);
	public void removeAllBasketItem(List<Map<String, Integer>> pairs);
	public void addFavItem(Map<String, Integer> pair);
}
