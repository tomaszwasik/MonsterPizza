<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html">
<html>
  <head>
    <title>MonsterPizza - dodawanie nowego składnika do bazy</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/styles.css" type="text/css" rel="stylesheet">
  </head>
 
  <body>

            <form class="" method="post" action="ingredients">
                <h2 class="">Dodaj nowy składnik</h2>
                <input name="inputIngredientName" type="text" class="" placeholder="Składnik" required autofocus />
                <input name="inputAvailableAmount" type="text" class="" placeholder="Ilość" required />
                <input name="inputPrice" type="text" class="" placeholder="Cena" required />
                <button class="" type="submit" >Dodaj</button>
            </form>
            
            

     
    <footer class="footer">
      <div class="container">
        <p class="navbar-text">MonsterPizza - developed by <a href="https://pl.linkedin.com/in/twasik">Tomasz Wąsik</a></p>
      </div>
    </footer>
     
    <script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
    <script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script src="resources/js/bootstrap.js"></script>
  </body>
</html>