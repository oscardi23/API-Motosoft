package conexion;



import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class conexionbd {
    private Connection SQLConexion;

    public static void main(String[] args) {
        conexionbd app = new conexionbd();
        app.conectar(); // Paso 1: Establecer la conexión a la base de datos
     //    String usuario = "yurlady@gmail.com";
    //String contrasena = "ruiz";
    //boolean credencialesValidas = app.validarUsuario(usuario, contrasena);
   
    String nombreUsuario = "oscar fabian"; // Reemplaza con un nombre de usuario válido
    String correoUsuario = app.obtenerCorreoUsuario(nombreUsuario);

    if (correoUsuario != null) {
        System.out.println("Correo del usuario este: " + correoUsuario);
    } else {
        System.out.println("Usuario no encontrado o correo no disponible.");
    }

    
    
    String usuario = "osgredo23@gmail.com"; // Reemplaza con el usuario ingresado en el formulario
       String contraseña = "oscardiaz"; // Reemplaza con la contraseña ingresada en el formulario

        if (app.validarUsuario(usuario, contraseña)) {
            System.out.println("Credenciales válidas, acceso concedido.");
        } else {
            System.out.println("Credenciales inválidas, acceso denegado.");
        }
        
      /*   // Valores de ejemplo para la inserción de un nuevo usuario
    String tipoUsuario = "Cliente";
    String nombres = "Juan";
    String apellidos = "Pérez";
    String nCedula = "12542554";
    String fechaNacimiento = "1990-01-15";
    String correo = "sol@example.com";
    String telefono = "555-555-5555";
    String nombreUsuario = "juanperez";
    String contrasena = "mypassword";

    // Llama al método registrarUsuario para insertar un nuevo usuario en la base de datos
    app.registrarUsuario(tipoUsuario, nombres, apellidos, nCedula, fechaNacimiento, correo, telefono, nombreUsuario, contrasena);

    // Desconecta la base de datos
    app.desconectar(); */

    
    }

    public void conectar() {
        // Configuración de la conexión a la base de datos
        String usuario = "root";
        String password = "";
        String host = "localhost";
        String puerto = "3306";
        String namebd = "motosoft";
        String driver = "com.mysql.cj.jdbc.Driver";
        String databaseURL = "jdbc:mysql://" + host + ":" + puerto + "/" + namebd + "?useSSL=false";

        try {
            Class.forName(driver);
            SQLConexion = DriverManager.getConnection(databaseURL, usuario, password);
            System.out.println("Conexión exitosa a la base de datos.");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public Connection getSQLConexion() {
    return SQLConexion;
}

    
    public void desconectar() {
        try {
            if (SQLConexion != null) {
                SQLConexion.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    
    
   // Método para validar un usuario y contraseña
    public boolean validarUsuario(String nombre, String contraseña) {
        // Consulta SQL para verificar las credenciales
        String query = "SELECT * FROM usuarios WHERE correo = ? AND contraseña = ?";
        try (PreparedStatement statement = SQLConexion.prepareStatement(query)) {
            statement.setString(1, nombre);
            statement.setString(2, contraseña);
            ResultSet resultSet = statement.executeQuery();
            return resultSet.next(); // Si hay resultados, las credenciales son válidas
        } catch (SQLException e) {
            e.printStackTrace();
            return false; // Error en la validación
        }
    }
    
public boolean registrarUsuario(String tipoUsuario, String nombres, String apellidos, String nCedula, String fechaNacimiento, String correo, String telefono, String nombreUsuario, String contrasena) {
    // Consulta SQL para verificar si ya existe un usuario con el mismo correo o número de cédula
    String consultaDuplicados = "SELECT * FROM usuarios WHERE correo = ? OR n_cedula = ?";
    
    try (PreparedStatement statement = SQLConexion.prepareStatement(consultaDuplicados)) {
        statement.setString(1, correo);
        statement.setString(2, nCedula);
        ResultSet resultSet = statement.executeQuery();
        
        if (resultSet.next()) {
            // Si hay resultados, significa que ya existe un usuario con datos similares
            System.err.println("Error: El usuario con este correo o número de cédula ya existe.");
            return false; // Indica que el registro no fue exitoso
        } else {
            // Si no hay resultados, procede con la inserción del nuevo usuario
            String query = "INSERT INTO usuarios (tipo_usuario, nombres, apelidos, n_cedula, fecha_nacimiento, correo, telefono, nombre_usuario, contraseña) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement insertStatement = SQLConexion.prepareStatement(query)) {
                insertStatement.setString(1, tipoUsuario);
                insertStatement.setString(2, nombres);
                insertStatement.setString(3, apellidos);
                insertStatement.setString(4, nCedula);
                insertStatement.setString(5, fechaNacimiento);
                insertStatement.setString(6, correo);
                insertStatement.setString(7, telefono);
                insertStatement.setString(8, nombreUsuario);
                insertStatement.setString(9, contrasena);
                insertStatement.executeUpdate();
                System.out.println("Registro de usuario exitoso.");
                return true; // Indica que el registro fue exitoso
            } catch (SQLException e) {
                System.err.println("Error al registrar usuario: " + e.getMessage());
                return false; // Indica que el registro no fue exitoso debido a un error
            }
        }
    } catch (SQLException e) {
        System.err.println("Error al verificar duplicados: " + e.getMessage());
        return false; // Indica que el registro no fue exitoso debido a un error
    }
}



public String obtenerNombreDeUsuario(String usuarioNombre) {
    String nombreDeUsuario = null;
    String query = "SELECT nombres FROM usuarios WHERE correo = ?";

    try {
        PreparedStatement preparedStatement = SQLConexion.prepareStatement(query);
        preparedStatement.setString(1, usuarioNombre);
        ResultSet resultSet = preparedStatement.executeQuery();

        if (resultSet.next()) {
            nombreDeUsuario = resultSet.getString("nombres");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return nombreDeUsuario;
}


public String obtenerCorreoUsuario(String correoUsuario) {
    String CorreoUsuario = null;
    String query = "SELECT correo FROM usuarios WHERE correo = ?";

    try {
        PreparedStatement preparedStatement = SQLConexion.prepareStatement(query);
        preparedStatement.setString(1, correoUsuario);
        ResultSet resultSet = preparedStatement.executeQuery();

        if (resultSet.next()) {
            CorreoUsuario = resultSet.getString("correo");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    
    // Agrega declaraciones para imprimir información útil
    System.out.println("Consulta SQL: " + query);
    System.out.println("Correo obtenido: " + CorreoUsuario);

    return CorreoUsuario;
}





}
