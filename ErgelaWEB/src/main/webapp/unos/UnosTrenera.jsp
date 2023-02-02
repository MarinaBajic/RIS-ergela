<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Unos trenera</title>
	<link rel="stylesheet" href="<c:url value="/css/style.css" />"
	type="text/css">
</head>
<body>

	<header>
		<img class="logo" src="<c:url value="/images/Logo.png" />/" alt="Logo">
	
		<nav>
			<p>
				<a href="/ergela/index.jsp">Početna</a>
			</p>
			<p>
				<a href="/ergela/prikaz.jsp">Prikaz</a>
			</p>
			<p>
				<a href="/ergela/pretraga.jsp">Pretraga</a>
			</p>
	
			<security:authorize access="isAuthenticated()">
				<p>
					<a href="/ergela/unos.jsp">Unos</a>
				</p>
	
				<security:authorize access="hasRole('ADMIN')">
					<p>
						<a href="/ergela/izvestaji.jsp">Izveštaji</a>
					</p>
				</security:authorize>
			</security:authorize>
		</nav>
	
		<div class="login">
			<security:authorize access="isAnonymous()">
				<form action="/ergela/auth/loginPage" method="get">
					<input type="submit" value="Login">
				</form>
			</security:authorize>
			<security:authorize access="isAuthenticated()">
				<form action="/ergela/auth/logout" method="get">
					<input type="submit" value="Logout">
				</form>
			</security:authorize>
		</div>
	</header>

	<main>
		<h2>Unos novog trenera</h2>

		<div class="main-col">
			<form action="/ergela/admin/unesiTrenera" method="post">
				<div class="forma">
					<div class="field">
						<p>Unesite ime</p>
						<input type="text" placeholder="Ime" name="ime" required><br>
					</div>
					<div class="field">
						<p>Unesite prezime</p>
						<input type="text" placeholder="Prezime" name="prezime" required><br>
					</div>
					<div class="field">
						<p>Unesite broj godina iskustva</p>
						<input type="number" placeholder="Broj godina iskustva" name="godIskustva"><br>
					</div>
					<input type="submit" value="Sačuvaj">
				</div>
			</form>
			
			<div class="pretraga">
				<c:if test="${!empty trenerUnos}">
					<p><b>Trener je uspešno sačuvan!</b></p>
					<p><b>Ime:</b> ${trenerUnos.ime}</p>
					<p><b>Prezime:</b> ${trenerUnos.prezime}</p>
					<p><b>Broj godina iskustva:</b> ${trenerUnos.godIskustva}</p>
				</c:if>
				
				<c:if test="${!empty porukaUnosTrenera}">
					<p>${porukaUnosTrenera}</p>
				</c:if>
			</div>
		</div>
	</main>
	
	<div class="hero-img">
		<div class="hero-img-overlay"></div>
	</div>

</body>
</html>