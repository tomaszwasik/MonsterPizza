<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html">
<html>
  <head>
    <title>MonsterPizza - dodawanie nowego składnika do bazy</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="http://fonts.googleapis.com/css?family=Alegreya+SC|Alegreya:400italic,400,700" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/normalize.css" type="text/css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/main.css" type="text/css" rel="stylesheet">
  </head>
 
  <body>
 
            <form class="" method="post" action="ingredients" align="center">
                <h2 class="">Dodaj nowy składnik</h2>
                <input name="inputIngredientName" style="color: black" type="text" class="" placeholder="Składnik" required autofocus />
                <input name="inputAvailableAmount" style="color: black" type="text" class="" placeholder="Ilość" required />
                <input name="inputPrice" style="color: black" type="text" class="" placeholder="Cena" required />
                <button class="button" type="submit" >Dodaj</button>
            </form>           
     
    <script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
    <script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script src="resources/js/bootstrap.js"></script>
  </body>
</html>