/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ServletUsuarios;


import conexion.conexionbd;


import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.sql.SQLException;
import jakarta.servlet.http.HttpSession;
import jakarta.ws.rs.POST;
import logica.InsertarImagenPerfil;

/**
 * @author Oscar Diaz
 */
public class RecibirDatos extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RecibirDatos</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RecibirDatos at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

   @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    
    
    String usuario = request.getParameter("usuario");
    String contrasena = request.getParameter("clave");

    conexionbd app = new conexionbd();
    app.conectar();
    
    
    
  
    String nombreDeUsuario = app.obtenerNombreDeUsuario(usuario);

    System.out.println("Nombre de usuario obtenido: " + nombreDeUsuario);
        
        
    String correoUsuario = app.obtenerCorreoUsuario(usuario);
        
        
    InsertarImagenPerfil imagen = new InsertarImagenPerfil();
    String fileName = imagen.obtenerRutaImagenDeLaBaseDeDatos(usuario);
    
     System.out.println("Nombre de usuario obtenido recibir datos: " + fileName);
// Asegúrate de que fileName no sea nulo antes de guardarlo en la sesión
  
String rutaDeImagen = "uploads/" + fileName;

 HttpSession session = request.getSession();
    session.setAttribute("correoUsuario", correoUsuario);
     session.setAttribute("nombreDeUsuario", nombreDeUsuario);

// Asegúrate de que fileName no sea nulo antes de guardarlo en la sesión
if (fileName != null) {
    //HttpSession session = request.getSession();
    
   // HttpSession session = request.getSession();
   // session.setAttribute("correoUsuario", correoUsuario);
    session.setAttribute("rutaDeImagen", rutaDeImagen);
   
    System.out.println("Esta es la ruta del servlet recibir datos: " + rutaDeImagen);
    // También puedes guardar otros valores en la sesión si es necesario
   
}
   


    if (app.validarUsuario(usuario, contrasena)) {
        
       
         
        if (app.validarUsuario(usuario, contrasena)) {
            response.sendRedirect("Bienvenida.jsp");
        } else {
            response.sendRedirect("credencialesincorrectas.html");
        }
    }
}


  

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}