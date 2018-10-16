<!DOCTYPE html>
 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<html>
    <head>
        <meta charset="utf-8">
        <title>Welcome</title>
    </head> 
    <body>
<form role= "form" method = "post" action="loginProcess">
	<label>로그인</label>
	<input id="sel_id" name="sel_id" class="form-control">
	<input id="sel_pwd" type = "password" name = "sel_pwd" class="form-control">
	<button type = "submit" class="btn-btn-primary">로그인</button>

</form>
<form role= "form" method = "get" action="SellerJoin">
	<button type = "submit" class="btn-btn-primary">회원가입</button>
</form>
    </body>
</html>