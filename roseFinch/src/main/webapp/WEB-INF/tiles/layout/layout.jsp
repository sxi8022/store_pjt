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

<link rel="stylesheet" href="${path}/css/bootstrap-4.1.0.css">
<link rel="stylesheet" href="${path}/css/base.css">
<link rel="stylesheet" href="${path}/css/common.css?v=<%=System.currentTimeMillis()%>">
<link rel="stylesheet" href="${path}/css/home.css?v=<%=System.currentTimeMillis()%>">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="dns-prefetch" href="//cdnjs.com">
<link rel="dns-prefetch" href="//fonts.googleapis.com">
<link rel="shortcut icon" href="https://vignette.wikia.nocookie.net/fantasy-story/images/5/52/Rosefinch_Baby.png/revision/latest/scale-to-width-down/200?cb=20180306054212">
</head>

<body>
<noscript>본 페이지는 스크립트를 지원하는 브라우저에서 정상 작동합니다. </noscript>

<script defer src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="${path}/js/jquery-3.3.1.min.js"><\/script>')</script>
<script defer src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script defer src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script defer src="${path}/js/common.js?v=<%=System.currentTimeMillis()%>"></script>
<!-- 
jj >> 추후 필요한 페이지에만 삽입하여 사용 
<script defer src="https://cdnjs.cloudflare.com/ajax/libs/jquery-autocomplete/1.0.7/jquery.auto-complete.min.js"></script>
<script defer src="https://cdnjs.cloudflare.com/ajax/libs/selectize.js/0.12.6/js/standalone/selectize.min.js"></script>
 -->
 

<tiles:insertAttribute name="header" />
<tiles:insertAttribute name="body" />
<tiles:insertAttribute name="footer" />


</body>
</html>