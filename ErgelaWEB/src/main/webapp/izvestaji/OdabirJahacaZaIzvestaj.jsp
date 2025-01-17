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
	<title>Odabir jahača za izveštaj</title>
</head>
<body>

	<%@ include file="../header-footer/header.jsp" %>

	<main>
		<h2>Odabir jahača za izveštaj</h2>

		<form action="/ergela/admin/generisiIzvestajTreninziZaJahaca" method="get">
			<div class="forma">
				<c:if test="${!empty sviJahaci}">
					<div class="field">
						<p>Odaberite jahača</p>
						<select name="idJahac" required>
							<c:forEach var="j" items="${sviJahaci}">
								<option value="${j.idJahac}">${j.ime} ${j.prezime}</option>
							</c:forEach>
						</select>
					</div>
					<input type="submit" value="Izaberi">
				</c:if>
			</div>
		</form>
		
		<c:if test="${!empty porukaIzvestaj}">
			<p>${porukaIzvestaj}</p>
		</c:if>
	</main>
	
	<%@ include file="../header-footer/bg.jsp" %>

</body>
</html>