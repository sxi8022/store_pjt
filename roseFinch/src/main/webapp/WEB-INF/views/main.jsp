<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<script>
$('.carousel').carousel(cycle, {
	  interval: 2000
});	
</script>

<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" style="height:500px;margin-bottom:75px;background:#fdf6ef;">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
1111
    </div>
    <div class="carousel-item">
2222
    </div>
    <div class="carousel-item">
3333
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">이전</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">다음</span>
  </a>
</div>



<main class="container common-layout-main">

	<section class="common-main-goods">
	<h2>인기상품</h2>
	<ul class="row">
		<li class="col-md-4">
			<a href="">
				<p class="goods-img"><img src="" alt=""></p>
				<p class="goods-name">상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명상품명</p>
				<p class="goods-price"><em>\10.000</em><span>\20.000</span></p>
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
		<li class="col-md-4"><a href="">1</a></li>
		<li class="col-md-4"><a href="">2</a></li>
		<li class="col-md-4"><a href="">3</a></li>
	
		<li class="col-md-4"><a href="">1</a></li>
		<li class="col-md-4"><a href="">2</a></li>
		<li class="col-md-4"><a href="">3</a></li>
	</ul>
	</section>
</main>
