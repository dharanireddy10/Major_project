package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class Database {

	 public static Connection getConnection() {
	        Connection con = null;
	        try {
	            Class.forName("com.mysql.jdbc.Driver");
	            String url = "jdbc:mysql://localhost:3306/VTJCC08_2025";
	            con = DriverManager.getConnection(url, "root", "root");
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return con;
	    }

	

}
