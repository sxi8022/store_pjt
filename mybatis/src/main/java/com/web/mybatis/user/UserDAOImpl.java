package com.web.mybatis.user;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAOImpl implements UserDAO{

	@Autowired
	private SqlSession sqlSeesion;
	
	@Override
	public void insert(UserVO vo) {
		sqlSeesion.insert("mapper_user.insert", vo);
		
	}
	
}
