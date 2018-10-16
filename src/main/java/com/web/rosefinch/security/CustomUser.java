package com.web.rosefinch.security;

import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.web.rosefinch.admin.vo.AdminVO;

public class CustomUser extends User {
	
	private static final long serialVersionUID = 1L;
	
	private AdminVO admin;

	public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}
	
	public CustomUser(AdminVO vo, List<SimpleGrantedAuthority> auths){
		super(vo.getAdId(), vo.getAdPwd(), auths);
		this.admin = vo;
	}

}
