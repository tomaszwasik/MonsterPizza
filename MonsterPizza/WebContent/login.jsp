<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
  <head>
    <title>MonsterPizza - logowanie</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  	<link href="http://fonts.googleapis.com/css?family=Alegreya+SC|Alegreya:400italic,400,700" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/css/normalize.css" type="text/css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/main.css" type="text/css" rel="stylesheet">
  </head>
 
  <body>
  <div class="container">
    <nav>
      <div>
        <a href="redirect?action=goToIndexPage" class="logo"><img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="Logo"></a>  
      </div>
    </nav>
         
     
     <c:choose>
        <c:when test="${not empty sessionScope.user}">
            <li><a href="logout">Wyloguj się</a></li>
        </c:when>
        <c:otherwise>
            <div align="center">
	            <div>
	            <form class="" action="login" method="post">
	                <h2>Zaloguj się</h2>
	                <input name="inputUsername" type="text" class="" style="color: black" placeholder="Nazwa użytkownika" required autofocus >
	                <input name="inputPassword" type="password" class="" style="color: black" placeholder="Hasło" required>
	                <button class="button" type="submit">Zaloguj</button>
	            </form>
	                <a style="color: white" href="${pageContext.request.contextPath}">Przejdź do strony głównej</a>
	            </div>
            </div>
        </c:otherwise>
    </c:choose>
    <script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
    <script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script src="resources/js/bootstrap.js"></script>
    </div>
  </body>
</html>