<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<script src="${path}/js/goods.js?v=<%=System.currentTimeMillis()%>"></script>
<main class="goods-list-container">
<div class="container">
	<h2 class="result-text">
		<c:if test="${keyword == null}">
		카테고리 검색 결과
		</c:if>
		<c:if test="${keyword != null}">
		'<span>${keyword}</span>'에 대한 검색 결과 입니다.
		</c:if>
	</h2>
	
	<c:if test="${keyword == null && empty goodsList}">
	<div class="no-result">
		<h2 class="no-info">
			해당하는 상품이 존재하지 않습니다.
		</h2>
		<p class="no-text">다른 상품들을 구경해 보세요!</p>
	</div>
	</c:if>
	
	<c:if test="${keyword != null && empty goodsList}">
	<div class="no-result">
		<h2 class="no-info">
			'<span>${keyword}</span>'에 대한 검색어 결과가 없습니다.
		</h2>
		<p class="no-text">정확한 검색어인지 확인하시고 다시 검색해 주세요.</p>
		<ul>
			<li><span>일시적으로 상품이 품절되었을 수 있습니다.</span></li>
			<li><span>단어의 철자가 정확한지 확인해 주세요.</span></li>
			<li><span>보다 일반적인 검색어로 다시 검색해 보세요.</span></li>
			<li><span>검색어의 띄어쓰기를 다르게 해보세요.</span></li>
		</ul>
	</div>
	</c:if>
	
	<c:if test="${!empty goodsList}">
	<section class="filter-box">
		<div class="filter">
			<table class="table table-bordered">
				<tr>
					<th scope="row">카테고리</th>
					<td colspan="5">
						<div class="category-filter">
							<div class="category-path-box">
								<a class="category-path filter-link" href="#" data-filter-name="cat-code" data-filter-value="0">전체보기</a>
								<c:forEach var="path" items="${categoryPath}">
								<span class="fas fa-chevron-right"></span>
								<a class="category-path filter-link" href="#" data-filter-name="cat-code" data-filter-value="${path.catCode}" title="${path.catName}">${path.catName}</a>
								</c:forEach>
							</div>
							<div class="category-box">
								<c:forEach var="filter" items="${subCategories}">
								<c:if test="${param.catCode eq filter.catCode}">
									<c:set var="on" value="on"/>
								</c:if>
								<c:if test="${param.catCode ne filter.catCode}">
									<c:set var="on" value=""/>
								</c:if>
								<a class="category filter-link ${on}" href="#" data-filter-name="cat-code" data-filter-value="${filter.catCode}" title="${filter.catName}">${filter.catName}</a>
								</c:forEach>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row">가격</th>
					<td colspan="5">
						<div class="price-range-box">
							<span class="price-range-text">직접입력</span> 
							<span class="price-range-input"><input id="min-price" type="text" title="최소가격입력">원</span> ~ 
							<span class="price-range-input"><input id="max-price" type="text" title="최대가격입력">원</span>
							<button class="price-range-btn" type="button">
								<i class="fa fa-search fa-xs"></i>
							</button>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row">브랜드</th>
					<td colspan="5">
						<div class="company-box">
							<c:forEach var="goods" items="${goodsList}">
							<a class="company filter-link" href="#" data-filter-name="company" data-filter-value="${goods.company}" title="${goods.company}">${goods.company}</a>						
							</c:forEach>
						</div> 
					</td>
				</tr>
				<tr>
					<td colspan="6">
						<div class="selected-filter-box">
							<a href="#" class="reset-selected-filter"><span class="fa fa-redo-alt"></span>전체해제</a> <span>|</span>
						</div>
					</td>
				</tr>
			</table>		
		</div>
	</section>
	</c:if>
	
	<c:if test="${!empty goodsList}">
		<div class="content-area">
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
									<img class="card-img-top" src="${path}/img/${goods.imgUrl}" alt="image cap">
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
									<strong><fmt:formatNumber value="${goods.price}" pattern="#,###원" /></strong>
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
		</div>
	</c:if>
</div>
</main>
<script type="text/javascript">
	$(function() {
		searchInit();
	});
</script>