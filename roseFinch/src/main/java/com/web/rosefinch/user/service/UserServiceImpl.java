package com.web.rosefinch.user.service;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.web.rosefinch.user.dao.UserDAO;
import com.web.rosefinch.user.vo.UserVO;

@Service //현재 클래스를 스프링에서 관리하는 dao bean으로 등록
public class UserServiceImpl implements UserService{
	
	@Inject
	private UserDAO userDao;

	@Override
	public void insertUser(UserVO vo) {
		userDao.insertUser(vo);
	}

	@Override
	public void updateUser(UserVO vo) {
		userDao.updateUser(vo);
	}

	@Override
	public void deleteMember(UserVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public UserVO selectUser(UserVO vo) {
		// TODO Auto-generated method stub
		return userDao.selectUser(vo);
	}

	@Override
	public int getUser(String userid) {
		// TODO Auto-generated method stub
		return userDao.idcheck(userid);
	}

	@Override
	public int getEmail(String useremail) {
		// TODO Auto-generated method stub
		return userDao.emailCheck(useremail);
	}

}
