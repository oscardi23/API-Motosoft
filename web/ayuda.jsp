<%-- 
    Document   : ayuda
    Created on : 7/11/2023, 11:03:22 p. m.
    Author     : Oscar Diaz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ayuda</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200&family=Ubuntu:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    
<body >
<!-- estructura barra de navegacion-->

    <nav class="nav-services">
        <div class="container-setup">
            <a class="btn-main" href="Ajustes.jsp">Ajustes</a>
            <img class="setup"    src="icon/ajustes.png" alt="img.png">
        </div>
       
         <%
                String rutaDeImagen = (String) request.getAttribute("rutaDeImagen");
                
            %>
        <div class="container-account">
            <a class="" href="#"><%= session.getAttribute("nombreDeUsuario")%></a>
            <img id="user-image" src="<%= session.getAttribute("rutaDeImagen")%>" style="width: 40px; height: 40px; border-radius:20px;"   alt="img.png">                    
        </div>
        
    </nav>

    <!--contenedor de menus y formularios-->
    <div class="container-main-services">
        <!-- contenedor de menu-->
        <div class="menu-services">
            <!--icono menu-->
            <div class="menu-main">
                <img src="icon/menu.png" alt="Icono de menú"  id="menu-icon">
                <a id="menu_main" href="">Menu</a>
            </div>
            <!--lista de iconos-->
            <ul id="menu-items">
                <div class="container-categorias">
                    <img class="icono-menu" src="icon/home.png" alt="icono">
                    <li><a href="Bienvenida.jsp">Inicio</a></li>
                </div>
                <div class="container-categorias">
                    <img class="icono-menu" src="icon/motorcycle.png" alt="icono">
                    <li><a href="reg_motocicleta.jsp">Registro Motocicleta</a></li>
                </div>
                <div class="container-categorias">
                    <img class="icono-menu" src="icon/technical-support.png" alt="icono">
                    <li><a href="servicio.jsp">Servicios</a></li>
              </div>
            
              <div class="container-categorias">
                    <img class="icono-menu" src="icon/turnaround.png" alt="icono">
                    <li><a href="cita.jsp">Asignar Cita</a></li>
              </div>
            
              <div class="container-categorias">
                    <img class="icono-menu" src="icon/servicio tecnico.png" alt="icono">
                   <li><a href="servicio-tecnico.jsp">Servicio Tecnico</a></li>
             </div>
            
             <div class="container-categorias">
                    <img class="icono-menu" src="icon/history.png" alt="icono">
                    <li><a href="historial.jsp">Historial Tecnico</a></li>
             </div>
            
             <div class="container-categorias">
                    <img class="icono-menu" src="icon/help.png" alt="icono">
                    <li><a href="#">Ayuda</a></li>
             </div>
            
            </ul>
          </div>

         
            
            <!--contenedor imagenes ayuda-->
            <div class="container-help">
                <h3>Ayuda</h3>
                <div class="con-img-help">
                    <div class="img-help">
                        <img src="img/support.png" alt="">
                        <a href="">Soporte</a>
                    </div>
                    <div class="img-help">
                        <img src="img/manual.png" alt="">
                        <a href="">Manual usuario</a>
                    </div>
                    <div class="img-help">
                        <img src="img/problem.png" alt="">
                        <a href="">Preguntas</a>
                    </div>
                </div>
            </div>
        </div>  
   

<script src="js/motosoft.js"></script>
</body>

</html>