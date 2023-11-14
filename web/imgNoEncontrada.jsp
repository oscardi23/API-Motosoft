<%-- 
    Document   : imgNoEncontrada
    Created on : 13/11/2023, 2:29:43 p. m.
    Author     : Oscar Diaz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Imagen No Encontrada</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    </head>
    <body>
        <div class="alert alert-primary" role="alert">
            Imagen No Encontrada o el formato no es soportado <a href="imagenUser.jsp" class="alert-link">intentalo de nuevo</a>. por favor.
            
        </div>
        <div style="display: flex; justify-content: center; align-items: center;  margin-top: 20px">
            <img  style="height: 300px; width: auto" src="img/ErrorImg.png" alt="imgerror"/>
            </div>
    </body>
</html>
