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
	<title>Pretraga konja po nadimku</title>
</head>
<body>

	<%@ include file="../header-footer/header.jsp" %>

	<main>
		<h2>Pretraga konja</h2>

		<form action="/ergela/nereg/findKonjaNadimak" method="get">
			<div class="forma">
				<div class="field">
					<p>Unesite nadimak konja</p>
					<input type="text" placeholder="Nadimak" name="nadimak" required>
				</div>
				<input type="submit" value="Prikazi">
			</div>
		</form>
		
		<div class="pretraga">
			<c:if test="${!empty konjNadimak}">
				<p><b>Traženi konj je:</b></p>
				<p><b>Puno ime:</b> ${konjNadimak.punoIme}</p>
				<p><b>Nadimak:</b> ${konjNadimak.nadimak}</p>
				<p><b>Pol:</b> ${konjNadimak.pol}</p>
				<p><b>Datum rođenja:</b> ${konjNadimak.datumRodjenja}</p>
				<p><b>Naziv rase:</b> ${konjNadimak.rasa.naziv}</p>
			</c:if>
			
			<c:if test="${!empty porukaKonjNadimak}">
				<p>${porukaKonjNadimak}</p>
			</c:if>
		</div>
	</main>
	
	<%@ include file="../header-footer/bg.jsp" %>

</body>
</html>