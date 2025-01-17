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
	<title>Unos konja</title>
</head>
<body>

	<%@ include file="../header-footer/header.jsp" %>

	<main>
		<h2>Unos novog konja</h2>

		<div class="main-col">
			<form action="/ergela/admin/unesiKonja" method="post">
				<div class="forma">
					<div class="field">
						<p>Unesite puno ime</p>
						<input type="text" placeholder="Puno ime" name="punoIme" required><br>
					</div>
					<div class="field">
						<p>Unesite nadimak</p>
						<input type="text" placeholder="Nadimak" name="nadimak"><br>
					</div>
					<div class="field">
						<p>Unesite pol(z,m)</p>
						<input type="text" placeholder="Pol" name="pol" required><br>
					</div>
					<div class="field">
						<p>Unesite datum rođenja</p>
						<input type="date" name="datumRodjenja" required><br>
					</div>
					<div class="field">
						<p>Izaberite rasu</p>
						<c:if test="${!empty sveRase}">
							<select name="idRasa" required>
								<c:forEach var="r" items="${sveRase}">
									<option value="${r.idRasa}">${r.naziv} - ${r.boja}</option>
								</c:forEach>
							</select>
						</c:if>
					</div>
					<input type="submit" value="Sačuvaj">
				</div>
			</form>
			
			<div class="pretraga">
				<c:if test="${!empty konjUnos}">
					<p><b>Konj je uspešno sačuvan!</b></p>
					<p><b>Puno ime:</b> ${konjUnos.punoIme}</p>
					<p><b>Nadimak:</b> ${konjUnos.nadimak}</p>
				</c:if>
				
				<c:if test="${!empty porukaUnosKonja}">
					<p>${porukaUnosKonja}</p>
				</c:if>
			</div>
		</div>
	</main>
	
	<%@ include file="../header-footer/bg.jsp" %>

</body>
</html>