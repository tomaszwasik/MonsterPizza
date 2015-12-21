<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

   <c:if test="${not empty requestScope.ordersForDelivery}">
        <c:forEach var="order" items="${requestScope.ordersForDelivery}">
            
            <li><h2>Numer zamówienia: <c:out value="${order.id}"/></h2></li>
            <li>Status: <c:out value="${order.status.state}"/></li>
            <li>Imię klienta: <c:out value="${order.customerName}"/></li>
            <li>Nazwisko klienta: <c:out value="${order.customerSurname}"/></li>
            <li>Ulica: <c:out value="${order.customerStreetName}"/></li>
            <li>Numer: <c:out value="${order.customerStreetNo}"/></li>
            <li>Piętro: <c:out value="${order.customerFlatNo}"/></li>
            <li>Kod pocztowy: <c:out value="${order.customerPostCode}"/></li>
            <li>Numer Telefonu: <c:out value="${order.customerPhone}"/></li>
            <li>Kwota: <c:out value="${order.orderPrice}"/></li>
            <p></p>
            <c:forEach var="pizza" items="${order.pizzas}">
                <li>Numer Id Pizzy: <c:out value="${pizza.id}"/></li>                
                <c:forEach var="ingredient" items="${pizza.ingredients}">
                    <li>Składniki: <c:out value="${ingredient.name}"/><br></li>
                </c:forEach>                
            </c:forEach>
            <br><br>
        </c:forEach>
    </c:if>
    
    <form class="" action="deliverer" method="post">
	    <h2 class="">Podaj ID zamówienia aby zmienić status na: "dostarczono"</h2>
	    <input name="inputOrderId" type="text" class="" style="color: black" placeholder="ID zamówienia" required autofocus>
	    <button class="button" type="submit">Zmień status</button>
    </form>
    
</body>
</html>