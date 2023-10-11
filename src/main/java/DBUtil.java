import java.sql.Connection;

import java.sql.DriverManager;



import java.sql.SQLException;



public class DBUtil {
	/*
	 * private static final String URL =
	 * "jdbc:mysql://localhost:3306/incident_report"; private static final String
	 * USERNAME = "root"; private static final String PASSWORD = "root";
	 * 
	 * public static Connection getConnection() throws SQLException { return
	 * DriverManager.getConnection(URL, USERNAME, PASSWORD); }
	 */
	
	private static final String JDBC_URL = "jdbc:mysql://127.0.0.1:3306/incident_report?useSSL=false";


	private static final String jdbcUsername = "root";

	private static final String jdbcPassword = "root";

 

	

 

	//Connection jdbcConnection = null;

 

	public static Connection getConnection() throws SQLException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Connected with MySQL");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return DriverManager.getConnection(JDBC_URL, jdbcUsername, jdbcPassword);

	}
}

