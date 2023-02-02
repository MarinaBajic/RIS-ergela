<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Registracija</title>
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
		<h2>Register</h2>

		<sf:form modelAttribute="korisnik" action="/ergela/auth/register" method="post">
			<div class="register forma">
				<div class="reg-row">
					<div class="reg-col">
						<div class="field">
							<p>Ime</p>
							<sf:input path="ime" placeholder="Unesite ime" required="true"/>
						</div>
						<div class="field">
							<p>Prezime</p>
							<sf:input path="prezime" placeholder="Unesite prezime" required="true"/>
						</div>
						<div class="field">
							<p>Email</p>
							<input type="text" name="email"	placeholder="Unesite email">
						</div>
						<div class="field">
							<p>Unesite datum rođenja</p>
							<input type="date" name="datumRodjenja">
						</div>
					</div>
					<div class="reg-col">
						<div class="field">
							<p>Korisničko ime</p>
							<sf:input path="korisnickoIme" placeholder="Unesite korisničko ime" required="true"/>
						</div>
						<div class="field">
							<p>Lozinka</p>
							<sf:password path="lozinka" placeholder="Unesite lozinku" required="true"/>
						</div>
						<div class="field">
							<p>Uloga</p>
							<sf:select path="ulogas" items="${uloge}" itemValue="idUloga" itemLabel="naziv" required="true"/>
						</div>
					</div>
				</div>
				<div class="reg-row">
					<input type="submit" value="Sacuvaj">
				</div>
			</div>	
		</sf:form>
	</main>

	<div class="hero-img">
		<div class="hero-img-overlay"></div>
	</div>

</body>
</html>