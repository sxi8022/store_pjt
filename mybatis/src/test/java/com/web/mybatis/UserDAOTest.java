package com.web.mybatis;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.web.mybatis.user.UserDAO;
import com.web.mybatis.user.UserVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:root-context.xml"})
public class UserDAOTest {

	@Autowired
	private UserDAO dao;
	
	@Test
	public void testInsert() throws Exception {
		UserVO vo = new UserVO("user","1234","user","user@user");
		
		dao.insert(vo);
	}

}
