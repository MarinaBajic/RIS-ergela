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
	<title>Pretraga konja po rasi</title>
</head>
<body>

	<%@ include file="../header-footer/header.jsp" %>

	<main>
		<h2>Pretraga konja</h2>

		<div class="main-col">
			<form action="/ergela/nereg/findKonjeRasa" method="get">
				<div class="forma">
					<div class="field">
						<p>Unesite rasu</p>
						<input type="text" placeholder="Rasa" name="nazivRase" required>
					</div>
					<input type="submit" value="Prikazi">
				</div>
			</form>
			
			<c:if test="${!empty konjiRasa}">
				<table>
					<tr>
						<th>Puno ime</th>
						<th>Nadimak</th>
						<th>Pol</th>
						<th>Datum rođenja</th>
						<th>Rasa</th>
					</tr>
					<c:forEach var="k" items="${konjiRasa}">
						<tr>
							<td>${k.punoIme}</td>
							<td>${k.nadimak}</td>
							<td>${k.pol}</td>
							<td>${k.datumRodjenja}</td>
							<td>${k.rasa.naziv}</td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
			
			<c:if test="${!empty porukaKonjiRasa}">
				<p>${porukaKonjiRasa}</p>
			</c:if>
		</div>
	</main>
	
	<%@ include file="../header-footer/bg.jsp" %>

</body>
</html>