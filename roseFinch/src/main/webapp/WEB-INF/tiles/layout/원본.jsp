<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>RoseFinch Shopping Mall</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<!-- MATERIAL CSS, ICON -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
	<link rel="stylesheet" href="./resources/css/roseFinch.css">
	
	<!-- JQUERY 3.3.1 -->
	<script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
	<!-- MATERIAL JS 1.3.0 -->
	<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
</head>

<body>
	<div class="demo-layout-transparent mdl-layout mdl-js-layout">
		<header class="mdl-layout__header mdl-layout__header--transparent">
			<tiles:insertAttribute name="header" />
		</header>
		
		<tiles:insertAttribute name="menu" />
		
		<main class="mdl-layout__content">
			<tiles:insertAttribute name="body" />
		</main>
		
		<footer class="mdl-mega-footer">
			<tiles:insertAttribute name="footer" />
		</footer>
	</div>
</body>
</html>