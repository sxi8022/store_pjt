package com.web.roseFinch.basket.dao;


import java.util.List;
import java.util.Map;

import com.web.roseFinch.basket.vo.BasketVO;

public interface BasketDAO {
	public List<BasketVO> readCart(Integer userCode);
	public void deleteCartItem(Map<String, Integer> pair);
	public void deleteAllCartItem(List<Map<String, Integer>> pairs);
	public void createFavItem(Map<String, Integer> pair);
}
