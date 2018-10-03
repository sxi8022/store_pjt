package com.web.roseFinch.seller.service;

import java.util.HashMap;
import java.util.List;

import com.web.roseFinch.seller.vo.SellerVO;
import com.web.roseFinch.user.vo.UserVO;

public interface SellerService {
	 public List<SellerVO> selectMember() throws Exception;
	 public SellerVO login(SellerVO dto) throws Exception;
	 public void insert(SellerVO vo);
}
