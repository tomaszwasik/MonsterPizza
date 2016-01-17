<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="http://fonts.googleapis.com/css?family=Alegreya+SC|Alegreya:400italic,400,700" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/normalize.css" type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/main.css" type="text/css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/latinise.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/monsterPizzaJS.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dragAndDrop.css">
<title>Monster Pizza</title>

</head>

<body class="menu-page">  
    <div class="container">
    	
        <header>
           <a href="redirect?action=goToIndexPage" class="logo"><img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="Logo"></a>

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
            <h1>Stwórz i zamów pizzę</h1>
            <div id="help">
            	<div class="step">
            		<img src="${pageContext.request.contextPath}/resources/images/help/1.jpg" />
            		<img src="${pageContext.request.contextPath}/resources/images/help/2.jpg" />
            		<div class="stepDesc">
            			<h4>Jak zrobić swoją ulubioną pizze?</h4>
            			Dodaj swoje ulubione składniki poprzez przeciągnięcie ich z miseczki na pizzę.
            		</div>
            	</div>
            	<div class="step">
            		<img src="${pageContext.request.contextPath}/resources/images/help/3.jpg" />
            		<img src="${pageContext.request.contextPath}/resources/images/help/4.jpg" />
            		<div class="stepDesc">
            			<h4>Zmień rozmiar pizzy lub sos!</h4>
            			Możesz zmienić rodzaj sosu bądź rozmiar pizzy klikając na pizzę lub sos. 
            		</div>
            	</div>
            	<div class="step">
            		<img src="${pageContext.request.contextPath}/resources/images/help/5.jpg" />
            		<img src="${pageContext.request.contextPath}/resources/images/help/6.jpg" />
            		<div class="stepDesc">
            			<h4>Zamów pizzę!</h4>
            			Po zakończeniu tworzenia pierwszej pizzy - zamów ją lub stwórz kolejną!
            		</div>
            	</div>
            </div>
        </div>
        
        <div id="stol">
		<div id="sos"></div>
		<div id="deska"></div>
		<div id="przyprawy"></div>
		
		

		<div id="skladniki">
			<c:if test="${not empty requestScope.ingredients}">
				<c:forEach var="ingredient" items="${requestScope.ingredients}">
					<script>addIngredientToList("${ingredient.id}", "${ingredient.name}");</script>
				</c:forEach>
			</c:if> 
		</div>

		<div id="ciasto">
			<c:if test="${not empty sessionScope.pizza.ingredients}">
				<c:forEach var="ingredient" items="${sessionScope.pizza.ingredients}">
					<script>addIngredientToOrder("${ingredient.id}", true);</script>
				</c:forEach>
			</c:if> 
		</div>
	</div>

    <div class="featured-info">
	    <div id="myDiv">
		    <c:choose>
		    	<c:when test="${not empty sessionScope.pizza.ingredients}">
		    		<c:set var="total" value="${0}"/>
			    	<h2>Twoja pizza:)</h2>
			    	<br>Składniki</br>
			    	<ul>
						<c:forEach var="ingredient" items="${sessionScope.pizza.ingredients}">
							<li>${ingredient.name}</li>
							<c:set var="total" value="${total + ingredient.price}" />
						</c:forEach>
					</ul>
					<br><h2>Cena pizzy: ${total} zł</h2>
				</c:when> 
			</c:choose> 
	    </div>
	</div>
    <div class="center">
    	<p class="button"><a href="pizzaToOrder?action=goToSummary">Przejdź do podsumowania</a></p>
    	<p class="button"><a href="pizzaToOrder?action=addPizzaToOrder">Dodaj kolejną pizzę do zamówienia</a></p>
    </div>


        <footer>
            <h4>KONTAKT</h4>
            <p>"Monster Pizza"
            <br>Łódź ul. Potworów 666
            <br>monster.pizza@monster-pizza.com
            <br>Telefon: 666 666 666</p>
        </footer>
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
    </div>

</body> 

	
</body>
</html>