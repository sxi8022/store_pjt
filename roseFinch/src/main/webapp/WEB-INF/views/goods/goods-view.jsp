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

<link rel="stylesheet" type="text/css" href="/css/goodDetail.css">
<script src="https://use.fontawesome.com/releases/v5.4.1/js/all.js" data-auto-replace-svg="nest"></script>

<section class="container common-layout-sub">
	<section class="v_sec_cat" style="margin: 40px 0">
		<i class="fas fa-home fa-2x"></i>
		<span>홈  &gt;</span>
		<select class="v_category_par" name="cat_par" style="width:150px">
			<option value="" selected></option>
		</select>
		<span>&gt;</span>
		<select class="v_category_chi" name="cat_chi" style="width:150px">
			<option value=""></option>
		</select>
	</section>
	
	<section class="v_sec_item" style="display:flex">
		<div style="width:50%;">
			<img src="/img/${goodImg[0].gdsImgUrl }" style="display:block; margin: auto; height: 500px;">
		</div>
		
		<div style="width:50%; padding-left: 20px">
			<p style="height:10%; font-size:17px;">판매자: ${seller.selName }</p>
			<p style="height:20%; font-size:45px;">${good.gdsName }</p>
			<div class="v_star" style="height:10%;">
				<div style="display:flex; width:200px;">
					<div style="color:yellow; font-size:20px">☆☆☆☆☆</div>
					<div style="color:yellow; font-size:20px; position:relative; left:-100px; width:${revAvg*10}%; overflow: hidden;">★★★★★ </div>
				</div>
			</div>
			<p style="height:10%; font-size:25px;"><fmt:formatNumber value="${good.gdsPrice}"/>원</p>
			<p style="height:10%; font-size:17px;">적립금: <fmt:formatNumber value="${good.gdsPrice*0.05}"/>원</p>
			<p style="height:10%; font-size:17px;">배송: 착불/4000원</p>
			<div style="height:10%">
				<span style="font-size:17px">옵션 :</span>
				<select class="v_item_opt" name="opt">
					<c:if test="${empty goodOpts}">
						<option>----없음-----</option>
					</c:if>
					
					<c:forEach var="opt" items="${goodOpts }">
					<option>${opt.optName } | ${opt.optPrice } | ${opt.optCnt }</option>
					</c:forEach>
				</select>
			</div>
			<div style="height:10%">
				<span style="font-size:20px">주문수량 :</span>
				<input type="number" value="1" step="1" min="1" max="10" autocomplete="off">
			</div>
			<div style="height:10%">
				<input type="button" class="btn btn-outline-primary v_btn" value="장바구니 담기">
				<input type="button" class="btn btn-outline-primary v_btn" value="바로구매">
			</div>
		</div>
	</section>
		
	<section class="v_sec_sticky">
		<span>${good.gdsName }</span>
		<div class="v_itme_opt">
			<span style="font-size:17px">옵션 :</span>
			<select class="v_item_opt" name="opt">
				<c:if test="${empty goodOpts}">
					<option>----없음-----</option>
				</c:if>
					
				<c:forEach var="opt" items="${goodOpts }">
				<option>${opt.optName } | ${opt.optPrice } | ${opt.optCnt }</option>
				</c:forEach>
			</select>
		</div>
		<p><fmt:formatNumber value="${good.gdsPrice}"/>원</p>
		<input type="button" class="btn btn-outline-primary v_btn" value="장바구니 담기">
		<input type="button" class="btn btn-outline-primary v_btn" value="바로구매">
	</section>		

	<section class="v_sec_tabs" style="margin: 40px 0;">
		<table style="text-align:center" class="table table-dark">
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
	
		<section class="v_sec_detail" style="margin: 40px 0;">
			<div>${good.gdsDesc}</div>
			<c:forEach begin="2" end="${goodImgNum}" varStatus="idx">
			<img src="/img/${goodImg[idx.count].gdsImgUrl}">
			</c:forEach>
		</section>
		
		<section class="v_sec_rev" style="margin: 40px 0;">
			<div style="border-bottom: 1px solid black; padding-bottom:15px;">
				<span style="font-size: 40px">상품평</span>
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
		
		<section class="v_sec_qna" style="margin: 40px 0;">
			<div style="border-bottom: 1px solid black; padding-bottom:15px;">
				<span style="font-size: 40px">상품문의</span>
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
		
		<section class="v_sec_ship" style="margin: 40px 0;">
			<div style="border-bottom: 1px solid black; padding-bottom:15px;">
				<span style="font-size: 40px">배송/교환/반품 안내</span>
			</div>
		</section>
	</section>