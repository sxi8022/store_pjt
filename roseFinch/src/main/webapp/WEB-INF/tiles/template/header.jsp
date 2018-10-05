<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<header class="container common-layout-header">
<div class="d-flex">
<h1 class="common-header-logo">
	<a href="${path}/main"><img src="img/rosefinch_logo.png" alt="RoseFinch"></a>
</h1>

<form class="flex-grow-1 common-header-search" name="" action="" method="get">
<fieldset>
<legend class="hide">상품 검색하기</legend>
	<input type="text" name="searchKeyword" placeholder="검색어를 입력하세요.">
	<input type="submit" value="검색" class="btn-search">
</fieldset>
</form>

<!-- 광고 기능 추가 삽입 여부 확인 -->
<aside class="none">
add
</aside>

</div>
</header>



<nav class="common-fixed-nav">
	<ul class="nav fixed-nav-ul">
		<c:if test="${  user.user_id == null }">
			<li><a href="${path}/user/login">로그인</a></li>
			<li><a href="${path}/user/join">회원가입</a></li>
			<li><a href="${path}/user/basket">장바구니</a></li>
			<li><a href="${path}/SellerLogin">판매자 로그인</a></li>
			<li><a href="${path}/cs-center/qna">고객센터</a></li>
		</c:if>
		<c:if test="${  user.user_id != null }">
			<li><a href="${path}/user/logout">로그아웃</a></li>
			<li><a href="${path}/user/mypage">마이페이지</a></li>
			<li><a href="${path}/user/basket">장바구니</a></li>
			<li><a href="${path}/cs-center/qna">고객센터</a></li>
		</c:if>
	</ul>
</nav>



<div class="container common-layout-menu">
<div class="d-flex">
<section class="dropdown common-all-menu">
	<h2 class="hide">전체 메뉴</h2>
	<button type="button" class="btn-all-menu" data-toggle="dropdown">전체 메뉴</button>
	<nav class="dropdown-menu all-menu">
		<a class="dropdown-item" href="${path}/user/login">로그인</a>
		<a class="dropdown-item" href="#"> 카테고리 </a>
		<a class="dropdown-item" href="#"> 카테고리 </a>
		<a class="dropdown-item" href="#"> 카테고리 </a>
		<a class="dropdown-item" href="#"> 카테고리 </a>
	</nav>
</section>

<nav class="flex-grow-1 common-popular-menu">
	<ul class="nav">
		<li><a href="${path}/goods/goods/${categorie='상품'}">상품 카테고리</a></li>
		<li><a href="${path}/goods/goods/${categorie='도서'}">인기상품</a></li>
		<li><a href="${path}/goods/goods/${categorie='도서'}">신상품</a></li>
		<li><a href="${path}/goods/goods/${categorie='도서'}">티켓</a></li>
		<li><a href="${path}/goods/goods/${categorie='도서'}">중고상품</a></li>
		<li><a href="${path}/goods/goods/${categorie='도서'}">이벤트</a></li>
	</ul>
</nav>

<section class="common-search-lanking">
	<!-- 기능 미적용 -->
	<h2 class="hide">실시간 검색어</h2>
	<ul>
		<li><em>1</em> 우산</li>
		<li class="none"><em>2</em> 신발</li>
		<li class="none"><em>3</em> 장화</li>
	</ul>
</section>
</div>
</div>