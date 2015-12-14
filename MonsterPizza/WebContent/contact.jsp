<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Monster Pizza: Kontakt</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="http://fonts.googleapis.com/css?family=Alegreya+SC|Alegreya:400italic,400,700" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/normalize.css" type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/main.css" type="text/css" rel="stylesheet">
</head>

<body class="kontakt-page">

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
                    <li><a href="gallery.jsp">Galeria</a></li>
                    <li><a href="contact.jsp">Kontakt</a></li>
                    <li><a href="about.jsp">O nas</a></li>
                </ul>
            </nav>
        </header>

        <div class="naglowek">
            <h1>Kontakt</h1>
        </div>


        <div class="featured-info">   
            <h3>Adres</h3>
            <ul>
                <li>"Monster Pizza"</li>
                <li>Łódź ul. Potworów 666</li>
                <li>monster.pizza@monster-pizza.com</li>
                <li>Telefon: 666 666 666</li>
                <li>NIP: 00&mdash;0000&mdash;0000&mdash;0000</li>
            </ul>
            
        </div>


        <div class="featured-info">
            <h3>Godziny otwarcia</h3>
            <ul>    
                <li>Poniedziałek: 12:00 &mdash; 00:00</li> 
                <li>Wtorek: 12:00 &mdash; 00:00</li>
                <li>Środa: 12:00 &mdash; 00:00</li>
                <li>Czwartek: 12:00 &mdash; 00:00</li>
                <li>Piątek: 12:00 &mdash; 00:00</li>
                <li>Sobota: 10:00 &mdash; 00:00</li>
                <li>Niedziela: 10:00 &mdash; 00:00</li>
            </ul>
        </div>


        <footer>
            <h4>KONTAKT</h4>
            <p>"Monster Pizza"
            <br>Łódź ul. Potworów 666
            <br>monster.pizza@monster-pizza.com
            <br>Telefon: 666 666 666</p>
        </footer>
    </div>
    
</body> 

</body>
</html>