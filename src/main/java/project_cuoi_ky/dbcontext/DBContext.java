package project_cuoi_ky.dbcontext;

import java.sql.Connection;

public class DBContext {
	private static Connection connection = MySqlConnection.getConnection();
	public static Connection getConnection() {
		return connection;
	}
}
