<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="<c:url value="/css/style.css" />"
	type="text/css">
	<title>Home page</title>
</head>
<body>

	<%@ include file="header-footer/header.jsp" %>

	<main>
		<div class="dobrodosli">
			<security:authorize access="isAuthenticated()">
				<h1>Dobro došla&nbsp;</h1>
				<h1>
					<security:authentication property="principal.username" />
					!
				</h1>
			</security:authorize>

			<security:authorize access="isAnonymous()">
				<h1>Dobrodošli na portal ergele.</h1>
				<h3>Kako biste nastavili sa radom, molimo prijavite se.</h3>
			</security:authorize>
		</div>
	</main>
	
	<%@ include file="header-footer/bg.jsp" %>

</body>
</html>