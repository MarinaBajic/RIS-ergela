<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Prikaz mojih treninga</title>
</head>
<body>

	<c:if test="${!empty mojiTreninzi}">
		Treninzi za jahaca: ${ulogovaniJahac.ime} ${ulogovaniJahac.prezime}
		<br>
		<table border="1">
			<tr>
				<th>Nadimak konja</th>
				<th>Datum</th>
				<th>Vreme</th>
			</tr>
			<c:forEach var="t" items="${mojiTreninzi}">
				<tr>
					<td>${t.konj.nadimak}</td>
					<td>${t.datum}</td>
					<td>${t.vreme}</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	
	<c:if test="${!empty porukaMojiTreninzi}">${porukaMojiTreninzi}</c:if>
	
	<br>
	<form action="/ergela/auth/index" method="get">
		<input type="submit" value="Nazad na pocetnu">
	</form>

</body>
</html>