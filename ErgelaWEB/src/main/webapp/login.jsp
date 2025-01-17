<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="<c:url value="/css/style.css" />"
	type="text/css">
	<title>Login</title>
</head>
<body>

	<%@ include file="header-footer/header.jsp" %>

	<main>
		<h2>Login</h2>

		<c:url var="loginUrl" value="/login" />
		<form action="${loginUrl}" method="post">
			<div class="forma">
				<div class="field">
					<p>Korisničko ime</p>
					<input type="text" name="korisnickoIme" placeholder="Unesite korisnicko ime" required>
				</div>
				<div class="field">
					<p>Šifra</p>
					<input type="password" name="lozinka" placeholder="Unesite sifru" required>
				</div>
				<input type="submit" value="Prijava">
				<p>Nemate nalog? <a href="/ergela/auth/registerUser">Registrujte se</a></p>
			</div>
		</form>
	</main>

	<%@ include file="header-footer/bg.jsp" %>

</body>
</html>