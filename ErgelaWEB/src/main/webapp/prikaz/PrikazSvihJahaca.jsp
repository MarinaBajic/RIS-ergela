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
	<title>Prikaz svih jahača</title>
</head>
<body>

	<%@ include file="../header-footer/header.jsp" %>

	<main>
		<h2>Prikaz svih jahača</h2>

		<c:if test="${!empty sviJahaci}">
			<table>
				<tr>
					<th>Ime</th>
					<th>Prezime</th>
					<th>Datum rođenja</th>
					<th>Adresa</th>
					<th>Datum upisa</th>
				</tr>
				<c:forEach var="j" items="${sviJahaci}">
					<tr>
						<td>${j.ime}</td>
						<td>${j.prezime}</td>
						<td>${j.datumRodjenja}</td>
						<td>${j.adresa}</td>
						<td>${j.datumUpisa}</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
		
		<c:if test="${!empty porukaSviJahaci}">
			<p>${porukaSviJahaci}</p>
		</c:if>
	</main>
	
	<%@ include file="../header-footer/bg.jsp" %>

</body>
</html>