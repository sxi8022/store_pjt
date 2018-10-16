<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="${path}/css/bootstrap-4.1.0.css">
<link rel="stylesheet" href="${path}/css/base.css">
<link rel="stylesheet" href="${path}/css/common.css?v=<%=System.currentTimeMillis()%>">
<link rel="stylesheet" href="${path}/css/home.css?v=<%=System.currentTimeMillis()%>">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<link rel="dns-prefetch" href="//cdnjs.com">
<link rel="dns-prefetch" href="//fonts.googleapis.com">
<link rel="shortcut icon" href="https://vignette.wikia.nocookie.net/fantasy-story/images/5/52/Rosefinch_Baby.png/revision/latest/scale-to-width-down/200?cb=20180306054212">


<script defer src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="${path}/js/jquery-3.3.1.min.js"><\/script>')</script>
<script defer src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script defer src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script defer src="${path}/js/common.js?v=<%=System.currentTimeMillis()%>"></script>
</head>
<body>
<noscript>본 페이지는 스크립트를 지원하는 브라우저에서 정상 작동합니다. </noscript>
<tiles:insertAttribute name="header" />
<tiles:insertAttribute name="footer" />


</body>
</html>