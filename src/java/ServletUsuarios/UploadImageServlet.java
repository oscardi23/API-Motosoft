package ServletUsuarios;

import logica.InsertarImagenPerfil;
import conexion.conexionbd;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/UploadImageServlet")
@MultipartConfig
public class UploadImageServlet extends HttpServlet {

    @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String uploadPath = "C:\\Users\\Oscar Diaz\\Documents\\nmotosoft\\web\\uploads";
   
    File uploadDir = new File(uploadPath);

    String correoDeUsuario = request.getParameter("idUsuario");

    if (!uploadDir.exists()) {
        uploadDir.mkdirs();
    }

    Part filePart = request.getPart("fileImagen");
    String fileName = getSubmittedFileName(filePart);
    System.out.println("Nombre del archivo: " + fileName);

    if (fileName != null && !fileName.isEmpty()) {
        File file = new File(uploadDir, fileName);
        try (InputStream fileContent = filePart.getInputStream()) {
            Files.copy(fileContent, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
        }

        // Imprime la ruta de la imagen en la consola
        System.out.println("Ruta de la imagen: " + file.getAbsolutePath());
        
        // Crea una instancia de la clase conexionbd
        conexionbd bd = new conexionbd();

        // Conecta a la base de datos
        bd.conectar();

        InsertarImagenPerfil app = new InsertarImagenPerfil();

        // Ruta de la imagen
        String rutaDeImagen = file.getAbsolutePath();

        // Inserta la imagen en la base de datos
        app.insertarImagenPerfil(correoDeUsuario, rutaDeImagen, fileName);

        System.out.println("Ruta de la imagen insertada en la base de datos: " + rutaDeImagen);
        
        HttpSession session = request.getSession();
        session.setAttribute("fileName", "uploads/" + fileName);

        // Cierra la conexión a la base de datos
        bd.desconectar();
        
        response.sendRedirect("img_insertada.jsp"); // Página de confirmación
        
    } else {
        response.sendRedirect("imgNoEncontrada.jsp"); // Página de error si no se proporciona un archivo
    }
}

    private String getSubmittedFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                System.out.println("Nombre del archivo: " + content.substring(content.indexOf('=') + 1).trim().replace("\"", ""));
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        System.out.println("Error: esta aq1uiiiiiiiii.");
        return null;
    }
    
   
    
    
    @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // Recupera la información del usuario de la sesión
      System.out.println("Método doGet del servlet llamado");
    HttpSession session = request.getSession();
    String correoUsuario = (String) session.getAttribute("correoDeUsuario");

    // Crear una instancia de la clase InsertarImagenPerfil
    InsertarImagenPerfil imageProfileManager = new InsertarImagenPerfil();

    // Recupera la ruta de la imagen de perfil desde la base de datos
    String rutaImagen = imageProfileManager.obtenerRutaImagenDeLaBaseDeDatos(correoUsuario);

    if (rutaImagen != null) {
        // Lee la imagen desde la ruta (o la base de datos, según tu implementación)
        byte[] imagenBytes = imageProfileManager.leerImagenDesdeRuta(rutaImagen);
        System.out.println("aqui esta"+ rutaImagen);

        if (imagenBytes != null) {
            // Configura la respuesta como una imagen
            response.setContentType("image/jpeg"); // Puedes cambiar esto según el formato de la imagen
                    
            // Escribe la imagen en la respuesta
            ServletOutputStream out = response.getOutputStream();
            out.write(imagenBytes);
            out.close();
        }
    }
}

    

}



