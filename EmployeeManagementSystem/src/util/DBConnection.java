package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Utility class to handle Database Connection using JDBC.
 */
public class DBConnection {
    // Database credentials
    private static final String URL = "jdbc:mysql://localhost:3306/EmployeeManagementSystem?useSSL=false&allowPublicKeyRetrieval=true";
    private static final String USER = "root";
    private static final String PASS = "root123";

    /**
     * static method to get a connection to the MySQL database.
     * @return Connection object
     */
    public static Connection getConnection() {
        Connection conn = null;
        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Establish Connection
            conn = DriverManager.getConnection(URL, USER, PASS);
            System.out.println("Database Connected Successfully!");
        } catch (ClassNotFoundException e) {
            System.err.println("JDBC Driver not found: " + e.getMessage());
        } catch (SQLException e) {
            System.err.println("Database connection failed: " + e.getMessage());
        }
        return conn;
    }

    // Main method for a quick connection test
    public static void main(String[] args) {
        Connection testConn = getConnection();
        if (testConn != null) {
            try {
                testConn.close();
                System.out.println("Connection Closed.");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
