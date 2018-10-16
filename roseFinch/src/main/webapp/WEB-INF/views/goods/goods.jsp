<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<script defer src="${path}/js/goods.js?v=<%=System.currentTimeMillis()%>"></script>
<main class="goods-list-container">
	<div class="container">
		<h2 class="resultTxt">
			'<span>${keyword}</span>'에 대한 검색 결과 입니다.
		</h2>
		<c:if test="${!empty goodsList}">
		<section class="goods-category">
			<ul class="row">
				<li class="col-md-3">
					카테고리
				</li>
				<li class="col-md-9">
					<div class="finder-list">
						<div id="summaryCategoryBack">
							<a class="category-back" href="#" data-filter-name="cat-code" data-filter-value="1">전체보기</a>
						</div>
						<div id="category-list">
						<c:forEach var="filter" items="${categoryFilter}">
							<a class="category" href="#"
							data-filter-name="cat-code" 
							data-filter-value="${filter.catCode}"
							>${filter.catName}</a>	
						</c:forEach>
						</div>
					</div>
				</li>
			</ul>
			<ul class="row">
				<li class="col-md-3">
					가격
				</li>
				<li class="col-md-9">
					<div class="price-range">
						<span class="range-text">직접입력</span>
						<span class="range-input"><input id="min-price" type="text" title="최소가격입력">원</span>
						 ~
						<span class="range-input"><input id="max-price" type="text" title="최대가격입력">원</span>
						<button class="range-input-btn" type="button">
							<i class="fa fa-search fa-xs"></i>
						</button>
					</div>
				</li>
			</ul>
			<ul class="row">
				<li class="col-md-3">
					브랜드
				</li>
				<li class="col-md-9">
					<div class="finder-list">
						<c:forEach var="filter" items="${companyFilter}">
						<a class="company" href="#" 
						data-filter-name="company" 
						data-filter-value="${filter}"
						>${filter}</a>	
					</c:forEach>
					</div>
				</li>
			</ul>
			<ul class="row" id="selectedFilterArea">
				<li class="col-md-12">
					<a href="#" class="resetFilter"><span class="fa fa-redo-alt"></span>전체해제</a>
					<span>|</span>
				</li>
			</ul>
		</section>
		</c:if>
		<div class="noResult">
			<h2 class="noInfo">
				'<span>${keyword}</span>'에 대한 검색어 결과가 없습니다.
			</h2>
			<p class="noText">정확한 검색어인지 확인하시고 다시 검색해 주세요.</p>
			<ul>
				<li><span>일시적으로 상품이 품절되었을 수 있습니다.</span></li>
				<li><span>단어의 철자가 정확한지 확인해 주세요.</span></li>
				<li><span>보다 일반적인 검색어로 다시 검색해 보세요.</span></li>
				<li><span>검색어의 띄어쓰기를 다르게 해보세요.</span></li>
			</ul>		
		</div>
		<c:if test="${!empty goodsList}">
		<div id="contentArea">
			<div class="search-result row">
				검색 결과 :
				<span>${goodsList.size()}</span>개
			</div>
			<div class="sort-area row">
				<ul class="sort-list">
					<li class="data-sort">
						<a href="#"
						data-filter-name="sort"
						data-filter-value="code-desc"
						>신규상품순</a>
					</li>
					<li class="data-sort">
						<a href="#"
						data-filter-name="sort"
						data-filter-value="price-asc"
						>낮은가격순</a>
					</li>
					<li class="data-sort">
						<a href="#"
						data-filter-name="sort"
						data-filter-value="price-desc"
						>높은가격순</a>
					</li>
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
	 				<li class="col-md-3 goods"
	 				data-code="${goods.code}"
	 				data-category-code="${goods.categoryCode}"
	 				data-company="${goods.company}"
	 				data-price="${goods.price}">
					  <div class="card">
					  	<div class="card-img-box">
					  		<a href="/goods/goods-view?gdsCode=${goods.code}" class="card-img">
					  			<img class="card-img-top" src="${path}/img/${goods.imgUrl}" alt="Card image cap">
					  		</a>
					  	</div>
					    <div class="card-body">
							<div>
								<a href="/goods/goods-view?gdsCode=${goods.code}">
									<h5 class="text-title">
										<c:if test="${goods.company != null}">
										<span class="text-company">[${goods.company}]&nbsp;</span> 
										</c:if>
										${goods.name}
									</h5>
								</a>
								<div class="more-info">
									카테고리 : ${goods.categoryName}<br>
									등록일 : <fmt:formatDate value="${goods.startDate}" pattern="yyyy.MM.dd"/><br>
								</div>
							</div>
							<div>
					      		<strong><fmt:formatNumber value="${goods.price}" pattern="#,###원"/></strong>
					      	</div>
					      	<div>
					      		<span>판매자 : </span>
					      		<span>${goods.sellerName}</span>					      
					      	</div>
					    </div>
					  </div>  
					</li>
					</c:forEach>
				</ul>
			</section>
			<nav class="pagination-container" arial-label="Page navigation example"></nav>
		</div>
		</c:if>
	</div>
</main>
