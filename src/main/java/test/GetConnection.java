package test;

import java.sql.Connection;
import java.sql.DriverManager;

public class GetConnection {
	private static Connection con;
	static {
		try {
			Class.forName(DbInfo.driver);
			con=DriverManager.getConnection(DbInfo.url,DbInfo.userName,DbInfo.password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public Connection getCon() {
		return con;
	}
}