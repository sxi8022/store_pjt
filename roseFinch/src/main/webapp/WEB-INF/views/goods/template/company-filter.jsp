<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach var="company" items="${companies}">
	<a class="company filter-link" href="#" data-filter-name="company" data-filter-value="${company.gds_company}" title="${company.gds_company}">${company.gds_company}</a>
</c:forEach>