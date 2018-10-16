package com.web.rosefinch.seller.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.rosefinch.seller.dao.SellerDAO;
import com.web.rosefinch.seller.vo.SellerVO;

@Service
public class SellerServiceImpl implements SellerService {
	
	@Autowired
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

	@Override
	public int idDuplChk(String selId) {
		// TODO Auto-generated method stub
		return dao.idDuplChk(selId);
	}


	
}
