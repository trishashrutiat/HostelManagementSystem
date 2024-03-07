package com.DbUtil;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbUtil {
	 public static Connection initializeDatabase() throws SQLException, ClassNotFoundException
		    {
		        // Initialize all the information regarding
		        // Database Connection
		        String dbDriver = "oracle.jdbc.driver.OracleDriver";
		        String dbURL = "jdbc:oracle:thin:@localhost:1521/";
		        // Database name to access
		        String dbName = "XEPDB1";
		        String dbUsername = "core";
		        String dbPassword = "core";
		        //Load the drivers using the forName() method 
		        Class.forName(dbDriver);
		        //Register the drivers using DriverManager 
		        //Establish a connection using the Connection class object
		        Connection con = DriverManager.getConnection(dbURL + dbName,
		                                                     dbUsername, 
		                                                     dbPassword);
		        return con;
		    }
}
