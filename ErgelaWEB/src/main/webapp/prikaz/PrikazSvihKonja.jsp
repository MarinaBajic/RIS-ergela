<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="<c:url value="/css/style.css" />" type="text/css">
	<title>Prikaz svih konja</title>
</head>
<body>

	<%@ include file="../header-footer/header.jsp" %>

	<main>
		<h2>Prikaz svih konja</h2>

		<c:if test="${!empty sviKonji}">
			<table>
				<tr>
					<th>Puno ime</th>
					<th>Nadimak</th>
					<th>Pol</th>
					<th>Datum rođenja</th>
					<th>Rasa</th>
					<security:authorize access="hasRole('JAHAC')">
						<th>Omiljeni</th>
					</security:authorize>
					<security:authorize access="hasRole('ADMIN')">
						<th>Promena nadimka</th>
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
						<security:authorize access="hasRole('ADMIN')">
							<td><a href="/ergela/admin/promeniNadimakKonju?idKonj=${k.idKonj}">Promeni nadimak</a></td>
						</security:authorize>
					</tr>
				</c:forEach>
			</table>
		</c:if>
		<c:if test="${!empty porukaSviKonji}">
			<p>${porukaSviKonji}</p>
		</c:if>

		<c:if test="${!empty porukaOmiljeni}">
			<p>${porukaOmiljeni}</p>
		</c:if>
	</main>

	<%@ include file="../header-footer/bg.jsp" %>

</body>
</html>