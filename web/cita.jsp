<%-- 
    Document   : cita
    Created on : 7/11/2023, 10:49:20 p. m.
    Author     : Oscar Diaz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cita</title>
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
                    <li><a href="ayuda.jsp">Ayuda</a></li>
             </div>
            
            </ul>
          </div>
          <!--contenedor principal -->
        <div class="container-cita">   
            <h2 id="titulo-cita">Asignar Cita</h2>

            <!--contenedor mensaje vehiculo seleccionado-->
            <div class="send-cont-cita">
                <input type="text" id="input-element" placeholder="información vehiculo asignado">
            </div>
            <div class="disponibilidad">
                <div id="boton-dispon">
                    <a href="" class="btn-main-s">Consultar disponibilidad</a>
                </div>
                <div class="date-cita">
                    <label for="date-sol">Fecha Solicitud</label>
                    <input id="date-sol" class="input-form" type="datetime-local" >
                </div>
            </div>    
            <!--contenedor consultar cita -->
        <div class="container-reg-serv">
            
               
               
             <form>
                <!-- Primera fila -->
             <div class="fila-registro">
                <div class="input-form-list">
                    <label class="form-label" for="f-sistema"> Fecha Sistema:</label>
                    <input type="date" id="f-sistema" name="f-sistema" required>
                </div>
                <div class="input-form-reg">
                    <label for="hora">Hora:</label>
                    <input type="datetime" id="hora" name="hora" required >

                </div>
                <div class="input-form-reg">
                    <label for="turno">Turno:</label>
                    <input type="number" id="turno" name="turno" >

                </div>
                
                
             </div>

               
            
                     <!--botones-->
                <div class="btn-password">
                    <a class="btn-main-s" href="/html/login.html" style="text-decoration: none;">Aceptar</a>
                    
                </div>
                <div style="display: flex; width: auto;">
                    <a href="" style="color: white;" > Generar otra fecha disponible</a> 
                    </div>
            </form>
        </div>
        <div class="container-reg-serv">
            
               
               
            <form>
               <!-- Primera fila -->
            <div class="fila-registro">
               <div class="input-form-list">
                   <label class="form-label" for="f-disp"> Disponibilidad:</label>
                   <input type="date" id="f-disp" name="f-sistema" required>
               </div>
              
               <div class="input-form-reg">
                   <label for="f-manual">Fecha Manual:</label>
                   <input type="date" id="f-manual" name="f-manual" >

               </div>
               <div class="input-form-reg">
                <label for="h-manual">Hora:</label>
                <input type="datetime" id="h-manual" name="hora-manual" required >

            </div>
               
               
            </div>

              
           
                    <!--botones-->
               <div class="btn-password">
                   <a class="btn-main-s" href="/html/login.html" style="text-decoration: none;">Aceptar</a>
                   <a class="btn-main-s" href="/html/login.html" style="text-decoration: none;">Cancelar</a>
                   
               </div>
               <div class="send-cita">
                <input type="text" id="send-cita" placeholder="información cita asignada">
            </div>
            
           </form>
           <div>
            <a class="btn-main-s" href="/html/login.html" style="text-decoration: none;">Descargar</a>
           <a class="btn-main-s" href="/html/login.html" style="text-decoration: none;">Imprimir</a>
            
        </div>
       </div>
       
    </div>
    </div>
    <script src="js/motosoft.js"></script>
</body>

</html>