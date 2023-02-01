<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Unos trenera</title>
</head>
<body>

	<form action="/ergela/admin/unesiTrenera" method="post">
		Unesite ime:
		<input type="text" placeholder="Ime" name="ime"><br>
		
		Unesite prezime:
		<input type="text" placeholder="Prezime" name="prezime"><br>
		
		Unesite broj godina iskustva:
		<input type="number" placeholder="Broj godina iskustva" name="godIskustva"><br>
		
		<input type="submit" value="Sačuvaj">
	</form>
	
	<c:if test="${!empty trener}">
		Trener je uspesno sacuvan!<br>
		${trener.ime} ${trener.prezime} [${trener.godIskustva}]
	</c:if>
	<c:if test="${empty trener}">fak</c:if>
	
	<br>
	<form action="/ergela/auth/index" method="get">
		<input type="submit" value="Nazad na pocetnu">
	</form>

</body>
</html>