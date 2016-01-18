<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="http://fonts.googleapis.com/css?family=Alegreya+SC|Alegreya:400italic,400,700" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/normalize.css" type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/main.css" type="text/css" rel="stylesheet">
<title>Zamówienie</title>

</head>

<body>
  <div class="container">
   <a href="redirect?action=goToIndexPage" class="logo"><img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="Logo"></a>
  
<h2>Twoje zamówienie:</h2>
	<c:if test="${not empty sessionScope.order.pizzas}">
	<c:forEach var="pizza" items="${sessionScope.order.pizzas}" varStatus="loop">
	<h3>Pizza nr ${loop.index +1}:</h3>
	<ul>
		<c:forEach var="ingredient" items="${pizza.ingredients}">
		
		<li>
			<c:out value="${ingredient.name}"/>
		</li>
		</c:forEach>
	</ul>
	<h3>Cena pizzy: ${pizza.price}</h3>
	</c:forEach>
	<br>
	</c:if>
	
	<h2>Uzupełnij formularz i złóż zamówienie:</h2>
	<form method="post" action="completeOrder">
		<input name="customerName" type="text" class="" style="color: black" placeholder="imię" 
			pattern="[A-Za-z]{3,30}" title="prawdziwe imię (tylko litery) od 3 do 30 znaków." required autofocus />
		<input name="customerSurname" type="text" class="" style="color: black" placeholder="nazwisko" 
			pattern="[A-Za-z]{2,60}" title="prawdziwe nazwisko (tylko litery) od 2 do 60 znaków." required />
		<input name="customerStreetName" type="text" class="" style="color: black" placeholder="ulica" 
			pattern="[A-Za-z]{1,60}" title="prawdziwa nazwa ulicy (tylko litery) do 60 znaków." required />
		<input name="customerStreetNo" type="text" class="" style="color: black" placeholder="nr domu" 
			pattern="\d{1,5}[A-Za-z]?" title="prawdziwy numer domu do 5 znaków." required />
		<input name="customerFlatNo" type="text" class="" style="color: black" placeholder="nr mieszkania" 
			pattern="[0-9]{1,5}" title="prawdziwy numer mieszkania (tylko cyfry) do 5 znaków. " />
		<input name="customerPostCode" type="text" class="" style="color: black" placeholder="kod pocztowy" 
			pattern="[0-9]{2}-[0-9]{3}" title="prawdziwy kod pocztowy w formacie xx-xxx" required />
		<input name="customerPhone" type="text" class="" style="color: black" placeholder="nr telefonu" 
			pattern="(\d{3}-\d{3}-\d{3})|(0\d{2} \d{3}-\d{2}-\d{2})" 
			title="prawdziwy numer telefonu w formacie xxx-xxx-xxx lub 0xx xxx-xx-xx" required />
		<button class="button" type="submit" >Wyślij</button>
	</form>

	
	
</div>	
</body>
</html>