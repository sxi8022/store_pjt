package com.web.roseFinch.seller.dao;

import java.util.List;

import com.web.roseFinch.seller.vo.SellerVO;
import com.web.roseFinch.user.vo.UserVO;

public interface SellerDAO {
	
	 public List<SellerVO> selectMember() throws Exception;

	 public SellerVO login(SellerVO vo) throws Exception;

	 public void insert(SellerVO vo);
}
