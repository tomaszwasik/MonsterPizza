<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
  <head>
    <title>MonsterPizza - rejestracja nowego użytkownika</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/styles.css" type="text/css" rel="stylesheet">
  </head>
 
  <body>

            <form class="" method="post" action="roles">
                <h2 class="">Dodaj nową rolę</h2>
                <input name="inputRoleName" type="text" class="" placeholder="Nazwa roli" required autofocus />
                <input name="inputRoleDescription" type="text" class="" placeholder="Opis roli" required />
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