<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:if test="${empty goodsList}">
<div class="no-result">
	<h2 class="no-info">
		해당하는 상품이 존재하지 않습니다.
	</h2>
	<p class="no-text">다른 상품들을 구경해 보세요!</p>
</div>
</c:if>

<c:if test="${!empty goodsList}">
<div class="search-result">
	검색 결과 : <span>${goodsList.size()}</span>개
</div>
<div class="sort-area">
	<ul class="sort-list">
		<li class="data-sort"><a href="#" data-filter-name="sort"
			data-filter-value="code-desc">신규상품순</a></li>
		<li class="data-sort"><a href="#" data-filter-name="sort"
			data-filter-value="price-asc">낮은가격순</a></li>
		<li class="data-sort"><a href="#" data-filter-name="sort"
			data-filter-value="price-desc">높은가격순</a></li>
	</ul>
	<ul class="view-type">
		<li>
			<button class="list-view-btn">
				<i class="img-icon fa fa-list fa-lg"></i>
				<!-- <em>리스트형</em> -->
			</button>
		</li>
		<li>
			<button class="img-view-btn">
				<i class="img-icon fa fa-image fa-lg"></i>
				<!-- <em>이미지형</em> -->
			</button>
		</li>
	</ul>
</div>
<section class="goods-list img-view-type">
	<ul class="row">
		<c:forEach var="goods" items="${goodsList}">
			<li class="col-md-3" data-code="${goods.code}"
				data-category-code="${goods.categoryCode}"
				data-company="${goods.company}" data-price="${goods.price}">
				<div class="goods card">
					<div class="card-img-box">
						<a href="/goods/goods-view?gdsCode=${goods.code}" class="card-img">
							<img class="card-img-top" src="${path}/img/${goods.imgUrl}"
							alt="image cap">
						</a>
					</div>
					<div class="card-body">
						<div class="title">
							<a href="/goods/goods-view?gdsCode=${goods.code}">
								<h5>
									<c:if test="${goods.company != null}">
										<span class="text-company">[${goods.company}]&nbsp;</span>
									</c:if>
									${goods.name}
								</h5>
							</a>
						</div>
						<div class="price">
							<strong><fmt:formatNumber value="${goods.price}"
									pattern="#,###원" /></strong>
						</div>
						<div class="seller">
							<span>판매자 : </span> <span>${goods.sellerName}</span>
						</div>
						<div class="more-info">
							카테고리 : ${goods.categoryName}<br> 등록일 :
							<fmt:formatDate value="${goods.startDate}" pattern="yyyy.MM.dd" />
							<br>
						</div>
					</div>
				</div>
			</li>
		</c:forEach>
	</ul>
</section>
<nav class="pagination-box"></nav>
</c:if>