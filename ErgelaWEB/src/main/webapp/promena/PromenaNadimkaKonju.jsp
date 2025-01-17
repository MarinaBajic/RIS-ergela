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
	<title>Promena nadimka konju</title>
</head>
<body>

	<%@ include file="../header-footer/header.jsp" %>

	<main>
		<h2>Promena nadimka za konja: </h2>
		
		<c:if test="${!empty konjUpdate}">
			<h2>${konjUpdate.punoIme}</h2>
			<form action="/ergela/admin/updateKonjNadimak" method="post">
				<div class="forma">
					<div class="field">
						<p>Unesite nov nadimak konja</p>
						<input type="text" placeholder="Nadimak" name="nadimak" required>
					</div>
					<input type="submit" value="Promeni">
				</div>
			</form>
			
			<c:if test="${!empty porukaKonjUpdate}">
				<p>${porukaKonjUpdate}</p>
			</c:if>
		</c:if>
	</main>
	
	<%@ include file="../header-footer/bg.jsp" %>

</body>
</html>