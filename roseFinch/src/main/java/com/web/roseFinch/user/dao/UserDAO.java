package com.web.roseFinch.user.dao;

import com.web.roseFinch.user.vo.UserVO;

public interface UserDAO {

	//유저 회원가입
		public void insertUser(UserVO vo);
		//유저 회원수정
		public void updateUser(UserVO vo);
		//유저 회원탈퇴
		public void deleteMember(UserVO vo);
		//유저 로그인
		public UserVO selectUser(UserVO vo);
		//유저 아이디 중복
		public int idcheck(String userid);
		//유저 이메일 중복
		public int emailCheck(String useremail);
	
}
