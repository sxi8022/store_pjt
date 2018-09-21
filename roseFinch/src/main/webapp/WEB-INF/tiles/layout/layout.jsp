<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<!doctype html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<title>RoseFinch Shopping Mall</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="format-detection" content="telephone=no">
	<meta name="description" content="쇼핑몰">
	<meta name="keywords" content="쇼핑몰, 도서, 태그-키워드 추가">
	
	<link rel="stylesheet" href="${path}/css/base.css">
	<link rel="stylesheet" href="${path}/css/common.css">
	<link rel="stylesheet" href="${path}/css/main.css">
	<link rel="stylesheet" href="${path}/css/sub.css">
	<link rel="dns-prefetch" href="//cdnjs.com">
	<link rel="dns-prefetch" href="//fonts.googleapis.com">
	
</head>

<body>
<noscript>본 페이지는 스크립트를 지원하는 브라우저에서 정상 작동합니다. </noscript>

<script defer src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="${path}/js/jquery-3.3.1.min.js"><\/script>')</script>
<script defer src="${path}/js/common.js"></script>
<!-- 
jj >> 추후 필요한 페이지에만 삽입하여 사용 
<script defer src="https://cdnjs.cloudflare.com/ajax/libs/jquery-autocomplete/1.0.7/jquery.auto-complete.min.js"></script>
<script defer src="https://cdnjs.cloudflare.com/ajax/libs/selectize.js/0.12.6/js/standalone/selectize.min.js"></script>
 -->
 
 
<div class="common-layout-wrap">

<tiles:insertAttribute name="header" />
<tiles:insertAttribute name="body" />
<tiles:insertAttribute name="footer" />

</div>


</body>
</html>