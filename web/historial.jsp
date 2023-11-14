<%-- 
    Document   : historial
    Created on : 7/11/2023, 10:54:11 p. m.
    Author     : Oscar Diaz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Historial</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200&family=Ubuntu:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
</head> 
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
        <div class="container-form-services">     
            <!--contenedor formulario registro-->
            <div class="input-form-reg" style="display: flex; flex-direction: column; width: 40rem; height: 5rem; color: white; justify-content: center; align-items: center;">
                <label class="input-form-reg" for="placa">Placa:</label>
                <input class="input-form-reg" type="text" id="placa" name="placa" style="border-radius: 5px; height: 25px;" required>
            </div>
            
            <!--contenedor formulario segindo-->
            <div class="container-sec-services">
              
                <!--tabla 1-->
            <div id="contenedor-tabla">
                <div style=" display: flex; align-items: center; justify-content: center;">
                    <h3 style="color: white;">Historial tecnico vehiculo</h3>
                </div>
                <table>
                    <thead>
                        <tr>
                            <th>Placa</th>
                            <th>Linea</th>
                            <th>Nombre Cliente</th>
                            <th>Numero cedula</th>
                            <th>Marca</th>
                            <th>Modelo</th>
                            <th>Seleccionar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>LJA83E </td>
                            <td>eco dlx</td>
                            <td>julian</td>
                            <td>10612562</td>
                            <td>Hero</td>
                            <td>2019</td>
                            <td><input type="checkbox"></td>
                        </tr>
                    
                   
                    </tbody>
                
                </table>
                <!--boton-->
                <div class="btn-serv-tec" style="width: 700px; display: flex; justify-content: space-around; ">
                    <a class="btn-main-s btn-password " href="/html/login.html" style="text-decoration: none; width: auto;">Consultar</a>
                    
                
                </div>
            </div>

      </div>

      

      <!--segunda tabla-->
       <!--contenedor formulario segindo-->
       <div class="container-sec-services">
              
        <!--tabla 2-->
    <div id="contenedor-tabla">
        <div style=" display: flex; align-items: center; justify-content: center;">
            <h3 style="color: white;">Historial</h3>
        </div>
        <table>
            <thead>
                <tr style="font-size: 12px;">
                    <th>Id Historial</th>
                    <th>N. Cita</th>
                    <th>Tecnico</th>
                    <th>Fecha</th>
                    <th>Novedades</th>
                    <th>Diagnostico</th>
                    <th>Servicio</th>
                    <th>Estado</th>
                    <th>Recomendaciones</th>
                </tr>
            </thead>
            <tbody>
                <tr style="font-size: 12px;">
                    <td>001</td>
                    <td>004</td>
                    <td>Wilson sanchez</td>
                    <td>7/08/2023</td>
                    <td>humo azul en las mañanas</td>
                    <td>revisar nivel aceite</td>
                    <td>revision 6000km</td>
                    <td>completo</td>
                    <td>Nivel aceite</td>
                    
                </tr>
            
           
            </tbody>
        
        </table>
        <!--boton-->
        <div class="btn-serv-tec" style="width: 700px; display: flex; justify-content: space-around; ">
            <a class="btn-main-s btn-password " href="/html/login.html" style="text-decoration: none; width: auto;">Editar</a>
            <a class="btn-main-s " href="/html/login.html" style="text-decoration: none; width: auto; ">Guardar</a>
           
        
        </div>
    </div>

</div>
<!--botones descargar-->
<div class="btn-serv-tec" style="width: 700px; display: flex; justify-content: space-around; ">
    <a class="btn-main-s btn-password " href="/html/login.html" style="text-decoration: none; width: auto;">Descargar</a>
    <a class="btn-main-s " href="/html/login.html" style="text-decoration: none; width: auto; ">Imprimir    </a>

</div>
    </div>
    </div>
    <script src="js/motosoft.js"></script>
</body>

</html>