package com.web.rosefinch.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;


public class CustomAuthenticationSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {

	private SqlSession sess;
	
	public CustomAuthenticationSuccessHandler(SqlSession sess){
		this.sess = sess;
	}

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication auth) throws ServletException, IOException {
		response.sendRedirect("/admin/main");
		sess.update("com.web.rosefinch.mapper.AdminMapper.updateDateById", ((UserDetails)auth.getPrincipal()).getUsername());
		super.onAuthenticationSuccess(request, response, auth);
	}
}
