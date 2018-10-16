<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath }" />

<div class="admin-login-container">

<div class="admin-login-header">관리자 로그인</div>
<c:if test="${!empty error}">
	<c:choose>
	<c:when test="${error eq 'access'}">
		<div class="alert alert-danger" role="alert">
 			권한이 없습니다!
		</div>
	</c:when>
	<c:otherwise>
		<div class="alert alert-warning" role="alert">
 			일치하는 아이디 또는 비밀번호가 없습니다!
		</div>
	</c:otherwise>
	</c:choose>
</c:if>

<form action="/admin/login" method="post">

  <div class="form-group">
    <label for="exampleInputEmail1">Id</label>
    <input type="text" name="username" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Id">
  </div>
 
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
 
  <input type="submit" name="submit" value="Login" class="btn btn-primary"></input>
  
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

</form>

</div>

<style>
	.admin-login-container{
		height: 100vh;
		margin: auto;
		width: 50%;
		margin-bottom: 50px;
	}
	.admin-login-header{
		border-left: 5px solid #fd5489;
		font-weight: bold;
		font-size: 30px;
		color: #fd5489;
		margin-top: 50px;
		margin-bottom: 50px;
		padding-left: 20px;
		height: 40px;
	}
</style>