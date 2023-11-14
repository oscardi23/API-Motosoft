<%-- 
    Document   : servicio
    Created on : 7/11/2023, 10:48:05 p. m.
    Author     : Oscar Diaz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Servicio</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200&family=Ubuntu:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
</head>  
<body >
<!-- estructura barra de navegacion-->

    <nav class="nav-services">
        <div class="container-setup">
            <a class="btn-main" href="ajustes.jsp">Ajustes</a>
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
                    <li><a href="ayuda.jsp">Ayuda</a></li>
             </div>
            
            </ul>
          </div>
          <!--contenedor principal -->
        <div class="container-form-services">     
            <!--contenedor formulario registro-->
        <div class="container-reg-serv">
            
                <h2>Solicitar servicio</h2>
             <form>
                <!-- Primera fila -->
             <div class="fila-registro">
                
                
                <div class="input-form-list">
                    <label for="selecc-veh">Seleccionar vehículo:</label>
                    <select  id="selecc-veh" name="selecc-veh" required >
                        <option value="">Seleccione una opción</option>
                        <option value="opcion1">Vehículo 1</option>
                        <option value="opcion2">Vehículo 2</option>
                        <option value="opcion3">Vehículo 3</option>
                        <!-- Agrega más opciones según tus necesidades -->
                    </select>
                </div>
                <div class="input-form-list">
                    <label for="serv">Servicios:</label>
                    <select  id="serv" name="serv" required >
                        <option value="">Seleccione una opción</option>
                        <option value="opcion1">Revisión</option>
                        <option value="opcion2">Garantía</option>
                        <option value="opcion3">Mantenimiento</option>
                        <!-- Agrega más opciones según tus necesidades -->
                    </select>
                </div>
                <div class="input-form-list">
                    <label for="tipo-serv">Tipo de servicio:</label>
                    <select  id="tipo-serv" name="tipo-serv" required >
                        <option value="">Seleccione una opción</option>
                        <option value="opcion1">1ra Revisión</option>
                        <option value="opcion2">Sincronización</option>
                        <option value="opcion3">Defecto de pieza</option>
                        <!-- Agrega más opciones según tus necesidades -->
                    </select>
                </div>
                
             </div>

               
            
                     <!--botones-->
                <div class="btn-password">
                    <a class="btn-main-s" href="/html/login.html" style="text-decoration: none;">Solicitar</a>
                    
                </div>
            </form>
        </div>
            
            
            <div class="container-btn-serv">
                <div class="btn-servicio" style="margin-top: 10px; padding: 0%; height: 50px;">
                    <h3>Servicio solicitado con exito</h3>
                </div>
                <!--botones-->
                <div class="btn-serv">
                    <a class="btn-main-s" href="/html/login.html" style="text-decoration: none;">Agendar</a>
                   
                    <a class="btn-main-s" href="/html/login.html" style="text-decoration: none;">Cancelar</a>
                </div>

            </div> 
    </div>
    </div>
    <script src="js/motosoft.js"></script>
</body>

</html>