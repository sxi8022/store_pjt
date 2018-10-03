package com.web.roseFinch.seller.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.web.roseFinch.seller.dao.SellerDAO;
import com.web.roseFinch.seller.vo.SellerVO;
import com.web.roseFinch.user.vo.UserVO;

@Service
public class SellerServiceImpl implements SellerService {
	
	@Inject
	private SellerDAO dao;
	
	@Override
	public List<SellerVO> selectMember() throws Exception {
		// TODO Auto-generated method stub
		return dao.selectMember();
	}
	
	@Override
	public SellerVO login(SellerVO dto) throws Exception {
		return dao.login(dto);
	}

	@Override
	public void insert(SellerVO vo) {
		String sel_id = vo.getSel_id();
		String sel_pwd = vo.getSel_pwd();
		vo.setSel_id(sel_id);
		vo.setSel_pwd(sel_pwd);
		dao.insert(vo);
	}


	
}
