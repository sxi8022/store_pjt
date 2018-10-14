<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.web.context.*, org.springframework.web.context.support.*"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<header class="container common-layout-header">
<div class="d-flex">
<h1 class="common-header-logo">
	<a href="${path}/main"><img src="img/rosefinch_logo.png" alt="RoseFinch"></a>
</h1>

<form class="flex-grow-1 common-header-search" name="" action="/goods/goods" method="get">
<fieldset>
<legend class="hide">상품 검색하기</legend>
	<input type="text" name="keyword" placeholder="검색어를 입력하세요.">
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
			<li><a href="${path}/user/login">장바구니</a></li>
			<li><a href="${path}/SellerLogin">판매자 로그인</a></li>
			<li><a href="${path}/cs-center/qna">고객센터</a></li>
		</c:if>
		<c:if test="${  user.user_id != null }">
			<sec:authorize var="adminPer" access="hasAuthority('ADMIN')" />
			<c:if test="${(user.rating eq 'admin' or user.rating eq 'ADMIN') && not adminPer}">
				<li><a href="${path}/admin/login">관리자 로그인</a></li>
			</c:if>
			<li><a href="${path}/user/logout">로그아웃</a></li>
			<li><a href="${path}/user/mypage">마이페이지</a></li>
			<li><a href="${path}/user/basket">장바구니</a></li>
			<li><a href="${path}/cs-center/qna">고객센터</a></li>
		</c:if>
	</ul>
</nav>



<div class="container common-layout-menu">
<div class="d-flex">
<section class="category-list dropdown common-all-menu">
	<%
		WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(application);
		pageContext.setAttribute("categoryListVO", wac.getBean("categoryListVO"));
	%>       
	<h2 class="hide">전체 메뉴</h2>
	<button class="dropdown-toggle btn-all-menu" aria-haspopup="true" aria-expanded="false">전체 메뉴</button>
	<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
		<c:forEach var="categoryDepth0" items="${categoryListVO.categoryDepth0}">
		<li class="dropdown dropright">
			<a class="dropdown-item" href="/goods/display?catCode=${categoryDepth0.catCode}" aria-haspopup="true" aria-expanded="false">
				${categoryDepth0.catName}
			</a>
			<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
				<c:set var="keyString">${categoryDepth0.catCode}</c:set>
				<c:forEach var="categoryDepth1" items="${categoryListVO.categoryDepth1[keyString]}">
				<li>	
					<a class="dropdown-item" href="/goods/display?catCode=${categoryDepth1.catCode}">
						${categoryDepth1.catName}
					</a>
				</li>
				</c:forEach>
	 		</ul>
		</li>
		</c:forEach>
	</ul>
</section>
<script type="text/javascript">
	$(".dropdown").hover(function(e) {
		$(this).children(".dropdown-menu").toggle();
	});
</script>                        

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