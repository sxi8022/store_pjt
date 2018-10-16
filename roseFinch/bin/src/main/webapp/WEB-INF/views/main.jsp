<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<script>
$('.carousel').carousel(cycle, {
	  interval: 2000
});	
</script>

<div class="carousel slide main-layout-slide" id="carouselExampleIndicators" data-ride="carousel">
<div class="container none"><!-- none 삭제하면 이미지 슬라이드 확인 가능 -->
	<ol class="carousel-indicators main-slide-btn">
		<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
		<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
		<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
	</ol>
	
	<ol class="carousel-inner main-slide-img">
		<li class="carousel-item active">
			<img src="http://missha.beautynet.co.kr/upload/misshamain/m_e1200_20180920183358382.jpg" alt="광고 내용" class="none">
		</li>
		<li class="carousel-item">광고 2 </li>
		<li class="carousel-item">광고 3 </li>
	</ol>
  
  <a class="carousel-control-prev main-slide-btn" href="#carouselExampleIndicators" role="button" data-slide="prev">
		<span class="sr-only">이전</span>
		<b aria-hidden="true" > &lt; </b>
  </a>
  <a class="carousel-control-next main-slide-btn" href="#carouselExampleIndicators" role="button" data-slide="next">
		<span class="sr-only">다음</span>   
		<b aria-hidden="true" > &gt; </b>
  </a>
</div> 
</div>



<main class="container common-layout-main">

	<section class="common-main-goods">
	<h2>인기상품</h2>
	<!-- 
	# 상품 슬라이드 확인 필요
	슬라이드되는 효과적인 기능은 문제없으나 
	상품 목록을 가져오는 건 일종의 페이지네이션이라 사용할지 확인 필요 
	 -->
	<ul class="row">
		<li class="col-md-4">
			<a href="#">
				<!-- 
				현재 화면 설계 그대로 구현되지 않았음 
				 -->
				<p class="goods-img"><img src="http://file.beautynet.co.kr/updata2/upload/goods/10/79510/resize/s_300X300_79510_20180525142533789.jpg" alt=""></p>
				<p class="goods-name">상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명</p>
				<p class="goods-price">
					<span class="hide">할인가</span> <em>\10.000</em>
					<span class="hide">정가</span> <span>\20.000</span>
				</p>
				<p class="goods-star">*****</p>
			</a>
		</li>
		
		<li class="col-md-4"><a href="">2</a></li>
		<li class="col-md-4"><a href="">3</a></li>
	</ul>
	</section>
	
	
	<section class="common-main-goods">
	<h2>신상품</h2>
	<ul class="row">
		<li class="col-md-4">
			<a href="#">
				<p class="goods-img"><img src="http://file.beautynet.co.kr/updata2/upload/goods/10/79510/resize/s_300X300_79510_20180525142533789.jpg" alt=""></p>
				<p class="goods-name">상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명</p>
				<p class="goods-price">
					<span class="hide">할인가</span> <em>\10.000</em>
					<span class="hide">정가</span> <span>\20.000</span>
				</p>
				<p class="goods-star">*****</p>
			</a>
		</li>
		<li class="col-md-4"><a href="">2</a></li>
		<li class="col-md-4"><a href="">3</a></li>
	
		<li class="col-md-4"><a href="">1</a></li>
		<li class="col-md-4"><a href="">2</a></li>
		<li class="col-md-4"><a href="">3</a></li>
	</ul>
	</section>
</main>
