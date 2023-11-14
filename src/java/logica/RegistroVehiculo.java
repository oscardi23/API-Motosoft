/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package logica;
import java.sql.ResultSet;
import conexion.conexionbd;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


/**
 *
 * @author Oscar Diaz
 */
public class RegistroVehiculo {
     private conexionbd bd;
     
     public RegistroVehiculo() {
        bd = new conexionbd();
        bd.conectar(); // Establece la conexión a la base de datos
    }

     public boolean insertarMotocicleta(String idUsuario, String placa, int modelo, String linea, String color, String cilindraje, String fechaCompra, String numeroChasis, String numeroMotor, String marca) {
         Connection connection = bd.getSQLConexion();
        PreparedStatement preparedStatement = null;
        try {
            // Sentencia SQL para insertar una motocicleta en la tabla correspondiente
            String sql = "INSERT INTO motocicletas (id_usuario, placa, modelo, linea, color, cilindraje, fecha_compra, numero_chasis, numero_motor, marca) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?,?)";

            // Preparar la sentencia SQL
            preparedStatement = connection.prepareStatement(sql);
             preparedStatement.setString(1, idUsuario);
            preparedStatement.setString(2, placa);
            preparedStatement.setInt(3, modelo);
            preparedStatement.setString(4, linea);
            preparedStatement.setString(5, color);
            preparedStatement.setString(6, cilindraje);
            preparedStatement.setString(7, fechaCompra);
            preparedStatement.setString(8, numeroChasis);
            preparedStatement.setString(9, numeroMotor);
            preparedStatement.setString(10, marca);

            // Ejecutar la inserción en la base de datos
            int filasAfectadas = preparedStatement.executeUpdate();

            // Si se insertaron filas en la base de datos, la inserción fue exitosa
            return filasAfectadas > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            // Cerrar recursos (PreparedStatement, Connection)
            try {
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
     
     
    public boolean placaNoRegistrada(conexionbd bd, String placa) {
    // Implementa la lógica para verificar si la placa no está registrada en la base de datos
    String query = "SELECT COUNT(*) FROM motocicleta WHERE placa = ?";
    try {
        PreparedStatement preparedStatement = bd.getSQLConexion().prepareStatement(query);
        preparedStatement.setString(1, placa);
        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.next()) {
            int count = resultSet.getInt(1);
            return count == 0; // Si count es 0, la placa no está registrada
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return false; // En caso de error
}
    
}
