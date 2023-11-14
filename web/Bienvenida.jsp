<%-- 
    Document   : Bienvenida
    Created on : 3/11/2023, 11:29:19 p. m.
    Author     : Oscar Diaz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bienvenida</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200&family=Ubuntu:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
   </head> 
<body >
<!-- estructura barra de navegacion-->

    <nav  class="nav-services">
        <div class="container-setup">
            <a class="btn-main" href="Ajustes.jsp">Ajustes</a>
            <img class="setup"    src="icon/ajustes.png" alt="img.png">
        </div>
        <div class="menu">
            <ul class="main-menu menu">
                <li><a href="CerrarSesionServlet">Cerrar Sesion</a></li>   
            </ul>
        </div>
        
        
            <%
                String rutaDeImagen = (String) request.getAttribute("rutaDeImagen");
                
            %>
        <div class="container-account">
            <a class="" href="#"><%= session.getAttribute("nombreDeUsuario")%></a>
            <img id="user-image" src="<%= session.getAttribute("rutaDeImagen")%>" style="width: 40px; height: 40px; border-radius:20px;"   alt="img.png">                    
        </div>
        <%  System.out.println("esta es la ruta de la imagen en jsp"+ rutaDeImagen); %>


        
    </nav>

            <!--contenedor de menus y formularios-->
            <div class="container-main-services">
                <!-- contenedor de menu-->
                <div class="menu-services">
                    <!--icono menu-->
                    <div class="menu-main">
                        <img src="icon/menu.png" alt="Icono de menú"  id="menu-icon">
                        <a id="menu_icon" href="">Menu</a>
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
                            <li><a href="ayuda.jsp">Ayuda</a></li>
                        </div>

                    </ul>
                </div>
                <!--contenedor principal -->
                <div class="container-form-services">     



                    <div class="container-bienvenida">
                        <h2>Bienvenido a Motosoft</h2>

                    </div>
                    <div class="contenedor-mensajes-princp">

                        <div class="contenedor-noticias">
                            <div class="noticia noti-1">
                                <h2>Siempre utiliza aceite geniunos</h2>
                                <img id="img-aceite"  src="img/aceite.png" alt="img-aceite">    
                            </div>
                            <div class="noticia noti-2">
                                <h2>Utiliza el casco seguridad</h2>
                                <img src="img/casco-mujer-seguridad.webp" alt="">
                            </div>
                            <div class="noticia noti-3">
                                <h2>Revisa periodicamente el nivel de aceite de tu motocicleta</h2>
                                <img src="img/nivel-motor.jpg" alt="nivel-aceite">


                            </div>
                        </div>
                    </div>

    <script src="js/motosoft.js"></script>
    <script src="js/agregarImagen.js"></script>

</body>

</html>