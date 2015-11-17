<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  </head>
 
  <body>

            <form class="" method="post" action="registerUser">
                <h2 class="">Zarejestruj nowego użytkownika</h2>
                <input name="inputUsername" type="text" class="" placeholder="Nazwa użytkownika" required autofocus />
                <input name="inputPassword" type="password" class="" placeholder="Hasło" required />
                <input name="role" type="radio" class="" value="admin">admin</input>
                <input name="role" type="radio" class="" value="dostawca">dostawca</input>
                <input name="role" type="radio" class="" value="kucharz">kucharz</input>
                <button class="" type="submit" >Zarejestruj</button>
            </form>
            
            
            
            <form class="" method="post" action="deleteUser">
            	<h2 class="">Usuń użytkownika</h2>
            	<input name="inputUsername" type="text" class="" placeholder="Nazwa użytkownika" required autofocus />
            	<button class="" type="submit">Usuń</button>
            </form>

     
    
     
    
  </body>
</html>