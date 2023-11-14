/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package logica;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import conexion.conexionbd;




public class DatosBD {
    private conexionbd bd;

    public DatosBD() {
        bd = new conexionbd();
        bd.conectar(); // Establece la conexión a la base de datos
    }

    public List<Vehiculo> obtenerDatosDesdeBD() {
        List<Vehiculo> listaVehiculos = new ArrayList<>();

        Connection connection = bd.getSQLConexion();
        PreparedStatement preparedStatement = null;

        try {
            // Define la consulta SQL para obtener datos de la tabla "motocicletas"
            String sql = "SELECT * FROM motocicletas";

            preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                String placa = resultSet.getString("placa");
                String modelo = resultSet.getString("modelo");
                String linea = resultSet.getString("linea");
                String color = resultSet.getString("color");
                String cilindraje = resultSet.getString("cilindraje");

                // Crea una instancia de Vehiculo y agrega los datos a la lista
                Vehiculo vehiculo = new Vehiculo(placa, modelo, linea, color, cilindraje);
                listaVehiculos.add(vehiculo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return listaVehiculos;
    }

    public class Vehiculo {
        private String placa;
        private String modelo;
        private String linea;
        private String color;
        private String cilindraje;

        public Vehiculo(String placa, String modelo, String linea, String color, String cilindraje) {
            this.placa = placa;
            this.modelo = modelo;
            this.linea = linea;
            this.color = color;
            this.cilindraje = cilindraje;
        }

        public String getPlaca() {
            return placa;
        }

        public String getModelo() {
            return modelo;
        }

        public String getLinea() {
            return linea;
        }

        public String getColor() {
            return color;
        }

        public String getCilindraje() {
            return cilindraje;
        }
    }
}
