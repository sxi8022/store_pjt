package com.web.rosefinch.user.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

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
	public void deleteUser(String userId) {
		userDao.deleteUser(userId);
		
	}

	@Override
	public UserVO selectUser(UserVO vo) {
		// TODO Auto-generated method stub
		return userDao.selectUser(vo);
	}
	
	@Override
	public boolean loginCheck(UserVO vo, HttpSession session) {
		boolean result = userDao.loginCheck(vo);
		if(result) { //true일 경우 세션에 등록
			UserVO vo2 = selectUser(vo);
			//세션 변수 등록
			session.setAttribute("userId", vo2.getUserId());
			session.setAttribute("name", vo2.getName());
		}
		return result;
	}

	@Override
	public int idCheck(String userId) {
		// TODO Auto-generated method stub
		return userDao.idCheck(userId);
	}

	@Override
	public int emailCheck(String email) {
		// TODO Auto-generated method stub
		return userDao.emailCheck(email);
	}

	@Override
	public UserVO viewUser(String userId) {
		
		return userDao.viewUser(userId);
	}

	@Override
	public boolean checkPw(String userId, String userPwd) {
		return userDao.checkPw(userId, userPwd);
	}

}
