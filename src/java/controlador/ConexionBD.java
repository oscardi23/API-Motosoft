/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controlador;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class ConexionBD {
    private Connection connection;
    private String jdbcUrl = "jdbc:mysql://localhost:3306/motosoft";
    private String jdbcUser = "root";
    private String jdbcPassword = "";

    public void conectar() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPassword);
    }

    public void desconectar() throws Exception {
        if (connection != null) {
            connection.close();
        }
    }

    public void insertarImagen(String usuarioCorreo, String nombreImagen) throws Exception {
        String sql = "INSERT INTO imgperfil (usuario_correo, nombre) VALUES (?, ?)";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, usuarioCorreo);
        preparedStatement.setString(2, nombreImagen);
        preparedStatement.executeUpdate();
    }
}
