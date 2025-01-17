<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="<c:url value="/css/style.css" />"
	type="text/css">
	<title>Prikaz treninga</title>
</head>
<body>

	<%@ include file="../header-footer/header.jsp" %>

	<main>
		<h2>Prikaz treninga</h2>
		
		<c:if test="${!empty sviTreninzi}">
			<table>
				<tr>
					<security:authorize access="hasAnyRole('MENADZER', 'ADMIN')">
						<th>Ime i prezime jahača</th>
					</security:authorize>
					<th>Nadimak konja</th>
					<th>Datum</th>
					<th>Vreme</th>
					<security:authorize access="hasAnyRole('MENADZER', 'ADMIN')">
						<th>Obriši</th>
					</security:authorize>
				</tr>
				<c:forEach var="t" items="${sviTreninzi}">
					<tr>
						<security:authorize access="hasAnyRole('MENADZER', 'ADMIN')">
							<td>${t.jahac.ime} ${t.jahac.prezime}</td>
						</security:authorize>
						<td>${t.konj.nadimak}</td>
						<td>${t.datum}</td>
						<td>${t.vreme}</td>
						<security:authorize access="hasAnyRole('MENADZER', 'ADMIN')">
							<td><a href="/ergela/menadzeri/obrisiTrening?idTrening=${t.idTrening}">Obriši</a></td>
						</security:authorize>
					</tr>
				</c:forEach>
			</table>
		</c:if>

		<c:if test="${!empty porukaSviTreninzi}">
			<p>${porukaSviTreninzi}</p>
		</c:if>

		<c:if test="${!empty porukaTreningObrisan}">
			<p>${porukaTreningObrisan}</p>
		</c:if>
	</main>
	
	<%@ include file="../header-footer/bg.jsp" %>

</body>
</html>