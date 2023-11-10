package conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Properties;
import java.util.UUID;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class tokens {
    private Connection conn;
    private static final String URL_BD = "jdbc:mysql://localhost:3306/motosoft";
    private static final String USUARIO_BD = "root";
    private static final String CONTRASENA_BD = "";

    public void conectar() {
        try {
            conn = DriverManager.getConnection(URL_BD, USUARIO_BD, CONTRASENA_BD);
            System.out.println("Conexión a la base de datos exitosa.");
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Error al conectar a la base de datos.");
        }
    }

    public void desconectar() {
        try {
            if (conn != null) {
                conn.close();
                System.out.println("Desconexión de la base de datos exitosa.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Error al desconectar de la base de datos.");
        }
    }

    public boolean validarCorreoRegistrado(String correo) {
        boolean correoRegistrado = false;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            String consulta = "SELECT COUNT(*) FROM usuarios WHERE correo = ?";
            stmt = conn.prepareStatement(consulta);
            stmt.setString(1, correo);
            rs = stmt.executeQuery();

            if (rs.next()) {
                int count = rs.getInt(1);
                correoRegistrado = (count > 0);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return correoRegistrado;
    }

    public String generarTokenUnico() {
        return UUID.randomUUID().toString();
    }

    public void insertarTokenEnBaseDeDatos(String correo, String token, int minutosExpiracion) {
        PreparedStatement stmt = null;

        try {
            String consulta = "INSERT INTO tokens (correo, id_token, fecha) VALUES (?, ?, ?)";
            stmt = conn.prepareStatement(consulta);
            stmt.setString(1, correo);
            stmt.setString(2, token);

            long tiempoExpiracionMillis = System.currentTimeMillis() + minutosExpiracion * 60 * 1000;
            Timestamp tiempoExpiracion = new Timestamp(tiempoExpiracionMillis);
            stmt.setTimestamp(3, tiempoExpiracion);

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public void enviarTokenPorCorreo(String correoDestinatario, String token) {
        String CORREO_EMISOR = "tu_correo@gmail.com"; // Cambia por tu correo
        String CONTRASENA_EMISOR = "tu_contrasena"; // Cambia por tu contraseña

        String host = "smtp.gmail.com";
        String puerto = "587";
        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", puerto);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(CORREO_EMISOR, CONTRASENA_EMISOR);
            }
        });

        try {
            Message mensaje = new MimeMessage(session);
            mensaje.setFrom(new InternetAddress(CORREO_EMISOR));
            mensaje.setRecipients(Message.RecipientType.TO, InternetAddress.parse(correoDestinatario));
            mensaje.setSubject("Token de acceso");
            mensaje.setText("Tu token de acceso es: " + token);

            Transport.send(mensaje);

            System.out.println("Token enviado exitosamente a " + correoDestinatario);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    public void asignarNuevaContrasena(String correo, String nuevaContrasena) {
        // Aquí puedes implementar la lógica para asignar una nueva contraseña al correo
        System.out.println("Nueva contraseña asignada: " + nuevaContrasena);
    }
}
