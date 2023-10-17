package com.general;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseUtil {
    private static final String jdbcURL = "jdbc:postgresql://localhost:5432/blog";
    private static final String usernamePostgres = "postgres";
    private static final String passwordPostgres = "banguchiha1234";

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(jdbcURL, usernamePostgres, passwordPostgres);
    }
}
