<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Prikaz svih konja</title>
</head>
<body>

	<c:if test="${!empty sviKonji}">
		<table border="1">
			<tr>
				<th>Puno ime</th>
				<th>Nadimak</th>
				<th>Pol</th>
				<th>Datum rođenja</th>
				<th>Rasa</th>
				<security:authorize access="hasRole('JAHAC')">
					<th>Omiljeni</th>
				</security:authorize>
			</tr>
			<c:forEach var="k" items="${sviKonji}">
				<tr>
					<td>${k.punoIme}</td>
					<td>${k.nadimak}</td>
					<td>${k.pol}</td>
					<td>${k.datumRodjenja}</td>
					<td>${k.rasa.naziv}</td>
					<security:authorize access="hasRole('JAHAC')">
						<td><a href="/ergela/jahaci/dodajKonjaUOmiljene?idKonj=${k.idKonj}">Dodaj u omiljene</a></td>
					</security:authorize>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	<c:if test="${!empty porukaSviKonji}">${porukaSviKonji}</c:if>
	<c:if test="${!empty porukaOmiljeni}">${porukaOmiljeni}</c:if>
	
	<br>
	<form action="/ergela/auth/index" method="get">
		<input type="submit" value="Nazad na pocetnu">
	</form>

</body>
</html>