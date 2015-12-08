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

    <c:choose>
        <c:when test="${not empty sessionScope.user}">
            <li><a href="logout">Wyloguj się</a></li>
        </c:when>
        <c:otherwise>
            <li><a href="login">Zaloguj się</a></li>
        </c:otherwise>
    </c:choose>

    <c:choose>
        <c:when test="${not empty sessionScope.user and sessionScope.user.role eq 'deliverer'}">
            <jsp:include page="orders_for_delivery.jsp"/>
        </c:when>
        <c:otherwise>
            <c:out value="You have no rights to be here!"/><br>
            <li><a href="redirect?action=goToIndexPage">Przejdź do głównej strony</a></li>
        </c:otherwise>
    </c:choose>


</body>
</html>