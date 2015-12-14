<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Monster Pizza: O nas</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
	href="http://fonts.googleapis.com/css?family=Alegreya+SC|Alegreya:400italic,400,700" rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/css/normalize.css" type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/main.css" type="text/css" rel="stylesheet">
</head>

<body class="o_nas-page">
    
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
           <a href="redirect?action=goToIndexPage" class="logo"><img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="Logo"></a>

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
            <h1>O nas</h1>
        </div>


        <div id="featured-info">
            <p>Pizzeria 'Monster Pizza' nie jest zwykłą pizzerią. U nas nie musisz wybierać spośród zestawu nudnych, utartych pizz, które znajdziesz w każdej pizzerii. O nie, nie będziesz czytać menu, zastanawiać się nad tym, na którą masz ochotę, nie będziesz musiał rezygnować ze smaku bo nie lubisz anchois, pomidorów czy cebuli.</p>
            <p>W naszej pizzerii to TY stworzysz swoją wymarzoną pizzę, my tylko wykonamy ją za Ciebie w najlepszy z możliwych sposobów. Możesz wybrać WSZYSTKO co chcesz, stworzyć nawet najbardziej niewiarygodne zestawy! Masz ochotę na zwykłą Margherittę? Nie ma problemu: musisz tylko wybrać sos pomidorowy, pieczarki, ser i wędlinę.
            <br>A może masz ochotę na coś... szalonego? Ananas z łososiem? A może pomidory z jabłkami? U nas możesz popuścić wodze fantazji, nie musisz się ograniczać! Stworzymy nawet najbardziej nieprawdopodobne zestawienia, możesz spróbować wszystkiego, o czym kiedykolwiek myślałeś. Nie musisz decydować sie na żadne z góry ustalone zestawienia. U nas to TY jesteś najlepszym krytykiem kulinarnym i kucharzem, i to właśnie Ty masz sprostać swoim wymaganiom</p>
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
</html>