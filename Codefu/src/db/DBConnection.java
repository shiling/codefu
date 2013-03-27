package db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	
	public static String hostname = "codefudb.c5ajxba0h95h.ap-southeast-1.rds.amazonaws.com";
	public static String port = "3306";
	public static String dbName = "codefuDB";
	public static String username = "root";
	public static String password = "ilovejava";
	
	public static Connection GetConnection(){
		
		try {
			
	      Class.forName("com.mysql.jdbc.Driver");
	      // Setup the connection with the DB
	      String jdbcUrl = "jdbc:mysql://" + hostname + ":" + port + "/" + dbName + "?user=" + username + "&password=" + password;
	      Connection conn = DriverManager.getConnection(jdbcUrl);
	      return conn;
	      
		}catch(Exception e){
			//TODO: log
			return null;
		}    
		
	}
}
