package dev.daonq.dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

public class DBHelper {
    private static Connection connection = null;

    public static Connection getConnection() {
        try {
            if (connection == null) {
                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/BooksStoreOnline", "root",
                        "Thisisapassword");
            }
            return connection;
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    public static void closeConnection() {
        try {
            if (connection != null) {
                connection.close();
                connection = null;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public static ResultSet executeQuery(String sql) {
        try {
            return connection.prepareStatement(sql).executeQuery();
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }
}