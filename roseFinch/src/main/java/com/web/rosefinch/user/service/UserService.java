package com.web.rosefinch.user.service;

import javax.servlet.http.HttpSession;

import com.web.rosefinch.user.vo.UserVO;

public interface UserService {

	//유저 회원가입
	public void insertUser(UserVO vo);
	//유저 회원수정
	public void updateUser(UserVO vo);
	//유저 회원탈퇴
	public void deleteUser(String user_id);
	//유저 로그인
	public UserVO selectUser(UserVO vo);
	//유저 로그인 체크
	public boolean loginCheck(UserVO vo,HttpSession session);
	//회원 상세 조희
	public UserVO viewUser(String user_id);
	//유저 아이디 중복
	public int getUser(String userid);
	//유저 이메일 중복
	public int getEmail(String useremail);
	//회원 정보 수정 및 삭제를 위한 비밀번호 체크
	public boolean checkPw(String user_id, String user_pwd);
	
}
