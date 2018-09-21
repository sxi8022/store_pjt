<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<header class="common-layout-header">
<h1 class="logo">
	<a href="main"><img src="http://via.placeholder.com/200x50" alt="RoseFinch"></a>
</h1>

<nav class="side-nav">
	<ul>
		<li><a href="${path}/user/login">로그인</a></li>
		<li><a href="/user/join">회원가입</a></li>
		<li><a href="/user/basket">장바구니</a></li>
		<li><a href="${path}/user/mypage">마이페이지</a></li>
		<li><a href="${path}/cs-center/qna">고객센터</a></li>
	</ul>
</nav>

</header>