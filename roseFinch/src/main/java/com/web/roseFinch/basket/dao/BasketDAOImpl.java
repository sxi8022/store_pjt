package com.web.roseFinch.basket.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.roseFinch.basket.vo.BasketVO;

@Repository
public class BasketDAOImpl implements BasketDAO{

	@Autowired
	private SqlSession sess;
	
	private static final String namespace="com.web.roseFinch.mapper.BasketMapper";
	
	@Override
	public List<BasketVO> readCart(Integer userCode) {
		return sess.selectList(namespace+".readCart", userCode);
	}
	
	
	@Override
	public void deleteCartItem(Map<String, Integer> pair) {
		sess.delete(namespace+".deleteCartItem", pair);
	}

	@Override
	public void deleteAllCartItem(List<Map<String, Integer>> pairs) {
		for(Map<String, Integer> pair : pairs){
			sess.delete(namespace+".deleteCartItem", pair);
		}	
	}

	@Override
	public void createFavItem(Map<String, Integer> pair) {
		sess.insert(namespace+".createFavItem", pair);
	}
	
	
	
}
