<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- 
- 카테고리
- 옵션 정렬
- 장바구니
- sticky
- scrollspy
- review sql limit

- css 정리
- js
 -->

<script src="${path}/js/goods-view.js?v=<%=System.currentTimeMillis()%>"></script>
<section class="container common-layout-sub">
	<section class="cat-locs">
		<ul>
			<li>
				<a class="locs-menu" href="/main">홈</a>
			</li>
			<c:forEach var="loc" items="${catLocs}">
			<li class="dropdown">
				<span class="icon fas fa-chevron-right"></span>
				<a class="locs-menu dropdown-toggle" data-toggle="dropdown">${loc.key}</a>
				
				<div class="locs-cont dropdown-menu">
					<div class="cont-wrap">
						<c:forEach items="${loc.value}" begin="0" step="10" varStatus="status">
						<ul class="cont">
							<c:forEach var="cont" items="${loc.value}" begin="${status.index}" end="${status.index + 9}" step="1">
							<li>
								<a class="dropdown-item" href="/search/category?catCode=${cont.catCode}">${cont.catName}</a>
							</li>
							</c:forEach>
						</ul>
						</c:forEach>
					</div>
				</div>
			</li>
			</c:forEach>
		</ul>
	</section>

	<!-- 상품 요약 정보 -->
	<section class="deal-summary">
		<div class="deal-gallery">
			<ul>
				<li>
					<img src="/img/${goodImg[0].gdsImgUrl}" alt="상품이미지1" />
				</li>
			</ul>
		</div>
		
		<div class="deal-topinfo">
			<div class="deal-title">
				<div class="deal-selname" data-selname="${seller.selName}">
					판매자 : ${seller.selName}
				</div>
				<div class="deal-gdsname" data-gdsname="${good.gdsName}">
					<span>
						<c:if test="${!empty good.gdsCompany}">
							[${good.gdsCompany}]
						</c:if>
					</span> 
					<span>${good.gdsName}</span>
				</div>
			</div>
			<div class="deal-price wrap">
				<span class="deal-info-sub">
					판매가격
				</span>
				<div class="deal-info-value">
					<span><fmt:formatNumber value="${good.gdsPrice}"/>원</span>
				</div>
			</div>
			<div class="deal-delivery wrap">
				<span class="deal-info-sub">
					배송비
				</span>
				<div class="deal-info-value" data-gdsdev="4000">
					<span>착불/4,000원</span>
				</div>
			</div>
			<div class="deal-summary-info wrap">
				<span class="deal-info-sub">
					상품요약정보
				</span>
				<div class="deal-info-value">
					<c:if test="${!empty good.gdsMadeby}">
					<div>저자 : ${good.gdsMadeby}</div>
					</c:if>
					<div>브랜드 : ${good.gdsCompany}</div>
					<div>남은수량 : ${good.gdsCnt}개</div>
				</div>
			</div>
			<div class="deal-opts-wrap">
				<c:if test="${!empty goodOptGrps}">
				<div class="deal-opts">
					<span class="deal-info-sub">
						옵션
					</span>
					<div class="opt-wrap">
						<c:forEach var="optGrp" items="${goodOptGrps}">
						<div class="opt">
							<a class="opt-tit" href="#">${optGrp.key}</a>
							<ul class="opt-items">
								<c:forEach var="opt" items="${optGrp.value}">
								<li class="opt-item">
									<a class="opt-link" data-optCode="${opt.optCode}" href="#">
										${opt.optName} _
										<c:if test="${opt.optPrice != 0}">
										${opt.optPrice}원 _  
										</c:if> 
										(${opt.optCnt}개 남음)
									</a>
								</li>
								</c:forEach>
							</ul>
						</div>
						</c:forEach>
					</div>
					<ul class="deal-prch-cart"></ul>
				</div>
				</c:if>
			</div>
			
			
			
			<div class="deal-purchase">
				<div class="wrap deal-tot-pur">
					<span class="deal-info-sub">
						총 상품금액
					</span>
					<div class="tot-price">
						<span>0</span>원
					</div>
				</div>
				<div class="wrap-deal-btn">
					<ul class="deal-btn">
						<li>
							<button class="btn pur-btn">바로구매</button>
						</li>
						<li>
							<button class="btn btn-secondary">장바구니</button>
						</li>
						<li>
							<button class="btn btn-secondary">즐겨찾기</button>								
						</li>														
					</ul>
				</div>
			</div>
		</div>
	</section>

	<section class="v_sec_tabs">
		<table style="text-align:center; margin-bottom:0;" class="table table-dark">
			<thead>
				<tr>
					<th><input type="button" value="상품상세" style="color: white; font-weight: 600;"></th>
					<th><input type="button" value="상품평(${revNum})" style="color: white; font-weight: 600;"></th>
					<th><input type="button" value="상품문의" style="color: white; font-weight: 600;"></th>
					<th><input type="button" value="배송/교환/반품 안내" style="color: white; font-weight: 600;"></th>
				</tr>
			</thead>
		</table>
	</section>	
	
	<section class="deal-content">
		<section class="v_sec_detail" style="text-align:center; margin-bottom:50px;">
			<div>${good.gdsDesc}</div>
			<c:forEach begin="2" end="${goodImgNum}" varStatus="idx">
			<img src="/img/${goodImg[idx.count].gdsImgUrl}">
			</c:forEach>
		</section>
		
		<section class="v_sec_rev" style="margin-bottom:50px;">
			<div style="border-bottom: 1px solid black; padding-bottom:15px;">
				<span class="title">상품평</span>
				<hr>
				<select style="float:right; width: 150px">
					<option>베스트순</option>
					<option>최신순</option>
				</select> 
			</div>
			
			<c:forEach var="rev" items="${goodReviews}">
			<div style="border-bottom: 1px solid lightgrey; padding-bottom: 15px;">
				<div style="display:flex; margin-top:15px; justify-content:space-between">
					<div style="display:flex;">
						<div style="color:yellow;">☆☆☆☆☆</div>
						<div style="color:yellow; position:relative; left:-70px; width:${rev.revRating*10}%; overflow: hidden;">★★★★★ </div>
					</div>
					<ul style="display:flex;">
						<li style="margin-right:20px;">작성자: <span>${rev.userId}</span></li>
						<li>작성일: <span><fmt:formatDate value="${rev.revRegDate}" pattern="yyyy-MM-dd"/></span></li>
					</ul>
				</div>
				<div>
					<div style="margin: 20px 0;" class="v_rev_content">${rev.revCont }</div>
					<c:if test="${not empty rev.revImgUrl}}">
						<c:forEach var="url" items="${rev.revImgUrl}">
							<img src="/img/${url}">
						</c:forEach>
					</c:if>
				</div>
			</div>
			</c:forEach>
		</section>
		
		<section class="v_sec_qna" style="margin-bottom:50px;">
			<div style="border-bottom: 1px solid black; padding-bottom:15px;">
				<span class="title">상품문의</span>
				<select style="float:right; width: 150px;">
					<option>상품</option>
					<option>배송</option>
				</select>
			</div>
			<table class="table">
				<thead class="thead-dark">
					<tr style="text-align:center;">
						<th>문의유형</th>
						<th>문의/답변</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<tr></tr>
					<tr></tr>
					<tr></tr>
					<tr></tr>
				</tbody>
			</table>
			<div style="display: flex;">
				<nav aria-label="Page navigation example" style="display: flex; justify-content: center;">
  					<ul class="pagination">
    					<li class="page-item">
      						<a class="page-link" href="#" aria-label="Previous">
        						<span aria-hidden="true">&laquo;</span>
        						<span class="sr-only">Previous</span>
      						</a>
   						</li>
    					<li class="page-item"><a class="page-link" href="#">1</a></li>
    					<li class="page-item"><a class="page-link" href="#">2</a></li>
    					<li class="page-item"><a class="page-link" href="#">3</a></li>
    					<li class="page-item">
      						<a class="page-link" href="#" aria-label="Next">
        						<span aria-hidden="true">&raquo;</span>
        						<span class="sr-only">Next</span>
      						</a>
    					</li>
  					</ul>
				</nav>
				<input type="button" class="btn btn-outline-primary v_btn" value="문의하기" style="display:flex">
			</div>
		</section>
		
		<section class="v_sec_ship" style="margin-bottom:50px;">
			<div style="border-bottom: 1px solid black; padding-bottom:15px;">
				<span class="title" >배송/교환/반품 안내</span>
			</div>
		</section>
	</section>
</section>