<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/styles.css" type="text/css" rel="stylesheet">
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

<body>

	<c:if test="${not empty requestScope.ingredients}">
		<c:forEach var="ingredient" items="${requestScope.ingredients}">
			<button onclick="addIngredientToPizza('${ingredient.id}', 'add')">${ingredient.name}<br>ADD<br>${ingredient.price}</button>
			<button onclick="addIngredientToPizza('${ingredient.id}', 'delete')">${ingredient.name}<br>DELETE<br>${ingredient.price}</button>
		</c:forEach>
	</c:if>
	
	<div id="myDiv"></div>
	
	

	
	<a href="pizzaToOrder?action=goToSummary" class="btn btn-info" role="button">Przejdź do podsumowania</a>
	<a href="pizzaToOrder?action=addPizzaToOrder" class="btn btn-info" role="button">Dodaj kolejną pizzę do zamówienia</a>
	
	
	
</body>
</html>