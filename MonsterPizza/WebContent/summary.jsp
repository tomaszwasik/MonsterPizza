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
<title>Insert title here</title>

</head>

<body>
  <div class="container">
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
		<input name="customerName" type="text" class="" style="color: black" placeholder="imię" required autofocus />
		<input name="customerSurname" type="text" class="" style="color: black" placeholder="nazwisko" required />
		<input name="customerStreetName" type="text" class="" style="color: black" placeholder="ulica" required />
		<input name="customerStreetNo" type="text" class="" style="color: black" placeholder="nr domu" required />
		<input name="customerFlatNo" type="text" class="" style="color: black" placeholder="nr mieszkania"  />
		<input name="customerPostCode" type="text" class="" style="color: black" placeholder="kod pocztowy" required />
		<input name="customerPhone" type="text" class="" style="color: black" placeholder="nr telefonu" required />
		<button class="button" type="submit" >Wyślij</button>
	</form>

	
	
</div>	
</body>
</html>