package Modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DataBaseConnection {
    public static Connection initializeDatabase() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/usuarios";
        String usuario = "root";
        String contrasena = "password";
        
        Connection c = DriverManager.getConnection(url, usuario, contrasena);
        return c;
    }

    public static void main(String[] args) {
        try {
            Connection conn = initializeDatabase();
            if (conn != null) {
                System.out.println("Conexión establecida.");
                conn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

