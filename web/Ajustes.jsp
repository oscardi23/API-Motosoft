
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajustes</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200&family=Ubuntu:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <!-- estructura barra de navegacion-->

    <nav class="nav-services">
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
            
            <div class="titulo-ajustes"> 
                <h3>Ajustes</h3>
            </div>
            <!--contenedor formulario registro-->

            <%

                String correoDeUsuario = (String) session.getAttribute("nombreDeUsuario");
            %>
            <div class="container-reg-serv">
                <div class="container-account">
                    <a href="imagenUser.jsp" class="btn-main-s" name="Agregarimagen">Agregar Imagen</a>
                    <a class="" href="#"><%= correoDeUsuario%></a>
                    <img id="user-image" src="<%= session.getAttribute("rutaDeImagen")%>" style="width: 90px; height: 90px; border-radius: 40px  40px; padding: 0px"   alt="img.png">

                    <%  System.out.println("sisisisis" + correoDeUsuario);%>
          
        </div>
         
               
                <h2 id="titulo-cuenta">Cuenta</h2>
             <form>
                <!-- Primera fila -->
             <div class="fila-registro">
                <div class="input-form-reg">
                    <label class="form-label" for="titular"> Titular de cuenta:</label>
                    <input type="text" id="titular" name="usuario" required>
                </div>
                <div class="input-form-reg">
                    <label class="form-label" for="usuario"> Correo:</label>
                    <input type="text" id="correo" name="correo" required>
                </div>
                
               
             </div>
                 <!-- segunda fila -->
                 <div class="fila-registro">
                    <div class="input-form-reg">
                        <label class="form-label" for="usuario"> Teléfono:</label>
                        <input type="tel" id="teléfono" name="teléfono" required>
                    </div>
                    <div class="input-form-reg">
                        <label class="form-label" for="usuario"> Fecha de nacimiento:</label>
                        <input type="date" id="nacimiento" name="nacimiento" required>
                    </div>
                    
                   
                 </div>
    
               
            
                     <!--botones-->
                <div class="btn-password">
                    <a class="btn-main-s btn-password" href="/html/login.html" style="text-decoration: none;">Editar</a>
                    <a class="btn-main-s btn-password" href="/html/login.html" style="text-decoration: none;">Guardar</a>
                </div>
            </form>
        </div>

          <!--contenedor segundo -->
          <div class="container-reg-serv">
            
            <h2 id="titulo-contraseña">Cambio de contraseña</h2>
         <form>
            <!-- Primera fila -->
         <div class="fila-registro" style="width: 700px; justify-content: center;" >
            <div class="input-form-reg">
                <label class="form-label" for="usuario"> Contraseña:</label>
                <input type="password" id="contraseña" name="contraseña" required>
            </div>
            <div class="input-form-reg">
                <label class="form-label" for="usuario"> Confirmar contraseña:</label>
                <input type="password" id="contraseña" name="contraseñ" required>
            </div>
            
           
         </div>
           
           
        
                 <!--botones-->
            <div class="btn-password" style="width: 700px; display: flex; align-items: center; justify-content: center; ">
                <a class="btn-main-s" href="/html/login.html" style="text-decoration: none;">Nueva contraseña</a>
                <a class="btn-main-s" href="/html/login.html" style="text-decoration: none;">Guardar contraseña</a>
            </div>
        </form>
    </div>
        <!--eliminar cuenta-->
        <div style="margin-bottom: 20px">
            <a style="align-items: center; text-align: center; " class="btn-main-s">Eliminar cuenta</a>
        </div>
              
    </div>
     
    </div>
    </div>
    <script src="js/motosoft.js"></script>
    </body>
</html>
