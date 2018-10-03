package com.web.roseFinch.seller.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.web.roseFinch.seller.vo.SellerVO;
import com.web.roseFinch.user.vo.UserVO;

@Repository
public class SellerDAOImpl implements SellerDAO {
	
	@Inject
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
