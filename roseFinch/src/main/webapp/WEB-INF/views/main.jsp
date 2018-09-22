<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<div style="height:500px;margin-bottom:75px;background:#fdf6ef;">
</div>



<main class="container common-layout-main">

	<section class="common-main-goods">
	<h2>인기상품</h2>
	<ul class="row">
		<li class="col-md-4">
			<a href="">
				<p class="goods-img"><img src="" alt=""></p>
				<p class="goods-name">상품명상품명상품명상품명상품명상품명상품명</p>
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
