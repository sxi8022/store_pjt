<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<script src="${path}/js/rank.js?v=<%=System.currentTimeMillis()%>"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".category").on("click", function() {
			var catCode = $(this).children("a").data("code");
			ajaxRankGoodsList("${topic}", catCode);
			$(this).addClass("on").siblings().removeClass("on");
		});
		
		$(".category:first").trigger("click");
	});
</script>

<div class="container">
	<div class="content">
		<div class="inner">
			<div class="spot">
				<h3 class="title">${pageTitle}</h3>
				<p class="total-standard">
					
				</p>
			</div>
			<div class="category-tabs">
				<ul class="row">
					<li class="category">
						<a href="#" data-code="0">
							<div class="icon-box">
								<span class="icon fas fa-shopping-cart fa-2x"></span>
								<span class="text">전체메뉴</span>
							</div>
						</a>
					</li>
					<c:forEach var="category" items="${categoryList}">
					<li class="category">
						<a href="#" data-code="${category.catCode}">
							<div class="icon-box">
							<c:if test="${category.catName == '국내도서'}">
								<span class="icon fas fa-book fa-2x"></span>
							</c:if>
							<c:if test="${category.catName == '외국도서'}">
								<span class="icon fas fa-atlas fa-2x"></span>
							</c:if>
							<c:if test="${category.catName == 'EBOOK'}">
								<span class="icon fab fa-internet-explorer fa-2x"></span>
							</c:if>
							<c:if test="${category.catName == '영화'}">
								<span class="icon fas fa-video fa-2x"></span>
							</c:if>
							<c:if test="${category.catName == '공연'}">
								<span class="icon fas fa-ticket-alt fa-2x"></span>
							</c:if>
							<c:if test="${category.catName == '게임'}">
								<span class="icon fas fa-gamepad fa-2x"></span>
							</c:if>
							<c:if test="${category.catName == '음반'}">
								<span class="icon fas fa-music fa-2x"></span>
							</c:if>
								<span class="text">${category.catName}</span>
							</div>
						</a>
					</li>
					</c:forEach>
				</ul>
			</div>
			<div class="no-result">
				<h2 class="no-info">
					해당하는 상품이 존재하지 않습니다.
				</h2>
				<p class="no-text">다른 상품들을 구경해 보세요!</p>
			</div>
			<ul class="goods-list card-group row">
				
			</ul>
		</div>
	</div>
</div>