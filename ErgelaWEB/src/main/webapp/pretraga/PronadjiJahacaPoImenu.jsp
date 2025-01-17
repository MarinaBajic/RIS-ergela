<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="<c:url value="/css/style.css" />"
	type="text/css">
	<title>Pronadji jahaca po imenu</title>
</head>
<body>

	<%@ include file="../header-footer/header.jsp" %>

	<main>
		<h2>Pretraga jahača</h2>

		<form action="/ergela/menadzeri/getJahacIme" method="get">
			<div class="forma">
				<div class="field">
					<p>Unesite ime</p>
					<input type="text" placeholder="Ime" name="ime" required><br>
				</div>
				<div class="field">
					<p>Unesite prezime</p>
					<input type="text" placeholder="Prezime" name="prezime" required><br>
				</div>
				<input type="submit" value="Pretraži">
			</div>
		</form>
		
		<div class="pretraga">
			<c:if test="${!empty jahacIme}">
				<p><b>Traženi jahač je:</b></p>
				<p><b>Ime:</b> ${jahacIme.ime}</p>
				<p><b>Prezime:</b> ${jahacIme.prezime}</p>
				<p><b>Datum rođenja:</b> ${jahacIme.datumRodjenja}</p>
			</c:if>
			
			<c:if test="${!empty porukaNijeNadjenJahac}">
				<p>${porukaNijeNadjenJahac}</p>
			</c:if>
		</div>
	</main>
	
	<%@ include file="../header-footer/bg.jsp" %>

</body>
</html>