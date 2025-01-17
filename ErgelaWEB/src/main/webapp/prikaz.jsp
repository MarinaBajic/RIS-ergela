<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="<c:url value="/css/style.css" />" type="text/css">
	<title>Prikaz</title>
</head>
<body>

	<%@ include file="header-footer/header.jsp" %>

	<main>
		<h2>Prikaz</h2>

		<div class="cards">
			<div class="card">
				<a href="/ergela/nereg/getSviKonji">Konji</a>
			</div>
			
			<security:authorize access="hasRole('JAHAC')">
				<div class="card">
					<a href="/ergela/jahaci/getSviTreninzi">Moji treninzi</a>
				</div>
				<div class="card">
					<a href="/ergela/jahaci/getOmiljeniKonji">Omiljeni konji</a>
				</div>
			</security:authorize>
		
			<security:authorize access="hasAnyRole('MENADZER', 'ADMIN')">
				<div class="card">
					<a href="/ergela/jahaci/getSviTreninzi">Treninzi</a>
				</div>
				<div class="card">
					<a href="/ergela/menadzeri/getSviJahaci">Jahači</a>
				</div>
			</security:authorize>
		</div>
	</main>

	<%@ include file="header-footer/bg.jsp" %>
	
</body>
</html>