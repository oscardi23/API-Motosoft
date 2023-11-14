<%-- 
    Document   : reg_motocicleta
    Created on : 7/11/2023, 10:28:45 p. m.
    Author     : Oscar Diaz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <html>
        <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Registro motocicleta</title>
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
            <div class="container-reg-serv">

                    <h2>Registro Motocicleta</h2>
                    <form action="RegistroMotocicleta" method="post">
                        
                       <div class="fila-registro">
                        <div class="input-form-reg">
                            <label class="form-label" for="idUsuario"> Usuario:</label>
                           <input type="text" id="idUsuario" name="idUsuario" value="<%= session.getAttribute("correoUsuario") %>" required>
                        </div>
                       </div>   
                    <!-- Primera fila -->
                    <div class="fila-registro">
                        <div class="input-form-reg">
                            <label class="form-label" for="placa"> Numero Placa:</label>
                            <input type="text" id="placa" name="placa" required>
                        </div>
                        <div class="input-form-reg">
                            <label for="modelo">Modelo:</label>
                            <input type="number" id="modelo" name="modelo" required min="2010" max="2500">

                        </div>
                        <div class="input-form-list">
                            <label for="linea">Linea:</label>
                            <select id="linea" name="linea" required>
                                <option value="">Seleccione una opción</option>
                                <option value="Eco Delexe">Eco Deluxe</option>
                                <option value="Thirller">Thriller</option>
                                <option value="Dash">Dash</option>
                                <!-- Agrega más opciones según tus necesidades -->
                            </select>
                        </div>

                    </div>

                    <!-- Segunda fila -->
                    <div class="fila-registro">
                        <div class="input-form-list">
                            <label for="color">Color:</label>
                            <select id="color" name="color">
                                <option value="">Seleccione un color</option>
                                <option value="rojo">Rojo</option>
                                <option value="verde">Verde</option>
                                <option value="azul">Azul</option>
                                <option value="morado">Morado</option>
                            </select>
                        </div>

                        <div class="input-form-list">
                            <label for="cilindraje">Cilindraje:</label>
                            <select id="cilindraje" name="cilindraje">
                                <option value="">Seleccione una opcion</option>
                                <option value="100cc">100cc</option>
                                <option value="110cc">110cc</option>
                                <option value="125cc">125cc</option>
                                <option value="150cc">150cc</option>
                            </select>
                        </div>
                        <div class="input-form-reg">
                            <label for="compra">Fecha Compra:</label>
                            <input type="date" id="compra" name="compra" required>
                        </div>
                    </div>
                    <!-- Tercera fila -->
                    <div class="fila-registro">
                        <div class="input-form-reg">
                            <label for="n-chasis">Numero Chasis:</label>
                            <input  type="text" id="n-chasis" name="chasis"  required>
                        </div>
                        <div class="input-form-reg">
                            <label for="n-motor">Numero Motor:</label>
                            <input type="text" id="n-motor" name="motor" pattern="[A-Za-z0-9_]+" required>
                        </div>
                        <div class="input-form-list">
                            <label for="marca">Marca:</label>
                            <select id="marca" name="marca">
                                <option value="">Seleccione una Marca</option>
                                <option value="Honda">Honda</option>
                                <option value="Hero">Hero</option>
                                <option value="Akt">Akt</option>
                                <option value="Otro">Otro</option>
                            </select>
                        </div>   
                </div>

                         <!--botones-->
                    <div class="">
                        <input class="btn-main-s" type="submit" value="Registrar" style="height: 1.75rem; margin-right: 20px;" >
                        <a class="btn-main-s" href="html/Password_Codigo.html" style="text-decoration: none;">Cancelar</a>
                    </div>
                </form>
            </div>

                <!--contemedor formulario segindo-->
                <div class="container-sec-services">

                    <!--tabla-->
                <div id="contenedor-tabla">
                <div style=" display: flex; align-items: center; justify-content: center;">
                    <h3>Vehiculos Registrados</h3>
                </div>
                    <table>
                        <thead>
                            <tr>
                                <th>Línea</th>
                                <th>Marca</th>
                                <th>Modelo</th>
                                <th>Cilindraje</th>
                                <th>Placa</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${vehiculos}" var="vehiculo">
                            <tr>
                                <td>${vehiculo.linea}</td>
                                <td>${vehiculo.marca}</td>
                                <td>${vehiculo.modelo}</td>
                                <td>${vehiculo.cilindraje}</td>
                                <td>${vehiculo.placa}</td>
                                <td>
                                    <button class="btn-main-x" onclick="eliminarMotocicleta('${vehiculo.placa}')">Eliminar</button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>


                
                
            </div>

          </div> 
        </div>
        </div>
        <script src="js/motosoft.js"></script>
    </body>

    </html>
