<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pretraga treninga</title>
</head>
<body>

	<form action="/ergela/menadzeri/getTrening" method="get">
		Unesite datum:
		<input type="date" name="datum"><br>
		Unesite ime i prezime jahača:
		<input type="text" name="imePrezime"><br>
		Unesite nadimak konja:
		<input type="text" name="nadimak"><br>
		<input type="submit" value="Prikazi">
	</form>
	
	<c:if test="${!empty treninzi}">
		<table border="1">
			<tr>
				<th>Datum</th>
				<th>Jahač</th>
				<th>Konj</th>
				<th>Od</th>
				<th>Do</th>
			</tr>
			<c:forEach var="t" items="${treninzi}">
				<tr>
					<td>${t.datum}</td>
					<td>${t.jahac.ime} ${t.jahac.prezime}</td>
					<td>${t.konj.nadimak}</td>
					<td>${t.vremePocetka}</td>
					<td>${t.vremeZavrsetka}</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	<c:if test="${empty treninzi }">fak</c:if>
	
	<br>
	<form action="/ergela/auth/index" method="get">
		<input type="submit" value="Nazad na pocetnu">
	</form>

</body>
</html>