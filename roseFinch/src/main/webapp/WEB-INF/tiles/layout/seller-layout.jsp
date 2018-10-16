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

<link rel="stylesheet" href="${path}/css/bootstrap-4.1.0.css">
<link rel="stylesheet" href="${path}/css/base.css">

<link rel="dns-prefetch" href="//cdnjs.com">
<link rel="dns-prefetch" href="//fonts.googleapis.com">
</head>

<body>
<noscript>본 페이지는 스크립트를 지원하는 브라우저에서 정상 작동합니다. </noscript>

<script defer src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="${path}/js/jquery-3.3.1.min.js"><\/script>')</script>
<script defer src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script defer src="${path}/js/common.js"></script>

</body>
</html>