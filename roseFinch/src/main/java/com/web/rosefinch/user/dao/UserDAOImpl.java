package com.web.rosefinch.user.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.web.rosefinch.user.vo.UserVO;

@Repository //현재 클래스를 스프링에서 관리하는 dao bean으로 등록
public class UserDAOImpl implements UserDAO{
	
	@Inject
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
	public int idcheck(String userid) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("userMapper.idcheck", userid);
	}

	@Override
	public int emailCheck(String useremail) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("userMapper.emailcheck",useremail);
	}

}