/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ServletServicios;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import logica.DatosBD;
import logica.DatosBD.Vehiculo; // Asegúrate de que la importación sea correcta y que refleje la ubicación real de la clase Vehiculo



@WebServlet("/MostrarVehiculosServlet")
public class MostrarVehiculosServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DatosBD datosBD = new DatosBD();
       
        List<Vehiculo> vehiculos = datosBD.obtenerDatosDesdeBD(); // Utiliza el método definido en el Paso 1
        
        // Almacena la lista de vehículos en el objeto de solicitud
        request.setAttribute("vehiculos", vehiculos);
        
        // Redirige a la página JSP para mostrar los datos
        RequestDispatcher dispatcher = request.getRequestDispatcher("mostrar_vehiculos.jsp");
        dispatcher.forward(request, response);
    }
}
