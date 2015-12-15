<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="http://fonts.googleapis.com/css?family=Alegreya+SC|Alegreya:400italic,400,700" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/css/normalize.css" type="text/css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/main.css" type="text/css" rel="stylesheet">
  </head>
 
  <body>

            <form class="" method="post" action="register" align="center">
                <h2 class="">Zarejestruj nowego użytkownika</h2>
                <input name="inputUsername" style="color: black" type="text" class="" placeholder="Nazwa użytkownika" required autofocus />
                <input name="inputPassword" style="color: black" type="password" class="" placeholder="Hasło" required />
                <br><input name="role" type="radio" class="" value="cook">cook</input>
                <input name="role" type="radio" class="" value="manager">manager</input>
                <input name="role" type="radio" class="" value="pizzerman">pizzerman</input>
                <input name="role" type="radio" class="" value="deliverer">deliverer</input>
                <input name="role" type="radio" class="" value="admin">admin</input>
                <br><button class="button" type="submit" >Zarejestruj</button>
            </form>
            
            
            
            <form class="" method="post" action="deleteUser" align="center">
            	<h2 class="">Usuń użytkownika</h2>
            	<input name="inputUsername" type="text" class="" placeholder="Nazwa użytkownika" required autofocus />
            	<button class="button" type="submit">Usuń</button>
            </form>
    
  </body>
</html>