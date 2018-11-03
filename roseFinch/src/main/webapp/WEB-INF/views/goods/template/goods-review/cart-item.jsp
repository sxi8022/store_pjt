<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<li class="cart-item">
	<div class="item-tit" data-optCode="${opt.optCode}" data-optname="${opt.optName}" data-optprice="${opt.optPrice}">
		<p class="tit">
			<span>${opt.optName}</span><span>${opt.optCnt}개 남음</span>
		</p>
		<button class="close-btn">
			<i class="fas fa-times"></i>
		</button>
	</div>
	<div class="item-ctrl">
		<div class="item-cnt">
			<c:if test="${opt.optCnt <= 1}">
				<button class="cnt-btn up-btn" disabled="disabled">+</button>
			</c:if>
			<c:if test="${opt.optCnt > 1}">
				<button class="cnt-btn up-btn">+</button>
			</c:if>
				<input class="cnt" value="1" maxlength="2" data-maxcnt="${opt.optCnt < 20 ? opt.optCnt : 20}"/>
				<button class="cnt-btn down-btn" disabled="disabled">-</button>
		</div>
		<div class="item-price">
			<strong class="rsltprice" data-price="${opt.optPrice}" data-rsltprice="${opt.optPrice}">
				<fmt:formatNumber value="${opt.optPrice}"/><span>원</span>
			</strong>
		</div>
	</div>
	<div>
		최대 ${opt.optCnt < 20 ? opt.optCnt : 20}개씩 주문 가능
	</div>
</li>