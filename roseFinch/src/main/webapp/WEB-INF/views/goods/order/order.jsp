<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!--  
	상품 구입 페이지
	
	회원만 구매 가능하면 /user/order
	비회원 구매 가능하면 / goods/order
-->

${gdsTitle}
<br>
<c:forEach var="ord" items="${ordlist}">
	code : ${ord.optCode}
	name : ${ord.optName}
	price : ${ord.optPrice}
	cnt : ${ord.optCnt}
	rslt : ${ord.rsltPrice}
	<br>
</c:forEach>
<br>
${gdsDev}
<br>
${selName}