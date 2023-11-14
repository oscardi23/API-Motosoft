/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ServletServicios;

import conexion.conexionbd;
import logica.RegistroVehiculo;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class RegistroMotocicleta extends HttpServlet {

   @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
            // Obtén los parámetros del formulario
            String idUsuario = request.getParameter("idUsuario");
            String placa = request.getParameter("placa");
            int modelo = Integer.parseInt(request.getParameter("modelo"));
            String linea = request.getParameter("linea");
            String color = request.getParameter("color");
            String cilindraje = request.getParameter("cilindraje");
            String fechaCompra = request.getParameter("compra");
            String numeroChasis = request.getParameter("chasis");
            String numeroMotor = request.getParameter("motor");
            String marca = request.getParameter("marca");
            
            
            // Agregar depuración
            System.out.println("Placa: " + placa);
            System.out.println("Modelo: " + modelo);
            System.out.println("Línea: " + linea);
            System.out.println("Color: " + color);
            System.out.println("Cilindraje: " + cilindraje);
            System.out.println("Fecha de Compra: " + fechaCompra);
            System.out.println("Número de Chasis: " + numeroChasis);
            System.out.println("Número de Motor: " + numeroMotor);
            System.out.println("Marca: " + marca);


            // Crea una instancia de conexionbd
            conexionbd bd = new conexionbd();
            bd.conectar();
            
            RegistroVehiculo registro = new RegistroVehiculo();
         
             // Verifica si la placa ya está registrada
      // Verifica si la placa no está registrada
if (registro.placaNoRegistrada(bd, placa)) {
    // La placa no está registrada, procede con la inserción
    boolean registroExitoso = registro.insertarMotocicleta(idUsuario, placa, modelo, linea, color, cilindraje, fechaCompra, numeroChasis, numeroMotor, marca);

    if (registroExitoso) {
        // Redirige al usuario a una página de éxito
        response.sendRedirect("registro_exitosomoto.jsp");
    } else {
        // Redirige al usuario a una página de error en caso de fallo en la inserción
        response.sendRedirect("error_placaduplicada.jsp");
    }
} else {
    // La placa ya está registrada, redirige al usuario a una página de error
    response.sendRedirect("error_placaduplicada.jsp");
}
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
