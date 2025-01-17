<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="<c:url value="/css/style.css" />" type="text/css">
	<title>Omiljeni konji</title>
</head>
<body>

	<%@ include file="../header-footer/header.jsp" %>

	<main>
		<h2>Moji omiljeni konji</h2>

		<c:if test="${!empty omiljeni}">
			Omiljeni konji za jahača: ${ulogovaniJahac.ime} ${ulogovaniJahac.prezime}
			<br>
			<table>
				<tr>
					<th>Puno ime</th>
					<th>Nadimak</th>
					<th>Pol</th>
					<th>Datum rođenja</th>
					<th>Rasa</th>
					<th>Obriši</th>
				</tr>
				<c:forEach var="o" items="${omiljeni}">
					<tr>
						<td>${o.konj.punoIme}</td>
						<td>${o.konj.nadimak}</td>
						<td>${o.konj.pol}</td>
						<td>${o.konj.datumRodjenja}</td>
						<td>${o.konj.rasa.naziv}</td>
						<td><a href="/ergela/jahaci/obrisiOmiljenogKonja?idOmiljeni=${o.idOmiljeni}">Obriši</a></td>
					</tr>
				</c:forEach>
			</table>
		</c:if>

		<c:if test="${!empty porukaPrikazOmiljeni}">
			<p>${porukaPrikazOmiljeni}</p>
		</c:if>

		<c:if test="${!empty porukaOmiljeniKonjObrisan}">
			<p>${porukaOmiljeniKonjObrisan}</p>
		</c:if>
	</main>
	
	<%@ include file="../header-footer/bg.jsp" %>

</body>
</html>