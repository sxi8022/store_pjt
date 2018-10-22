package com.web.rosefinch.user.dao;

import com.web.rosefinch.user.vo.UserVO;

public interface UserDAO {

	//유저 회원가입
		public void insertUser(UserVO vo);
		//유저 회원수정
		public void updateUser(UserVO vo);
		//유저 회원탈퇴
		public void deleteUser(String user_id);
		//유저 로그인
		public UserVO selectUser(UserVO vo);
		//유저 아이디 중복
		public int idCheck(String user_id);
		//유저 이메일 중복
		public int emailCheck(String email);
		public boolean loginCheck(UserVO vo);
		public UserVO viewUser(String user_id);
		
		public boolean checkPw(String user_id, String user_pwd);
	
}
