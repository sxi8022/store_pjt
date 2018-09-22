<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<header class="container common-layout-header">
<div class="d-flex">
<h1 class="p-3 common-header-logo">
	<a href="${path}/main"><img src="http://via.placeholder.com/220x50" alt="RoseFinch"></a>
</h1>

<form class="p-3 flex-grow-1 common-header-search" name="" action="" method="get">
<fieldset>
<legend class="hide">상품 검색하기</legend>
	<input type="text" name="searchKeyword" placeholder="검색어를 입력하세요.">
	<input type="submit" value="검색" class="btn-search">
</fieldset>
</form>

<!-- 광고 삽입 기능 -->
</div>
</header>



<nav class="common-fixed-nav">
	<ul class="nav fixed-nav-ul">
		<li><a href="${path}/user/login">로그인</a></li>
		<li><a href="/user/join">회원가입</a></li>
		<li><a href="/user/basket">장바구니</a></li>
		<li><a href="${path}/cs-center/qna">고객센터</a></li>
		
		<!-- 
		메뉴가 4개 이상이면 모바일 버전에서 두 줄 처리됨
		로그인시 보여질 메뉴
		<li><a href="">로그아웃</a></li>
		<li><a href="${path}/user/mypage">마이페이지</a></li>
		<li><a href="/user/basket">장바구니</a></li>
		<li><a href="${path}/cs-center/qna">고객센터</a></li>
		 -->
	</ul>
</nav>



<div class="container">
<nav class="">
	<ul class="nav">
		<li><a href="${path}/goods/goods/${categorie='상품'}">상품 카테고리</a></li>
		<li><a href="${path}/goods/goods/${categorie='도서'}">도서</a></li>
		<li><a href="${path}/goods/goods/${categorie='도서'}">도서</a></li>
		<li><a href="${path}/goods/goods/${categorie='도서'}">도서</a></li>
		<li><a href="${path}/goods/goods/${categorie='도서'}">도서</a></li>
	</ul>
</nav>
</div>
