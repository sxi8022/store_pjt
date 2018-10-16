package com.web.rosefinch.seller.service;

import java.util.HashMap;
import java.util.List;

import com.web.rosefinch.seller.vo.SellerVO;
import com.web.rosefinch.user.vo.UserVO;

public interface SellerService {
	 public List<SellerVO> selectMember() throws Exception;
	 public SellerVO login(SellerVO dto) throws Exception;
	 public void insert(SellerVO vo);
	 public int idDuplChk(String selId);
}
