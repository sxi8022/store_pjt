package com.web.roseFinch.user.service;

import com.web.roseFinch.user.vo.UserVO;

public interface UserService {

	//유저 회원가입
	public void insertUser(UserVO vo);
	//유저 회원수정
	public void updateUser(UserVO vo);
	//유저 회원탈퇴
	public void deleteMember(UserVO vo);
	//유저 로그인
	public UserVO selectUser(UserVO vo);
	//유저 아이디 찾기
	public UserVO getUser(UserVO vo);
	
}
