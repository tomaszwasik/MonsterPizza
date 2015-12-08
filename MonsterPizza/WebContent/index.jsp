<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="http://fonts.googleapis.com/css?family=Alegreya+SC|Alegreya:400italic,400,700" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/normalize.css" type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/main.css" type="text/css" rel="stylesheet">
<title>Insert title here</title>

<script type="text/javascript">
	function addIngredientToPizza(ingredientId, actionType) {
		var xmlhttp;
		if (window.XMLHttpRequest) {
			xmlhttp = new XMLHttpRequest();
		} else {
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("myDiv").innerHTML = xmlhttp.responseText;
			}};
		var params = "ingredient_id=" + ingredientId + "&action=" + actionType;
		xmlhttp.open("GET", "ingredientToPizza?" + params, true);
		xmlhttp.send();
	}
</script>
</head>

<body class="menu-page">

	<c:choose>
        <c:when test="${not empty sessionScope.user}">
            <li><a href="logout">Wyloguj się</a></li>
        </c:when>
        <c:otherwise>
            <li><a href="login">Zaloguj się</a></li>
        </c:otherwise>
    </c:choose>
    
    <div class="container">
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
            <h1>Stwórz i zamów pizzę</h1>
        </div>

        <div class="featured-info">
              
            <c:if test="${not empty requestScope.ingredients}">
		<c:forEach var="ingredient" items="${requestScope.ingredients}">
			<button onclick="addIngredientToPizza('${ingredient.id}', 'add')">${ingredient.name}<br>ADD<br>${ingredient.price}</button>
			<button onclick="addIngredientToPizza('${ingredient.id}', 'delete')">${ingredient.name}<br>DELETE<br>${ingredient.price}</button>
		</c:forEach>
	</c:if>
	
	<div id="myDiv"></div>
	        
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
    </div>

</body> 

	
</body>
</html>