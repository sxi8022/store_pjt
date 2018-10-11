package com.web.rosefinch.seller.dao;

import java.util.List;

import com.web.rosefinch.seller.vo.SellerVO;
import com.web.rosefinch.user.vo.UserVO;

public interface SellerDAO {

	 public List<SellerVO> selectMember() throws Exception;

	 public SellerVO login(SellerVO vo) throws Exception;

	 public void insert(SellerVO vo);


}
