package com.web.roseFinch.user.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.roseFinch.user.vo.UserVO;

@Repository //현재 클래스를 스프링에서 관리하는 dao bean으로 등록
public class UserDAOImpl implements UserDAO{
	
	@Autowired
	private SqlSession mybatis;//mybatis 실행 객체

	@Override
	public void insertUser(UserVO vo) {
		mybatis.insert("userMapper.insertUser", vo);
	}

	@Override
	public void updateUser(UserVO vo) {
		mybatis.update("userMapper.updateUser", vo);
	}

	@Override
	public void deleteMember(UserVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public UserVO selectUser(UserVO vo) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("userMapper.selectUser",vo);
	}

	@Override
	public UserVO getUser(UserVO vo) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("userMapper.getUserr",vo);
	}

}
