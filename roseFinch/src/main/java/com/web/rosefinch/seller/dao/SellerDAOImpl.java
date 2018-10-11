package com.web.rosefinch.seller.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.rosefinch.seller.vo.SellerVO;

@Repository
public class SellerDAOImpl implements SellerDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	private static final String Namespace = "classpath:mappers/**/sellerMapper";

	
	@Override
    public List<SellerVO> selectMember() throws Exception {
 
        return sqlSession.selectList(Namespace+".selectMember");
    }

	// Mapper의 로그인에 관여 vo 객체전달
	@Override
	public SellerVO login(SellerVO vo) {
		// Mapper의 namespace명.id : 자신에게 맞게 작성해서 넣는다.
		
		return sqlSession.selectOne(Namespace + ".login", vo);
	}


	@Override
	public void insert(SellerVO vo) {
		sqlSession.insert(Namespace + ".insert", vo);
	}
	
		
}
