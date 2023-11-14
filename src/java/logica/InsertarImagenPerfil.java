/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package logica;

import conexion.conexionbd;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class InsertarImagenPerfil {
    private conexionbd bd;

    public InsertarImagenPerfil() {
        bd = new conexionbd();
        bd.conectar(); // Establece la conexión a la base de datos
    }

    public void insertarImagenPerfil(String nombreDeUsuario, String rutaDeImagen, String fileName) {
        Connection connection = bd.getSQLConexion();
        PreparedStatement preparedStatement = null;

        if (rutaDeImagen != null) {
            try {
                // Sentencia SQL para insertar la ruta de la imagen y el nombre de usuario en la tabla
                String sql = "INSERT INTO imgperfil (correo_usuario, ruta, nombre_img) VALUES (?, ?, ?)";
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, nombreDeUsuario);
                preparedStatement.setString(2, rutaDeImagen);
                preparedStatement.setString(3, fileName);


                // Ejecutar la inserción en la base de datos
                preparedStatement.executeUpdate();

                System.out.println("Datos insertados con éxito.");
            } catch (SQLException e) {
                // Manejo de excepciones: registra o maneja el error de acuerdo a tus necesidades
                e.printStackTrace();
            } finally {
                // Cerrar recursos
                bd.desconectar(); // Cierra la conexión a la base de datos
            }
        } else {
            System.out.println("Ruta de imagen nula, no se realizará la inserción en la base de datos.");
        }
    }

    public String obtenerRutaImagenDeLaBaseDeDatos(String correoUsuario) {
    Connection connection = bd.getSQLConexion();
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    String fileName = null;

    try {
        String sql = "SELECT nombre_img FROM imgperfil WHERE correo_usuario = ?";
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, correoUsuario);
        resultSet = preparedStatement.executeQuery();

        if (resultSet.next()) {
            fileName = resultSet.getString("nombre_img");
            System.out.println("Valor de fileName obtenido: " + fileName); // Imprime el valor de fileName
        } else {
            System.out.println("No se encontró una imagen para el usuario: " + correoUsuario);
        }
    } catch (SQLException e) {
        e.printStackTrace();
        // Puedes manejar este error de una manera más específica si lo deseas.
        System.err.println("Error SQL al obtener la ruta de la imagen: " + e.getMessage());
    } finally {
        try {
            if (resultSet != null) {
                resultSet.close();
            }
            if (preparedStatement != null) {
                preparedStatement.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Error al cerrar los recursos: " + e.getMessage());
        }
    }

    return fileName;
}


public byte[] leerImagenDesdeRuta(String ruta) {
    try {
        Path rutaImagen = Path.of(ruta);
        return Files.readAllBytes(rutaImagen);
    } catch (IOException e) {
        e.printStackTrace();
        System.err.println("Error al leer la imagen desde la ruta: " + e.getMessage());
    }
    return null;
}
}
