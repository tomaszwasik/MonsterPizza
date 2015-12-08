<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

   <c:if test="${not empty requestScope.pizzermanList}">
        <c:forEach var="order" items="${requestScope.pizzermanList}">
            
            <c:out value="${order.id}"/><br>
            <c:out value="${order.status.state}"/><br>
            
            <c:forEach var="pizza" items="${order.pizzas}">
                <c:out value="${pizza.id}"/><br>
                
                <c:forEach var="ingredient" items="${pizza.ingredients}">
                    <c:out value="${ingredient.name}"/><br>
                </c:forEach>
                
            </c:forEach>
            <br><br>
        </c:forEach>
    </c:if>
    
    <form class="" action="pizzermanOrder" method="post">
	    <h2 class="">Podaj ID zamówienia aby zmienić status na: "gotowe do dostarczenia"</h2>
	    <input name="inputOrderId" type="text" class="" placeholder="ID zamówienia" required autofocus>
	    <button class="" type="submit">Zmień status</button>
    </form>
    
</body>
</html>