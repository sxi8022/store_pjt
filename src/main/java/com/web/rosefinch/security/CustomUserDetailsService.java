package com.web.rosefinch.security;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.web.rosefinch.admin.vo.AdminVO;

public class CustomUserDetailsService implements UserDetailsService {

	private static Logger logger = LoggerFactory.getLogger(CustomUserDetailsService.class);

	private SqlSession sess;
	
	public CustomUserDetailsService(SqlSession sess){
		this.sess = sess;
	}
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		AdminVO vo = sess.selectOne("com.web.rosefinch.mapper.AdminMapper.readAdminById", username);
		
		ArrayList<SimpleGrantedAuthority> authList = new ArrayList<>();
		authList.add(new SimpleGrantedAuthority("ADMIN"));
		
		String auth = null;
		try{
			auth = vo.getAdAuth();
		}catch(NullPointerException e){
			logger.info("ADMIN ?��?�� 권한?�� �?�?�? ?���? ?��?��");
		}
		if(auth != null){
			authList.add(new SimpleGrantedAuthority(auth.toUpperCase()));
		}
		
		CustomUser user = new CustomUser(vo, authList);
		return user;
	}
}