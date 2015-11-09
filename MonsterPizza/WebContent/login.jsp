<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>MonsterPizza - logowanie</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/styles.css" type="text/css" rel="stylesheet">
  </head>
 
  <body>
     
    <nav class = "">
      <div class="">
        <a href="#" class="navbar-brand">MonsterPizza</a>  
      </div>
    </nav>
     
    <div class="">
        <div class="">
            <form class="" action="j_security_check" method="post">
                <h2 class="">Zaloguj się</h2>
                <input name="j_username" type="text" class="" placeholder="Nazwa użytkownika" required autofocus>
                <input name="j_password" type="password" class="" placeholder="Hasło" required>
                <button class="" type="submit">Zaloguj</button>
                <a href="#">Przejdź do strony głównej</a>
            </form>
        </div>
    </div>
     
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