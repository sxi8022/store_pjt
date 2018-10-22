package com.web.rosefinch.user.service;

import java.util.Map;

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
	public void deleteUser(String user_id) {
		userDao.deleteUser(user_id);
		
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
			session.setAttribute("user_id", vo2.getUser_id());
			session.setAttribute("name", vo.getName());
		}
		return result;
	}

	@Override
	public int idCheck(String user_id) {
		// TODO Auto-generated method stub
		return userDao.idCheck(user_id);
	}

	@Override
	public int emailCheck(String email) {
		// TODO Auto-generated method stub
		return userDao.emailCheck(email);
	}

	@Override
	public UserVO viewUser(String user_id) {
		
		return userDao.viewUser(user_id);
	}

	@Override
	public boolean checkPw(String user_id, String user_pwd) {
		return userDao.checkPw(user_id, user_pwd);
	}

}
