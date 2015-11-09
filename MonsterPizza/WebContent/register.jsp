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

            <form class="" method="post" action="#">
                <h2 class="">Zarejestruj nowego użytkownika</h2>
                <input name="inputUsername" type="text" name="inputUsername" class="" placeholder="Nazwa użytkownika" required autofocus />
                <input name="inputPassword" type="password" class="" placeholder="Hasło" required />
                <input name="role" type="radio" class="" value="admin">admin</input>
                <input name="role" type="radio" class="" value="dostawca">dostawca</input>
                <input name="role" type="radio" class="" value="kucharz">kucharz</input>
                <button class="" type="submit" >Zarejestruj</button>
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