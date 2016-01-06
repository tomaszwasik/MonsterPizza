<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Monster Pizza: Galeria</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link 	href="http://fonts.googleapis.com/css?family=Alegreya+SC|Alegreya:400italic,400,700" rel="stylesheet" type="text/css">
<link 	href="${pageContext.request.contextPath}/resources/css/normalize.css" type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/main.css" type="text/css" rel="stylesheet">
</head>

<body class="galeria-page">

	<div class="container">
	    <div class="logoutLoginButton">
    		<c:choose>
        		<c:when test="${not empty sessionScope.user}">
        		    <li><a href="logout">Wyloguj się</a></li>
        		</c:when>
        		<c:otherwise>
            		<li><a href="login">Zaloguj się</a></li>
        		</c:otherwise>
    		</c:choose>
    	</div>
		<header>
			<a href="redirect?action=goToIndexPage" class="logo"><img src="${pageContext.request.contextPath}/resources/images/logo.png"
				alt="Logo"></a>

			<nav class="main-navigation">
				<ul>
					<li><a href="redirect?action=goToIndexPage">Strona Główna</a></li>
                    <li><a href="about.jsp">O nas</a></li>
                    <li><a href="gallery.jsp">Galeria</a></li>
                    <li><a href="contact.jsp">Kontakt</a></li>
                    
				</ul>
			</nav>
		</header>

		<div class="naglowek">
			<h1>Galeria</h1>
		</div>


		<div class="gallery">
			<img src="${pageContext.request.contextPath}/resources/images/1.jpg">
			<img src="${pageContext.request.contextPath}/resources/images/2.jpg"> 
			<img src="${pageContext.request.contextPath}/resources/images/3.jpg">
			<img src="${pageContext.request.contextPath}/resources/images/4.jpg">
			<img src="${pageContext.request.contextPath}/resources/images/5.jpg">
			<img src="${pageContext.request.contextPath}/resources/images/6.jpg">
			<img src="${pageContext.request.contextPath}/resources/images/7.jpg">
			<img src="${pageContext.request.contextPath}/resources/images/8.jpg">
		</div>



		<footer>
			<h4>KONTAKT</h4>
			<p>
				"Monster Pizza" <br>Łódź ul. Potworów 666 <br>monster.pizza@monster-pizza.com
				<br>Telefon: 666 666 666
			</p>
		</footer>
	</div>

</body>
</html>