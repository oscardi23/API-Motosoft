<%-- 
    Document   : newjsp
    Created on : 4/11/2023, 11:12:56 p. m.
    Author     : Oscar Diaz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Imagen User</title>
        <link rel="stylesheet" href="css/style.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    </head>
    <body >
        <div class="container-main-services">
            <div class="container mt-4">
                <form class="col-md-6" action="UploadImageServlet" method="post" enctype="multipart/form-data">
                    <div class="card">
                        <div class="card-header">
                            <h3>Cambiar imagen de Usuario</h3>
                        </div>

                        <div class="form-control">
                            <label for="">correo</label>
                            <input class="form-control" type="text" id="idUsuario" name="idUsuario"  value="<%= session.getAttribute("correoUsuario") %>" required>
                        </div>
                        <div class="form-control">
                            <label for="">Imagen</label>
                            <input type="file" name="fileImagen" class="form-control">
                        </div>
                        <div class="card-footer">
                            <button class="btn btn-outline-primary">Guardar Imagen</button>
                            <a class="btn btn-outline-primary" href="Ajustes.jsp">Cancelar</a>
                        </div>
                    </div>    
                </form>

            </div>
        </div>
<body>
   
</body>

</html>
