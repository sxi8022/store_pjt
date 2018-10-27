<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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