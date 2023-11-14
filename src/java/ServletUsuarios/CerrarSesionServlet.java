package ServletUsuarios;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession; // Asegúrate de importar la clase HttpSession

public class CerrarSesionServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
         System.out.println("El método doGet se ha ejecutado cuando se accedió al enlace.");
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        
         System.out.println("El método doGet se ha ejecutado cuando se accedió al enlace.");
        // Redirige al usuario a la página de inicio de sesión u otra página relevante.
        response.sendRedirect("index.html");
    }

    

    
}
