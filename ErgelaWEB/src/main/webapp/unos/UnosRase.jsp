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
	<title>Unos rase</title>
</head>
<body>

	<%@ include file="../header-footer/header.jsp" %>

	<main>
		<h2>Unos nove rase</h2>

		<div class="main-col">
			<form action="/ergela/admin/unesiRasu" method="post">
				<div class="forma">
					<div class="field">
						<p>Unesite naziv</p>
						<input type="text" placeholder="Naziv rase" name="naziv" required><br>
					</div>
					<div class="field">
						<p>Unesite boju</p>
						<input type="text" placeholder="Boja rase" name="boja" required><br>
					</div>
					<input type="submit" value="Sačuvaj">
				</div>
			</form>
			
			<div class="pretraga">
				<c:if test="${!empty rasaUnos}">
					<p><b>Rasa je uspešno sačuvana!</b></p>
					<p><b>Naziv rase:</b> ${rasaUnos.naziv}</p>
					<p><b>Boja konja:</b> ${rasaUnos.boja}</p>
				</c:if>
				
				<c:if test="${!empty porukaUnosRase}">
					<p>${porukaUnosRase}</p>
				</c:if>
			</div>
		</div>
	</main>
	
	<%@ include file="../header-footer/bg.jsp" %>

</body>
</html>