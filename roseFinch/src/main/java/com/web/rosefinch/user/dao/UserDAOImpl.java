package com.web.rosefinch.user.dao;

import java.util.HashMap;
import java.util.Map;

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
	public void deleteUser(String user_id) {
		mybatis.delete("userMapper.deleteUser",user_id);
		
	}

	@Override
	public UserVO selectUser(UserVO vo) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("userMapper.selectUser",vo);
	}

	@Override
	public int idCheck(String user_id) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("userMapper.idcheck", user_id);
	}

	@Override
	public int emailCheck(String email) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("userMapper.emailCheck",email);
	}

	@Override
	public boolean loginCheck(UserVO vo) {
		String name = mybatis.selectOne("userMapper.loginCheck",vo);
		return (name == null)?false:true;
	}

	@Override
	public UserVO viewUser(String user_id) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("userMapper.viewUser",user_id);
	}

	@Override
	public boolean checkPw(String user_id, String user_pwd) {
		boolean result = false;
		Map<String,String> map = new HashMap<String, String>();
		map.put("user_id", user_id);
		map.put("user_pwd", user_pwd);
		int count = mybatis.selectOne("userMapper.checkPw", map);
		if(count ==1) result=true;
		return result;
	}

}
